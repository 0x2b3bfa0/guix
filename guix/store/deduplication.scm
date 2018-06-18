;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2017 Caleb Ristvedt <caleb.ristvedt@cune.org>
;;; Copyright © 2018 Ludovic Courtès <ludo@gnu.org>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

;;; This houses stuff we do to files when they arrive at the store - resetting
;;; timestamps, deduplicating, etc.

(define-module (guix store deduplication)
  #:use-module (guix hash)
  #:use-module (guix build utils)
  #:use-module (guix base16)
  #:use-module (srfi srfi-11)
  #:use-module (rnrs io ports)
  #:use-module (ice-9 ftw)
  #:use-module (guix serialization)
  #:export (nar-sha256
            deduplicate))

;; Would it be better to just make WRITE-FILE give size as well? I question
;; the general utility of this approach.
(define (counting-wrapper-port output-port)
  "Some custom ports don't implement GET-POSITION at all. But if we want to
figure out how many bytes are being written, we will want to use that. So this
makes a wrapper around a port which implements GET-POSITION."
  (let ((byte-count 0))
    (make-custom-binary-output-port "counting-wrapper"
                                    (lambda (bytes offset count)
                                      (set! byte-count
                                        (+ byte-count count))
                                      (put-bytevector output-port bytes
                                                      offset count)
                                      count)
                                    (lambda ()
                                      byte-count)
                                    #f
                                    (lambda ()
                                      (close-port output-port)))))

(define (nar-sha256 file)
  "Gives the sha256 hash of a file and the size of the file in nar form."
  (let-values (((port get-hash) (open-sha256-port)))
    (let ((wrapper (counting-wrapper-port port)))
      (write-file file wrapper)
      (force-output wrapper)
      (force-output port)
      (let ((hash (get-hash))
            (size (port-position wrapper)))
        (close-port wrapper)
        (values hash size)))))

(define (tempname-in directory)
  "Gives an unused temporary name under DIRECTORY. Not guaranteed to still be
unused by the time you create anything with that name, but a good shot."
  (let ((const-part (string-append directory "/.tmp-link-"
                                   (number->string (getpid)))))
    (let try ((guess-part
               (number->string (random most-positive-fixnum) 16)))
      (if (file-exists? (string-append const-part "-" guess-part))
          (try (number->string (random most-positive-fixnum) 16))
          (string-append const-part "-" guess-part)))))

(define* (get-temp-link target #:optional (link-prefix (dirname target)))
  "Like mkstemp!, but instead of creating a new file and giving you the name,
it creates a new hardlink to TARGET and gives you the name. Since
cross-filesystem hardlinks don't work, the temp link must be created on the
same filesystem - where in that filesystem it is can be controlled by
LINK-PREFIX."
  (let try ((tempname (tempname-in link-prefix)))
    (catch 'system-error
      (lambda ()
        (link target tempname)
        tempname)
      (lambda args
        (if (= (system-error-errno args) EEXIST)
            (try (tempname-in link-prefix))
            (throw 'system-error args))))))

;; There are 3 main kinds of errors we can get from hardlinking: "Too many
;; things link to this" (EMLINK), "this link already exists" (EEXIST), and
;; "can't fit more stuff in this directory" (ENOSPC).

(define (replace-with-link target to-replace)
  "Atomically replace the file TO-REPLACE with a link to TARGET.  Note: TARGET
and TO-REPLACE must be on the same file system."
  (let ((temp-link (get-temp-link target (dirname to-replace))))
    (rename-file temp-link to-replace)))

(define-syntax-rule (false-if-system-error (errors ...) exp ...)
  "Given ERRORS, a list of system error codes to ignore, evaluates EXP... and
return #f if any of the system error codes in the given list are thrown."
  (catch 'system-error
    (lambda ()
      exp ...)
    (lambda args
      (if (member (system-error-errno args) (list errors ...))
          #f
          (apply throw args)))))

(define* (deduplicate path hash #:key (store %store-directory))
  "Check if a store item with sha256 hash HASH already exists.  If so,
replace PATH with a hardlink to the already-existing one.  If not, register
PATH so that future duplicates can hardlink to it.  PATH is assumed to be
under STORE."
  (let* ((links-directory (string-append store "/.links"))
         (link-file       (string-append links-directory "/"
                                         (bytevector->base16-string hash))))
    (mkdir-p links-directory)
    (if (eq? 'directory (stat:type (lstat path)))
        ;; Can't hardlink directories, so hardlink their atoms.
        (for-each (lambda (file)
                    (unless (or (member file '("." ".."))
                                (and (string=? path store)
                                     (string=? file ".links")))
                      (let ((file (string-append path "/" file)))
                        (deduplicate file (nar-sha256 file)
                                     #:store store))))
                  (scandir path))
        (if (file-exists? link-file)
            (false-if-system-error (EMLINK)
                                   (replace-with-link link-file path))
            (catch 'system-error
              (lambda ()
                (link path link-file))
              (lambda args
                (let ((errno (system-error-errno args)))
                  (cond ((= errno EEXIST)
                         ;; Someone else put an entry for PATH in
                         ;; LINKS-DIRECTORY before we could.  Let's use it.
                         (false-if-system-error (EMLINK)
                                                (replace-with-link path link-file)))
                        ((= errno ENOSPC)
                         ;; There's not enough room in the directory index for
                         ;; more entries in .links, but that's fine: we can
                         ;; just stop.
                         #f)
                        (else (apply throw args))))))))))
