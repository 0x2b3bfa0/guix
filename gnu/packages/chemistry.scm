;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2018 Konrad Hinsen <konrad.hinsen@fastmail.net>
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

(define-module (gnu packages chemistry)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (gnu packages python)
  #:use-module (guix build-system python))

(define-public domainfinder
  (package
    (name "domainfinder")
    (version "2.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://bitbucket.org/khinsen/"
                           "domainfinder/downloads/DomainFinder-"
                           version ".tar.gz"))
       (sha256
        (base32
         "1z26lsyf7xwnzwjvimmbla7ckipx6p734w7y0jk2a2fzci8fkdcr"))))
    (build-system python-build-system)
    (inputs
     `(("python-mmtk" ,python2-mmtk)))
    (arguments
     `(#:python ,python-2
       ;; No test suite
       #:tests? #f))
    (home-page "http://dirac.cnrs-orleans.fr/DomainFinder")
    (synopsis "Analysis of dynamical domains in proteins")
    (description "DomainFinder is an interactive program for the determination
and characterization of dynamical domains in proteins.  It can infer dynamical
domains by comparing two protein structures, or from normal mode analysis on a
single structure.  The software is currently not actively maintained and works
only with Python 2 and NumPy < 1.9.")
    (license license:cecill-c)))
