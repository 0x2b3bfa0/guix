;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2015 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2014 John Darrington <jmd@gnu.org>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
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

(define-module (gnu packages gstreamer)
  #:use-module ((guix licenses) #:select (lgpl2.0+ bsd-2 bsd-3 gpl2+))
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages yasm)
  #:use-module (gnu packages xml))

(define-public orc
  (package
    (name "orc")
    (version "0.4.24")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://gstreamer.freedesktop.org/data/src/"
                                  "orc/orc-" version ".tar.xz"))
              (sha256
               (base32
                "16ykgdrgxr6pfpy931p979cs68klvwmk3ii1k0a00wr4nn9x931k"))))
    (build-system gnu-build-system)
    (arguments `(#:phases
                 (alist-cons-before
                  'check 'disable-faulty-test
                  (lambda _
                    ;; XXX Disable the 'test-limits' and 'exec_opcodes_sys'
                    ;; tests, which fail on some machines.  See:
                    ;; https://bugzilla.gnome.org/show_bug.cgi?id=735273
                    (substitute* '("testsuite/test-limits.c"
                                   "testsuite/exec_opcodes_sys.c")
                      (("if \\(error\\) return 1;")
                       "if (error) return 77;")))
                  %standard-phases)))
    (home-page "http://code.entropywave.com/orc/")
    (synopsis "Oil runtime compiler")
    (description
     "Orc is a just-in-time compiler implemented as a library and set of
associated tools for compiling and executing simple programs that operate on
arrays of data.")
    ;; The source code implementing the Marsenne Twister algorithm is licensed
    ;; under the 3-clause BSD license, the rest is under 2-clause BSD license.
    (license (list bsd-2 bsd-3))))

(define-public gstreamer
  (package
    (name "gstreamer")
    (version "1.6.3")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-"
            version ".tar.xz"))
      (sha256
       (base32
        "093zldafh7xh3lrlwzm7j0vvjz6k9ca83wqil40gfz5qcy6mdy92"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (arguments
     `(#:configure-flags
       (list (string-append "--with-html-dir="
                            (assoc-ref %outputs "doc")
                            "/share/gtk-doc/html"))))
    (propagated-inputs `(("glib" ,glib))) ; required by gstreamer-1.0.pc.
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)
       ("glib" ,glib "bin")
       ("gobject-introspection" ,gobject-introspection)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (native-search-paths
     (list (search-path-specification
            (variable "GST_PLUGIN_SYSTEM_PATH")
            (files '("lib/gstreamer-1.0")))))
    (home-page "https://gstreamer.freedesktop.org/")
    (synopsis "Multimedia library")
    (description
     "GStreamer is a library for constructing graphs of media-handling
components.  The applications it supports range from simple Ogg/Vorbis
playback, audio/video streaming to complex audio mixing and video
non-linear editing.

Applications can take advantage of advances in codec and filter technology
transparently.  Developers can add new codecs and filters by writing a
simple plugin with a clean, generic interface.

This package provides the core library and elements.")
    (license lgpl2.0+)))

(define-public gst-plugins-base
  (package
    (name "gst-plugins-base")
    (version "1.6.3")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "https://gstreamer.freedesktop.org/src/" name "/"
                          name "-" version ".tar.xz"))
      (sha256
       (base32
        "0xbskifk95rw7jd85sqjrmqh2kys1bpi0inrxyapx1x4vf7ly5dn"))))
    (build-system gnu-build-system)
    (outputs '("out" "doc"))
    (propagated-inputs
     `(("gstreamer" ,gstreamer))) ; required by gstreamer-plugins-base-1.0.pc
    (inputs
     `(("cdparanoia" ,cdparanoia)
       ("orc" ,orc)
       ("pango" ,pango)
       ("libogg" ,libogg)
       ("libtheora" ,libtheora)
       ("libvorbis" ,libvorbis)
       ("libx11" ,libx11)
       ("zlib" ,zlib)
       ("libXext" ,libxext)
       ("libxv" ,libxv)
       ("alsa-lib" ,alsa-lib)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("glib" ,glib "bin")
        ("gobject-introspection" ,gobject-introspection)
        ("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:parallel-tests? #f ; 'pipelines/tcp' fails in parallel
       #:configure-flags
       (list (string-append "--with-html-dir="
                            (assoc-ref %outputs "doc")
                            "/share/gtk-doc/html"))
       #:phases
       (alist-cons-before
        'configure 'patch
        (lambda _
          (substitute* "tests/check/libs/pbutils.c"
            (("/bin/sh") (which "sh"))))
        %standard-phases)))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis
     "Plugins for the GStreamer multimedia library")
    (description "This package provides an essential exemplary set of plug-ins
for the GStreamer multimedia library.")
    (license lgpl2.0+)))


(define-public gst-plugins-good
  (package
    (name "gst-plugins-good")
    (version "1.6.3")
    (source
     (origin
      (method url-fetch)
      (uri (string-append
            "https://gstreamer.freedesktop.org/src/" name "/"
            name "-" version ".tar.xz"))
      (sha256
       (base32
        "0xx16h0q63gs3pxlzdflnpyssba3vcrh1qnzplg4d0ra1fvrvc94"))))
    (build-system gnu-build-system)
    (inputs
     `(("aalib" ,aalib)
       ("cairo" ,cairo)
       ("flac" ,flac)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("gst-plugins-base" ,gst-plugins-base)
       ("jack" ,jack-1)
       ("libavc1394" ,libavc1394)
       ("libcaca" ,libcaca)
       ("libdv" ,libdv)
       ("libiec61883" ,libiec61883)
       ("libjpeg" ,libjpeg)
       ("libpng" ,libpng)
       ("libshout" ,libshout)
       ("libsoup" ,libsoup)
       ("libvpx" ,libvpx)
       ("orc" ,orc)
       ("pulseaudio" ,pulseaudio)
       ("speex" ,speex)
       ("taglib" ,taglib)
       ("wavpack" ,wavpack)))
    (native-inputs
     `(("glib:bin" ,glib "bin")
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after
          'unpack 'disable-failing-rtprtx-tests
          (lambda _
            ;; Disable rtprtx tests that frequently fail.
            ;; XXX FIXME: Try removing this for version > 1.6.3.
            (substitute* "tests/check/elements/rtprtx.c"
              (("tcase_add_test \\(tc_chain,\
 (test_rtxsender_max_size_packets|test_rtxreceive_data_reconstruction)\\);" all)
               (string-append "/* " all " */")))
            #t)))))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis
     "Plugins for the GStreamer multimedia library")
    (description "GStreamer Good Plug-ins is a set of plug-ins for the
GStreamer multimedia library.  This set contains those plug-ins which the
developers consider to have good quality code and correct functionality.")
    (license lgpl2.0+)))

(define-public gst-plugins-ugly
  (package
    (name "gst-plugins-ugly")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://gstreamer.freedesktop.org/src/"
                           name "/" name "-" version ".tar.xz"))
       (sha256
        (base32
         "0r6h3ys5n90jv3c06crxzcac561z07s4h04hy5i8ybw8qyvzgv1g"))))
    (build-system gnu-build-system)
    (inputs
     `(("gst-plugins-base" ,gst-plugins-base)
       ("liba52" ,liba52)
       ("libmad" ,libmad)
       ("lame" ,lame)
       ("libcdio" ,libcdio)
       ("twolame" ,twolame)
       ("libmpeg2" ,libmpeg2)
       ("libdvdread" ,libdvdread)
       ("libx264" ,libx264)
       ;; TODO:
       ;; * opencore-amr (for the AMR-NB decoder and encoder and the
       ;;   AMR-WB decoder) <http://sourceforge.net/projects/opencore-amr/>
       ("orc" ,orc)))
    (native-inputs
     `(("glib:bin" ,glib "bin")
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis "GStreamer plugins from the \"ugly\" set")
    (description "GStreamer Ugly Plug-ins.  This set contains those plug-ins
which the developers consider to have good quality code but that might pose
distribution problems in some jurisdictions, e.g. due to patent threats.")
    (license lgpl2.0+)))

(define-public gst-libav
  (package
    (name "gst-libav")
    (version "1.6.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gstreamer.freedesktop.org/src/" name "/"
                    name "-" version ".tar.xz"))
              (sha256
               (base32
                "1a9pc7zp5rg0cvpx8gqkr21w73i6p9xa505a34day9f8p3lfim94"))))
    (build-system gnu-build-system)
    (arguments
     '(#:configure-flags '("--with-system-libav")
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'patch-/bin/sh
                     (lambda _
                       (substitute* "gst-libs/ext/libav/configure"
                         (("#! /bin/sh")
                          (string-append "#! "(which "sh")))))))))
    (native-inputs
     `(("pkg-config" ,pkg-config)
       ("python" ,python)))
    (inputs
     `(("gst-plugins-base" ,gst-plugins-base)
       ("ffmpeg" ,ffmpeg)
       ("orc" ,orc)
       ("zlib" ,zlib)))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis "Plugins for the GStreamer multimedia library")
    (description
     "This GStreamer plugin supports a large number of audio and video
compression formats through the use of the libav library.")
    (license gpl2+)))
