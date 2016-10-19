;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2012, 2013 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2016 Efraim Flashner <efraim@flashner.co.il>
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

(define-module (gnu packages zile)
  #:use-module (guix licenses)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages man)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages pkg-config))

(define-public zile
  (package
    (name "zile")
    (version "2.4.13")
    (source (origin
             (method url-fetch)
             (uri (string-append "mirror://gnu/zile/zile-"
                                 version ".tar.gz"))
             (sha256
              (base32
               "03mcg0bxkzprlsx8y6h22w924pzx4a9zr7zm3g11j8j3x9lz75f7"))))
    (build-system gnu-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'patch-/bin/sh
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((bash (assoc-ref inputs "bash")))
               ;; Refer to the actual shell.
               (substitute* '("lib/spawni.c" "src/funcs.c")
                 (("/bin/sh")
                  (string-append bash "/bin/sh")))
               #t))))))
    (inputs
     `(("boehm-gc" ,libgc)
       ("ncurses" ,ncurses)
       ("bash" ,bash)))
    (native-inputs
     `(("perl" ,perl)
       ("help2man" ,help2man)
       ("pkg-config" ,pkg-config)))
    (home-page "https://www.gnu.org/software/zile/")
    (synopsis "Lightweight Emacs clone")
    (description
     "GNU Zile is a lightweight Emacs clone.  It usage is similar to the
default Emacs configuration, but it carries a much lighter feature set.")
    (license gpl3+)))
