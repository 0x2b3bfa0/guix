;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013 Andreas Enge <andreas@enge.fr>
;;; Copyright   2014 John Darrington <jmd@gnu.org>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
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
  #:use-module ((guix licenses) #:select (lgpl2.0+ bsd-2 bsd-3))
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages xml))

(define-public orc
  (package
    (name "orc")
    (version "0.4.23")
    (source (origin
              (method url-fetch)
              (uri (string-append "http://gstreamer.freedesktop.org/data/src/"
                                  "orc/orc-" version ".tar.xz"))
              (sha256
               (base32
                "1ryz1gfgrxcj806cakcblxf0bcwq8p2mw8k86fs3f5wlwayawzkn"))))
    (build-system gnu-build-system)
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
    (version "1.4.5")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-"
                          version ".tar.xz"))
      (sha256
       (base32
        "1bmhbhak6i5wmmb6w86jyyv8lax4gdq983la4lk4a0krz6kim020"))))
    (build-system gnu-build-system)
    (propagated-inputs `(("glib" ,glib))) ; required by gstreamer-1.0.pc.
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)
       ("glib" ,glib "bin")
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("python-wrapper" ,python-wrapper)))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis "Multimedia library")
    (description
     "GStreamer is a library for constructing graphs of media-handling
components.  The applications it supports range from simple Ogg/Vorbis
playback, audio/video streaming to complex audio (mixing) and video
 (non-linear editing) processing.

Applications can take advantage of advances in codec and filter technology
transparently.  Developers can add new codecs and filters by writing a
simple plugin with a clean, generic interface.

This package provides the core library and elements.")
    (license lgpl2.0+)))

(define-public gstreamer-0.10
  (package (inherit gstreamer)
    (version "0.10.36")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-"
                          version ".tar.xz"))
      (sha256
       (base32
        "1nkid1n2l3rrlmq5qrf5yy06grrkwjh3yxl5g0w58w0pih8allci"))
      (patches
        (list (search-patch "gstreamer-0.10-bison3.patch")
              (search-patch "gstreamer-0.10-silly-test.patch")))))
    (propagated-inputs
     `(("libxml2" ,libxml2)))
    (inputs `(("glib" ,glib)))
    (native-inputs
     `(("bison" ,bison)
       ("flex" ,flex)
       ("perl" ,perl)
       ("pkg-config" ,pkg-config)
       ("glib" ,glib "bin")
       ("python" ,python-2)))))


(define-public gst-plugins-base
  (package
    (name "gst-plugins-base")
    (version "1.0.10")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-"
                          version ".tar.xz"))
      (sha256
       (base32
        "1s4pphbb5kpdh4rrmb8rala4sp499k4by59925k15xiz58xyhm4p"))))
    (build-system gnu-build-system)
    (inputs
     `(("glib" ,glib)
       ("pango" ,pango)
       ("libogg" ,libogg)
       ("libtheora" ,libtheora)
       ("libvorbis" ,libvorbis)
       ("libx11" ,libx11)
       ("zlib" ,zlib)
       ("libXext" ,libxext)
       ("libxv" ,libxv)
       ("alsa-lib" ,alsa-lib)
       ("gstreamer" ,gstreamer)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("glib" ,glib "bin")
        ("python-wrapper" ,python-wrapper)))
    (arguments
     `(#:tests? #f))
      ;; All tests pass except for one:
      ;; Running suite(s): pbutils library
      ;; 85%: Checks: 7, Failures: 1, Errors: 0
      ;; libs/pbutils.c:522:F:general:test_pb_utils_install_plugins:0: gst_install_plugins_sync() failed ;; with unexpected ret 201, which is neither HELPER_MISSING nor 1
      ;; FAIL: libs/pbutils
      ;; According to the documentation, "gst_install_plugins_sync (...)
      ;; should almost never be used".
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis
     "Plugins for the GStreamer multimedia library")
    (description "This package provides an essential exemplary set of plug-ins
for the GStreamer multimedia library.")
    (license lgpl2.0+)))


(define-public gst-plugins-good
  (package
    (name "gst-plugins-good")
    (version "1.0.10")
    (source
     (origin
      (method url-fetch)
      (uri (string-append 
            "http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-"
            version ".tar.xz"))
      (sha256
       (base32
        "1bi8ci0jssi8bsa7wbmqcwphl579vvxpshn2qnaggiha13b440y6"))))
    (build-system gnu-build-system)
    (inputs
     `(("glib" ,glib)
       ("cairo" ,cairo)
       ("gdk-pixbuf" ,gdk-pixbuf)
       ("flac" ,flac)
       ("speex" ,speex)
       ("libogg" ,libogg) ;; should be a propagated input of the above
       ("libx11" ,libx11)
       ("zlib" ,zlib)
       ("libpng" ,libpng)
       ("libjpeg" ,libjpeg)
       ("libXext" ,libxext)
       ("libxv" ,libxv)
       ("pulseaudio" ,pulseaudio)
       ("gstreamer" ,gstreamer)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("glib" ,glib "bin")
        ("gst-plugins-base" ,gst-plugins-base)
        ("python-wrapper" ,python-wrapper)))
   (arguments
    `(#:configure-flags (list "--disable-osx_audio" 
                              "--disable-osx_video"
                              "--disable-directsound"
                              "--disable-waveform")))
    (home-page "http://gstreamer.freedesktop.org/")
    (synopsis
     "Plugins for the GStreamer multimedia library")
    (description "GStreamer Good Plug-ins is a set of plug-ins for the
GStreamer multimedia library.  This set contains those plug-ins which the
developers consider to have good quality code and correct functionality.")
    (license lgpl2.0+)))

(define-public gst-plugins-base-0.10
  (package (inherit gst-plugins-base)
    (version "0.10.36")
    (source
     (origin
      (method url-fetch)
      (uri (string-append 
            "http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-"
            version ".tar.xz"))
      (sha256
       (base32
        "0jp6hjlra98cnkal4n6bdmr577q8mcyp3c08s3a02c4hjhw5rr0z"))))
    (inputs
     `(("glib" ,glib)
       ("gstreamer" ,gstreamer-0.10)))
    (native-inputs
      `(("pkg-config" ,pkg-config)
        ("glib" ,glib "bin")
        ("python" ,python-2)))))
