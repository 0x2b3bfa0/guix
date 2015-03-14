;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014 Andreas Enge <andreas@enge.fr>
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

(define-module (gnu packages curl)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gnutls)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages gsasl)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages openldap)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages ssh))

(define-public curl
  (package
   (name "curl")
   (version "7.40.0")
   (source (origin
            (method url-fetch)
            (uri (string-append "http://curl.haxx.se/download/curl-"
                                version ".tar.lzma"))
            (sha256
             (base32
              "1a15fdc26b3vwwmchzzpd3l1hfyhx06dn7b6lkikqd7kgwvg5ps7"))
            (patches (list (search-patch "curl-gss-api-fix.patch")))))
   (build-system gnu-build-system)
   (inputs `(("gnutls" ,gnutls)
             ("gss" ,gss)
             ("libidn" ,libidn)
             ("libssh2" ,libssh2)
             ("openldap" ,openldap)
             ("zlib" ,zlib)))
   (native-inputs
     `(("perl" ,perl)
       ;; to enable the --manual option and make test 1026 pass
       ("groff" ,groff)
       ("pkg-config" ,pkg-config)
       ("python" ,python-2)))
   (arguments
    `(#:configure-flags '("--with-gnutls" "--with-gssapi")
      ;; Add a phase to patch '/bin/sh' occurances in tests/runtests.pl
      #:phases
      (alist-replace
       'check
       (lambda _
         (substitute* "tests/runtests.pl"
           (("/bin/sh") (which "sh")))

         ;; The top-level "make check" does "make -C tests quiet-test", which
         ;; is too quiet.  Use the "test" target instead, which is more
         ;; verbose.
         (zero? (system* "make" "-C" "tests" "test")))
       %standard-phases)))
   (synopsis "Command line tool for transferring data with URL syntax")
   (description
    "curl is a command line tool for transferring data with URL syntax,
supporting DICT, FILE, FTP, FTPS, Gopher, HTTP, HTTPS, IMAP, IMAPS, LDAP,
LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, Telnet and TFTP.
curl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading,
HTTP form based upload, proxies, cookies, user+password authentication
(Basic, Digest, NTLM, Negotiate, kerberos...), file transfer resume,
proxy tunneling, and so on")
   (license (license:non-copyleft "file://COPYING"
                       "See COPYING in the distribution."))
   (home-page "http://curl.haxx.se/")))
