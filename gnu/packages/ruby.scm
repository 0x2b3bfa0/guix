;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2014 Pjotr Prins <pjotr.guix@thebird.nl>
;;; Copyright © 2014 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2014, 2015 Mark H Weaver <mhw@netris.org>
;;; Copyright © 2014 David Thompson <davet@gnu.org>
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

(define-module (gnu packages ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages openssl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages gdbm)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system ruby))

(define-public ruby
  (package
    (name "ruby")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://cache.ruby-lang.org/pub/ruby/"
                           (version-major+minor version)
                           "/ruby-" version ".tar.xz"))
       (sha256
        (base32
         "1h16lrahp1m57la6sllsad0n3d72g9ccg62n5fxd04nwgz054a1v"))))
    (build-system gnu-build-system)
    (arguments
     `(#:test-target "test"
       #:parallel-tests? #f
       #:phases
       (alist-cons-before
        'configure 'replace-bin-sh
        (lambda _
          (substitute* '("Makefile.in"
                         "ext/pty/pty.c"
                         "io.c"
                         "lib/mkmf.rb"
                         "process.c"
                         "test/rubygems/test_gem_ext_configure_builder.rb"
                         "test/rdoc/test_rdoc_parser.rb"
                         "test/ruby/test_rubyoptions.rb"
                         "test/ruby/test_process.rb"
                         "test/ruby/test_system.rb"
                         "tool/rbinstall.rb")
            (("/bin/sh") (which "sh"))))
        %standard-phases)))
    (inputs
     `(("readline" ,readline)
       ("openssl" ,openssl)
       ("libffi" ,libffi)
       ("gdbm" ,gdbm)
       ("zlib" ,zlib)))
    (native-search-paths
     (list (search-path-specification
            (variable "GEM_PATH")
            (files (list (string-append "lib/ruby/gems/"
                                        (version-major+minor version)
                                        ".0"))))))
    (synopsis "Programming language interpreter")
    (description "Ruby is a dynamic object-oriented programming language with
a focus on simplicity and productivity.")
    (home-page "https://ruby-lang.org")
    (license license:ruby)))

(define-public ruby-1.8
  (package (inherit ruby)
    (version "1.8.7-p374")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "http://cache.ruby-lang.org/pub/ruby/"
                           (version-major+minor version)
                           "/ruby-" version ".tar.bz2"))
       (sha256
        (base32
         "1qq7khilwkayrhwmzlxk83scrmiqfi7lgsn4c63znyvz2c1lgqxl"))))
    (native-search-paths '())
    (arguments
     `(#:test-target "test"
       #:parallel-tests? #f
       #:phases
        (alist-cons-before
         'configure 'replace-bin-sh
         (lambda _
           (substitute* '("Makefile.in"
                          "ext/pty/pty.c"
                          "io.c"
                          "lib/mkmf.rb"
                          "process.c")
             (("/bin/sh") (which "sh"))))
         %standard-phases)))))

(define-public ruby-hoe
  (package
    (name "ruby-hoe")
    (version "3.13.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/seattlerb/hoe.git")
                    (commit "0c11836"))) ; no release tags :(
              (sha256
               (base32
                "0i8dimf8kxcjgqj9x65bbi3l6hc9p9gbfbb1vmrz42764a4jjbz9"))) )
    (build-system ruby-build-system)
    (arguments
     '(#:phases (alist-replace
                 'build
                 (lambda _ (zero? (system* "rake" "gem")))
                 %standard-phases)))
    (synopsis "Ruby project management helper")
    (description
     "Hoe is a rake/rubygems helper for project Rakefiles.  It helps manage,
maintain, and release projects and includes a dynamic plug-in system allowing
for easy extensibility.  Hoe ships with plug-ins for all the usual project
tasks including rdoc generation, testing, packaging, deployment, and
announcement.")
    (home-page "http://www.zenspider.com/projects/hoe.html")
    (license license:expat)))

(define-public ruby-i18n
  (package
    (name "ruby-i18n")
    (version "0.6.11")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://github.com/svenfuchs/i18n/archive/v"
                                  version ".tar.gz"))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1fdhnhh1p5g8vibv44d770z8nq208zrms3m2nswdvr54072y1m6k"))))
    (build-system ruby-build-system)
    (arguments
     '(#:tests? #f)) ; requires bundler
    (synopsis "Internationalization library for Ruby")
    (description "Ruby i18n is an internationalization and localization
solution for Ruby programs.  It features translation and localization,
interpolation of values to translations, pluralization, customizable
transliteration to ASCII, flexible defaults, bulk lookup, lambdas as
translation data, custom key/scope separator, custom exception handlers, and
an extensible architecture with a swappable backend.")
    (home-page "http://github.com/svenfuchs/i18n")
    (license license:expat)))
