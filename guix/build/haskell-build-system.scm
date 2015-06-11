;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015 Federico Beffa <beffa@fbengineering.ch>
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

(define-module (guix build haskell-build-system)
  #:use-module ((guix build gnu-build-system) #:prefix gnu:)
  #:use-module (guix build utils)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 rdelim)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 match)
  #:export (%standard-phases
            haskell-build))

;; Commentary:
;;
;; Builder-side code of the standard Haskell package build procedure.
;;
;; The Haskell compiler, to find libraries, relies on a library database with
;; a binary cache. For GHC the cache has to be named 'package.cache'. If every
;; library would generate the cache at build time, then they would clash in
;; profiles. For this reason we do not generate the cache when we generate
;; libraries substitutes. Instead:
;;
;; - At build time we use the 'setup-compiler' phase to generate a temporary
;;   library database and its cache.
;;
;; - We generate the cache when a profile is created.
;;
;; Code:

;; Directory where we create the temporary libraries database with its cache
;; as required by the compiler.
(define %tmp-db-dir
  (string-append (or (getenv "TMP") "/tmp")
                 "/package.conf.d"))

(define (run-setuphs command params)
  (let ((setup-file (cond
                     ((file-exists? "Setup.hs")
                      "Setup.hs")
                     ((file-exists? "Setup.lhs")
                      "Setup.lhs")
                     (else
                      #f))))
    (if setup-file
        (begin
          (format #t "running \"runhaskell Setup.hs\" with command ~s \
and parameters ~s~%"
                  command params)
          (zero? (apply system* "runhaskell" setup-file command params)))
        (error "no Setup.hs nor Setup.lhs found"))))

(define* (configure #:key outputs inputs tests? (configure-flags '())
                    #:allow-other-keys)
  "Configure a given Haskell package."
  (let* ((out (assoc-ref outputs "out"))
         (doc (assoc-ref outputs "doc"))
         (lib (assoc-ref outputs "lib"))
         (bin (assoc-ref outputs "bin"))
         (input-dirs (match inputs
                       (((_ . dir) ...)
                        dir)
                       (_ '())))
         (params (append `(,(string-append "--prefix=" out))
                         `(,(string-append "--libdir=" (or lib out) "/lib"))
                         `(,(string-append "--bindir=" (or bin out) "/bin"))
                         `(,(string-append
                             "--docdir=" (or doc out)
                             "/share/doc/" (package-name-version out)))
                         '("--libsubdir=$compiler/$pkg-$version")
                         `(,(string-append "--package-db=" %tmp-db-dir))
                         '("--global")
                         `(,@(map
                              (cut string-append "--extra-include-dirs=" <>)
                              (search-path-as-list '("include") input-dirs)))
                         `(,@(map
                              (cut string-append "--extra-lib-dirs=" <>)
                              (search-path-as-list '("lib") input-dirs)))
                         (if tests?
                             '("--enable-tests")
                             '())
                         configure-flags)))
    (run-setuphs "configure" params)))

(define* (build #:rest empty)
  "Build a given Haskell package."
  (run-setuphs "build" '()))

(define* (install #:rest empty)
  "Install a given Haskell package."
  (run-setuphs "copy" '()))

(define (package-name-version store-dir)
  "Given a store directory STORE-DIR return 'name-version' of the package."
  (let* ((base (basename store-dir)))
    (string-drop base
                 (+ 1 (string-index base #\-)))))

(define (grep rx port)
  "Given a regular-expression RX including a group, read from PORT until the
first match and return the content of the group."
  (let ((line (read-line port)))
    (if (eof-object? line)
        #f
        (let ((rx-result (regexp-exec rx line)))
          (if rx-result
              (match:substring rx-result 1)
              (grep rx port))))))

(define* (setup-compiler #:key system inputs outputs #:allow-other-keys)
  "Setup the compiler environment."
  (let* ((haskell (assoc-ref inputs "haskell"))
         (name-version (package-name-version haskell)))
    (cond
     ((string-match "ghc" name-version)
      (make-ghc-package-database system inputs outputs))
     (else
      (format #t
              "Compiler ~a not supported~%" name-version)))))

(define (make-ghc-package-database system inputs outputs)
  "Generate the GHC package database."
  (let* ((haskell  (assoc-ref inputs "haskell"))
         (input-dirs (match inputs
                       (((_ . dir) ...)
                        dir)
                       (_ '())))
         (conf-dirs (search-path-as-list
                     `(,(string-append "lib/"
                                       (package-name-version haskell)
                                       "/package.conf.d"))
                     input-dirs))
         (conf-files (append-map (cut find-files <> "\\.conf$") conf-dirs)))
    (mkdir-p %tmp-db-dir)
    (for-each (lambda (file)
                (copy-file file
                           (string-append %tmp-db-dir "/" (basename file))))
              conf-files)
    (zero? (system* "ghc-pkg"
                    (string-append "--package-db=" %tmp-db-dir)
                    "recache"))))

(define* (register #:key name system inputs outputs #:allow-other-keys)
  "Generate the compiler registration file for a given Haskell package.  Don't
generate the cache as it would clash in user profiles."
  (let* ((out (assoc-ref outputs "out"))
         (haskell  (assoc-ref inputs "haskell"))
         (lib (string-append out "/lib"))
         (config-dir (string-append lib "/"
                                    (package-name-version haskell)
                                    "/package.conf.d"))
         (id-rx (make-regexp "^id: *(.*)$"))
         (config-file (string-append out "/" name ".conf"))
         (params
          (list (string-append "--gen-pkg-config=" config-file))))
    (run-setuphs "register" params)
    ;; The conf file is created only when there is a library to register.
    (when (file-exists? config-file)
      (mkdir-p config-dir)
      (let ((config-file-name+id
             (call-with-ascii-input-file config-file (cut grep id-rx <>))))
        (rename-file config-file
                     (string-append config-dir "/" config-file-name+id
                                    ".conf"))))
    #t))

(define* (check #:key tests? test-target #:allow-other-keys)
  "Run the test suite of a given Haskell package."
  (if tests?
      (run-setuphs test-target '())
      (begin
        (format #t "test suite not run~%")
        #t)))

(define* (haddock #:key outputs haddock? haddock-flags #:allow-other-keys)
  "Run the test suite of a given Haskell package."
  (if haddock?
      (run-setuphs "haddock" haddock-flags)
      #t))

(define %standard-phases
  (modify-phases gnu:%standard-phases
    (add-before 'configure 'setup-compiler setup-compiler)
    (add-before 'install 'haddock haddock)
    (add-after 'install 'register register)
    (replace 'install install)
    (replace 'check check)
    (replace 'build build)
    (replace 'configure configure)))

(define* (haskell-build #:key inputs (phases %standard-phases)
                        #:allow-other-keys #:rest args)
  "Build the given Haskell package, applying all of PHASES in order."
  (apply gnu:gnu-build
         #:inputs inputs #:phases phases
         args))

;;; haskell-build-system.scm ends here
