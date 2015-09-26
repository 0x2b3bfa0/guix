;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2012, 2013 Nikita Karetnikov <nikita@karetnikov.org>
;;; Copyright © 2015 Mark H Weaver <mhw@netris.org>
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

(define-module (gnu packages disk)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages check)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages guile)
  #:use-module ((gnu packages compression)
                #:select (lzip)))

(define-public parted
  (package
    (name "parted")
    (version "3.1")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnu/parted/parted-"
                          version ".tar.xz"))
      (sha256
       (base32
        "05fa4m1bky9d13hqv91jlnngzlyn7y4rnnyq6d86w0dg3vww372y"))))
    (build-system gnu-build-system)
    (arguments `(#:configure-flags '("--disable-device-mapper")
                 #:phases (alist-cons-before
                           'configure 'fix-mkswap
                           (lambda* (#:key inputs #:allow-other-keys)
                             (let ((util-linux (assoc-ref inputs
                                                          "util-linux")))
                               (substitute*
                                   "tests/t9050-partition-table-types.sh"
                                 (("mkswap")
                                  (string-append util-linux "/sbin/mkswap")))))
                           %standard-phases)))
    (inputs
     ;; XXX: add 'lvm2'.
     `(("check" ,check)

       ;; With Readline 6.3, parted/ui.c fails to build because it uses the
       ;; now undefined 'CPPFunction' type.
       ("readline" ,readline-6.2)

       ("util-linux" ,util-linux)))
    (native-inputs
     `(("gettext" ,gnu-gettext)))
    (home-page "http://www.gnu.org/software/parted/")
    (synopsis "Disk partition editor")
    (description
     "GNU Parted is a package for creating and manipulating disk partition
tables.  It includes a library and command-line utility.")
    (license gpl3+)))

(define-public fdisk
  (package
    (name "fdisk")
    (version "2.0.0a")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnu/fdisk/gnufdisk-"
                          version ".tar.gz"))
      (sha256
       (base32
        "04nd7civ561x2lwcmxhsqbprml3178jfc58fy1v7hzqg5k4nbhy3"))))
    (build-system gnu-build-system)
    (inputs
     `(("gettext" ,gnu-gettext)
       ("guile" ,guile-1.8)
       ("util-linux" ,util-linux)
       ("parted" ,parted)))
    (home-page "https://www.gnu.org/software/fdisk/")
    (synopsis "Low-level disk partitioning and formatting")
    (description
     "GNU fdisk provides a GNU version of the common disk partitioning tool
fdisk.  fdisk is used for the creation and manipulation of disk partition
tables, and it understands a variety of different formats.")
    (license gpl3+)))

(define-public ddrescue
  (package
    (name "ddrescue")
    (version "1.20")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnu/ddrescue/ddrescue-"
                          version ".tar.lz"))
      (sha256
       (base32
        "1gb0ak2c47nass7qdf9pnfrshcb38c318z1fx5v5v1k7l6qr7yc3"))))
    (build-system gnu-build-system)
    (home-page "http://www.gnu.org/software/ddrescue/ddrescue.html")
    (synopsis "Data recovery utility")
    (native-inputs `(("lzip" ,lzip)))
    (description
     "GNU ddrescue is a fully automated data recovery tool.  It copies data
from one file to another, working to rescue data in case of read errors.  The
program also includes a tool for manipulating its log files, which are used
to recover data more efficiently by only reading the necessary blocks.")
    (license gpl3+)))

(define-public dosfstools
  (package
    (name "dosfstools")
    (version "3.0.27")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/" name "/" name
                           "/releases/download/v" version "/"
                           name "-" version ".tar.xz"))
       (sha256
        (base32
         "1a2qs5g2zqbk1gzaaf4v3fw3yny6jgbzddpgcamkp3fjifn8wxl5"))))
    (build-system gnu-build-system)
    (arguments
     `(#:make-flags (list (string-append "PREFIX=" %output)
                          "CC=gcc")
       #:tests? #f  ;no tests
       #:phases (modify-phases %standard-phases
                  (delete 'configure))))
    (home-page "https://github.com/dosfstools/dosfstools")
    (synopsis "Utilities for making and checking MS-DOS FAT filesystems")
    (description
     "The dosfstools package includes the mkfs.fat and fsck.fat utilities,
which respectively make and check MS-DOS FAT filesystems.")
    (license gpl3+)))
