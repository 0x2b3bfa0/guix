;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 Taylan Ulrich Bayırlı/Kammer <taylanbayirli@gmail.com>
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

(use-modules (system base target)
             (ice-9 match)
             (ice-9 threads)
             (guix build utils))

(define compile-options '(format unbound-variable arity-mismatch))

(define host (getenv "host"))

(define srcdir (getenv "srcdir"))

(define (relative-file file)
  (if (string-prefix? (string-append srcdir "/") file)
      (string-drop file (+ 1 (string-length srcdir)))
      file))

(define (file-mtime<? f1 f2)
  (< (stat:mtime (stat f1))
     (stat:mtime (stat f2))))

(define (scm->go file)
  (let* ((relative (relative-file file))
         (without-extension (string-drop-right relative 4)))
    (string-append without-extension ".go")))

(define (file-needs-compilation? file)
  (let ((go (scm->go file)))
    (or (not (file-exists? go))
        (file-mtime<? go file))))

(define (file->module file)
  (let* ((relative (relative-file file))
         (module-path (string-drop-right relative 4)))
    (map string->symbol
         (string-split module-path #\/))))

;;; To work around <http://bugs.gnu.org/15602> (FIXME), we want to load all
;;; files to be compiled first.  We do this via resolve-interface so that the
;;; top-level of each file (module) is only executed once.
(define (load-module-file file)
  (let ((module (file->module file)))
    (format #t "  LOAD     ~a~%" module)
    (resolve-interface module)))

(define (compile-file* file output-mutex)
  (let ((go (scm->go file)))
    (with-mutex output-mutex
      (format #t "  GUILEC   ~a~%" go)
      (force-output))
    (mkdir-p (dirname go))
    (with-target host
      (lambda ()
        (compile-file file
                      #:output-file go
                      #:opts compile-options)))))

(match (command-line)
  ((_ . files)
   (let ((files (filter file-needs-compilation? files)))
     (for-each load-module-file files)
     (let ((mutex (make-mutex)))
       (par-for-each (lambda (file)
                       (compile-file* file mutex))
                     files)))))
