;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2015, 2016, 2017, 2018, 2019 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017, 2018 Roel Janssen <roel@gnu.org>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2017 Raoul Bonnal <ilpuccio.febo@gmail.com>
;;; Copyright © 2018 Vijayalakshmi Vedantham <vijimay12@gmail.com>
;;; Copyright © 2018 Sahithi Yarlagadda <sahi@swecha.net>
;;; Copyright © 2018 Sandeep Subramanian <sandeepsubramanian94@gmail.com>
;;; Copyright © 2018 Charlie Ritter <chewzeirta@posteo.net>
;;; Copyright © 2018 Konrad Hinsen <konrad.hinsen@fastmail.net>
;;; Copyright © 2018 Mădălin Ionel Patrașcu <madalinionel.patrascu@mdc-berlin.de>
;;; Copyright © 2018 Laura Lazzati <laura.lazzati.15@gmail.com>
;;; Copyright © 2018 Leo Famulari <leo@famulari.name>
;;; Copyright © 2018 Marius Bakke <mbakke@fastmail.com>
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

(define-module (gnu packages cran)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system r)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell)
  #:use-module (gnu packages image)
  #:use-module (gnu packages javascript)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpi)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xorg))

(define-public r-clipr
  (package
    (name "r-clipr")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "clipr" version))
       (sha256
        (base32
         "061x84ildc7g1p91yw5iyj8lpqdf4hqv36as85lw8c6qv9ywbsqv"))))
    (build-system r-build-system)
    (home-page "https://github.com/mdlincoln/clipr")
    (synopsis "Read and write from the system clipboard")
    (description
     "This package provides simple utility functions to read from and write to
the system clipboards.")
    (license license:gpl3)))

(define-public r-tidyverse
  (package
    (name "r-tidyverse")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tidyverse" version))
       (sha256
        (base32
         "0yy3fkjksgcn6wkbgsb0pbnmsyqs4m01mziqafhig578nixs4rxd"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-dbplyr" ,r-dbplyr)
       ("r-dplyr" ,r-dplyr)
       ("r-forcats" ,r-forcats)
       ("r-ggplot2" ,r-ggplot2)
       ("r-haven" ,r-haven)
       ("r-hms" ,r-hms)
       ("r-httr" ,r-httr)
       ("r-jsonlite" ,r-jsonlite)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-modelr" ,r-modelr)
       ("r-purrr" ,r-purrr)
       ("r-readr" ,r-readr)
       ("r-readxl" ,r-readxl)
       ("r-reprex" ,r-reprex)
       ("r-rlang" ,r-rlang)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-rvest" ,r-rvest)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://tidyverse.tidyverse.org")
    (synopsis "Install and load packages from the \"Tidyverse\"")
    (description
     "The @code{tidyverse} is a set of packages that work in harmony because
they share common data representations and API design.  This package is
designed to make it easy to install and load multiple tidyverse packages in a
single step.")
    (license license:gpl3)))

(define-public r-rvest
  (package
    (name "r-rvest")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rvest" version))
       (sha256
        (base32
         "04mv99z8dixywx96kfy4215g6ib23s7qvd77hcf9pxqxzcvqhvhd"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-httr" ,r-httr)
       ("r-magrittr" ,r-magrittr)
       ("r-selectr" ,r-selectr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://github.com/hadley/rvest")
    (synopsis "Simple web scraping for R")
    (description
     "@code{r-rvest} helps you scrape information from web pages.  It is
designed to work with @code{magrittr} to make it easy to express common web
scraping tasks, inspired by libraries like @code{BeautifulSoup}.")
    (license license:gpl3)))

(define-public r-selectr
  (package
    (name "r-selectr")
    (version "0.4-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "selectr" version))
       (sha256
        (base32
         "1jp27rxks4w29l47k42869hp8hnkzq2rnvsqbr44wd19fqb2zm4b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-stringr" ,r-stringr)
       ("r-r6" ,r-r6)))
    (home-page "https://sjp.co.nz/projects/selectr/")
    (synopsis "Translate CSS selectors to XPath expressions")
    (description
     "@code{r-selectr} translates a CSS3 selector into an equivalent XPath
expression.  This allows you to use CSS selectors when working with the XML
package as it can only evaluate XPath expressions.  Also provided are
convenience functions useful for using CSS selectors on XML nodes.  This
package is a port of the Python package @code{cssselect}.")
    (license license:bsd-3)))

(define-public r-reprex
  (package
    (name "r-reprex")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reprex" version))
       (sha256
        (base32
         "1ws5gds453xgfili87r35rz1wn2i7jbqissq98csbiddpkgls8sx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-clipr" ,r-clipr)
       ("r-fs" ,r-fs)
       ("r-rlang" ,r-rlang)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-whisker" ,r-whisker)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/tidyverse/reprex")
    (synopsis "Prepare reproducible R code examples for sharing")
    (description
     "This package provides a convenience wrapper that uses the
@code{rmarkdown} package to render small snippets of code to target formats
that include both code and output.  The goal is to encourage the sharing of
small, reproducible, and runnable examples on code-oriented websites or email.
@code{reprex} also extracts clean, runnable R code from various common formats,
such as copy/paste from an R session.")
    (license license:expat)))

(define-public r-callr
  (package
    (name "r-callr")
    (version "3.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "callr" version))
       (sha256
        (base32
         "1rxbxy6kn7dj90z9hpppr9cnpvnxzknba2dwrdp0lrk5dh462qz3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-r6" ,r-r6)
       ("r-processx" ,r-processx)))
    (home-page "https://github.com/r-lib/callr#readme")
    (synopsis "Call R from R")
    (description
     "It is sometimes useful to perform a computation in a separate R process,
without affecting the current R process at all.  This packages does exactly
that.")
    (license license:expat)))

(define-public r-readxl
  (package
    (name "r-readxl")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "readxl" version))
       (sha256
        (base32
         "05ii8knrg4jji6h7bv6bfpn279b6x52yrskdx5rv7b0hcpy22gdn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cellranger" ,r-cellranger)
       ("r-rcpp" ,r-rcpp)
       ("r-tibble" ,r-tibble)))
    (home-page "https://readxl.tidyverse.org")
    (synopsis "Read Excel files")
    (description
     "This package lets you import Excel files into R.  It supports
@file{.xls} via the embedded @code{libxls} C library and @file{.xlsx} via
the embedded @code{RapidXML} C++ library.")
    ;; XXX: This package bundles a copy of 'libxsl' which is BSD-2 and
    ;; 'rapidxml' which is Boost.
    (license (list license:gpl3 license:bsd-2 license:boost1.0))))

(define-public r-modelr
  (package
    (name "r-modelr")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "modelr" version))
       (sha256
        (base32
         "09whg3q5xq6csbqwgwfwav09vda8vgady5j70sk52xcn232k363a"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-lazyeval" ,r-lazyeval)
       ("r-magrittr" ,r-magrittr)
       ("r-purrr" ,r-purrr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/tidyverse/modelr")
    (synopsis "Helper functions for modelling in pipelines")
    (description
     "Functions for modelling that help you seamlessly integrate modelling
into a pipeline of data manipulation and visualisation.")
    (license license:gpl3)))

(define-public r-httpuv
  (package
    (name "r-httpuv")
    (version "1.4.5")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "httpuv" version))
              (sha256
               (base32
                "1ddpcarzf694h0gy5pdz7l5glqfv4hr9dmxb4vw7yqd0bga174gi"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-rcpp" ,r-rcpp)
       ("pkg-config" ,pkg-config)))
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-later" ,r-later)
       ("r-promises" ,r-promises)))
    (home-page "https://github.com/rstudio/httpuv")
    (synopsis "HTTP and WebSocket server library for R")
    (description
     "The httpuv package provides low-level socket and protocol support for
handling HTTP and WebSocket requests directly from within R.  It is primarily
intended as a building block for other packages, rather than making it
particularly easy to create complete web applications using httpuv alone.")
    ;; This package includes third-party code that was originally released
    ;; under various non-copyleft licenses.  Full licensing information can be
    ;; obtained here: https://github.com/rstudio/httpuv/blob/master/LICENSE
    (license license:gpl3+)))

(define-public r-jsonlite
  (package
    (name "r-jsonlite")
    (version "1.5")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "jsonlite" version))
              (sha256
               (base32
                "00lfg464jhf7k01bal9pcjvbdf5cxk6xi2h46hccp1x3h883g434"))))
    (build-system r-build-system)
    (home-page "http://arxiv.org/abs/1403.2805")
    (synopsis "Robust, high performance JSON parser and generator for R")
    (description
     "The jsonlite package provides a fast JSON parser and generator optimized
for statistical data and the web.  It offers flexible, robust, high
performance tools for working with JSON in R and is particularly powerful for
building pipelines and interacting with a web API.  In addition to converting
JSON data from/to R objects, jsonlite contains functions to stream, validate,
and prettify JSON data.  The unit tests included with the package verify that
all edge cases are encoded and decoded consistently for use with dynamic data
in systems and applications.")
    (license license:expat)))

(define-public r-servr
  (package
    (name "r-servr")
    (version "0.11")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "servr" version))
              (sha256
               (base32
                "0yj3p1risf269n25dd56lqv82dsxv6a0aq4bcc1ddn9wv7h2xdfi"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-httpuv" ,r-httpuv)
       ("r-jsonlite" ,r-jsonlite)
       ("r-mime" ,r-mime)
       ("r-xfun" ,r-xfun)))
    (home-page "https://github.com/yihui/servr")
    (synopsis "Simple HTTP server to serve static files or dynamic documents")
    (description
     "Servr provides an HTTP server in R to serve static files, or dynamic
documents that can be converted to HTML files (e.g., R Markdown) under a given
directory.")
    (license license:expat)))

(define-public r-htmltools
  (package
    (name "r-htmltools")
    (version "0.3.6")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "htmltools" version))
              (sha256
               (base32
                "18k8r1s8sz1jy7dkz35n69wj20xhmllr53xmwb4pdzf2z61gpbs4"))))
    (build-system r-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; See https://github.com/rstudio/htmltools/pull/68
         ;; The resource files are in the store and have mode 444.  After
         ;; copying the files R fails to remove them again because it doesn't
         ;; have write access to them.
         (add-after 'unpack 'copy-files-without-mode
           (lambda _
             (substitute* "R/html_dependency.R"
               (("file.copy\\(from, to, " prefix)
                (string-append prefix
                               "copy.mode = FALSE, ")))
             #t)))))
    (propagated-inputs
     `(("r-digest" ,r-digest)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/htmltools")
    (synopsis "R tools for HTML")
    (description
     "This package provides tools for HTML generation and output in R.")
    (license license:expat)))

(define-public r-htmlwidgets
  (package
    (name "r-htmlwidgets")
    (version "1.3")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "htmlwidgets" version))
              (sha256
               (base32
                "04jsdh14l2zifbjpbbh23w7bxz1wpsas0zb2gy2zwv4yqamzzr7i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-htmltools" ,r-htmltools)
       ("r-jsonlite" ,r-jsonlite)
       ("r-yaml" ,r-yaml)))
    (home-page "https://github.com/ramnathv/htmlwidgets")
    (synopsis "HTML Widgets for R")
    (description
     "HTML widgets is a framework for creating HTML widgets that render in
various contexts including the R console, R Markdown documents, and Shiny web
applications.")
    (license license:expat)))

(define-public r-htmltable
  (package
    (name "r-htmltable")
    (version "1.12")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "htmlTable" version))
       (sha256
        (base32
         "1n5136vb7mi4rxl5jgwdmdhn4mwv2pcqyw2mrj406ih4hy6hpxa2"))))
    (properties `((upstream-name . "htmlTable")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-checkmate" ,r-checkmate)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-knitr" ,r-knitr)
       ("r-magrittr" ,r-magrittr)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-stringr" ,r-stringr)))
    (home-page "http://gforge.se/packages/")
    (synopsis "Advanced tables for Markdown/HTML")
    (description
     "This package provides functions to build tables with advanced layout
elements such as row spanners, column spanners, table spanners, zebra
striping, and more.  While allowing advanced layout, the underlying
CSS-structure is simple in order to maximize compatibility with word
processors such as LibreOffice.  The package also contains a few text
formatting functions that help outputting text compatible with HTML or
LaTeX.")
    (license license:gpl3+)))

(define-public r-curl
  (package
    (name "r-curl")
    (version "3.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "curl" version))
              (sha256
               (base32
                "15hmy71310hnf9yqvz0icx4cq939gv6iqaifzlfdh2ia8akawdhn"))))
    (build-system r-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; The environment variable CURL_CA_BUNDLE is only respected when
         ;; running Windows, so we disable the platform checks.
         ;; This can be removed once the libcurl has been patched.
         (add-after 'unpack 'allow-CURL_CA_BUNDLE
           (lambda _
             (substitute* "R/onload.R"
               (("if \\(!grepl\\(\"mingw\".*")
                "if (FALSE)\n"))
             (substitute* "src/handle.c"
               (("#ifdef _WIN32") "#if 1"))
             #t)))))
    (inputs
     `(("libcurl" ,curl)))
    (home-page "https://github.com/jeroenooms/curl")
    (synopsis "HTTP client for R")
    (description
     "The @code{curl()} and @code{curl_download()} functions provide highly
configurable drop-in replacements for base @code{url()} and
@code{download.file()} with better performance, support for encryption, gzip
compression, authentication, and other @code{libcurl} goodies.  The core of
the package implements a framework for performing fully customized requests
where data can be processed either in memory, on disk, or streaming via the
callback or connection interfaces.")
    (license license:expat)))

(define-public r-hwriter
  (package
    (name "r-hwriter")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "hwriter" version))
       (sha256
        (base32
         "0arjsz854rfkfqhgvpqbm9lfni97dcjs66isdsfvwfd2wz932dbb"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/hwriter")
    (synopsis "Output R objects in HTML format")
    (description
     "This package provides easy-to-use and versatile functions to output R
objects in HTML format.")
    (license license:lgpl2.1+)))

(define-public r-rjson
  (package
    (name "r-rjson")
    (version "0.2.20")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rjson" version))
       (sha256
        (base32
         "0v1zvdd3svnavklh7y5xbwrrkbvx6053r4c5hgnk7hz7bqg7qa1s"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rjson")
    (synopsis "JSON library for R")
    (description
     "This package provides functions to convert R objects into JSON objects
and vice-versa.")
    (license license:gpl2+)))

(define-public r-shiny
  (package
    (name "r-shiny")
    (version "1.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rstudio/shiny.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "041q2gzvzs13syfhbirmkik96asdji8dxnnbs63j7v1ks97hrvvz"))))
    (build-system r-build-system)
    (arguments
     `(#:modules ((guix build r-build-system)
                  (guix build minify-build-system)
                  (guix build utils)
                  (ice-9 match))
       #:imported-modules (,@%r-build-system-modules
                           (guix build minify-build-system))
       #:phases
       (modify-phases (@ (guix build r-build-system) %standard-phases)
         (add-after 'unpack 'replace-bundled-minified-JavaScript
           (lambda* (#:key inputs #:allow-other-keys)
             (let ((replace-file (lambda (old new)
                                   (format #t "replacing ~a with ~a\n" old new)
                                   (delete-file old)
                                   (symlink new old))))
               ;; NOTE: Files in ./inst/www/shared/datepicker/js/locales/
               ;; contain just data.  They are not minified code, so we don't
               ;; replace them.
               (with-directory-excursion "inst/www/shared"
                 (replace-file "bootstrap/shim/respond.min.js"
                               (string-append (assoc-ref inputs "js-respond")
                                              "/share/javascript/respond.min.js"))
                 (replace-file "bootstrap/shim/html5shiv.min.js"
                               (string-append (assoc-ref inputs "js-html5shiv")
                                              "/share/javascript/html5shiv.min.js"))
                 (replace-file "json2-min.js"
                               (string-append (assoc-ref inputs "js-json2")
                                              "/share/javascript/json2.min.js"))
                 (replace-file "strftime/strftime-min.js"
                               (string-append (assoc-ref inputs "js-strftime")
                                              "/share/javascript/strftime.min.js"))
                 (replace-file "highlight/highlight.pack.js"
                               (string-append (assoc-ref inputs "js-highlight")
                                              "/share/javascript/highlight.min.js"))
                 (replace-file "datatables/js/jquery.dataTables.min.js"
                               (string-append (assoc-ref inputs "js-datatables")
                                              "/share/javascript/jquery.dataTables.min.js"))
                 (replace-file "selectize/js/selectize.min.js"
                               (string-append (assoc-ref inputs "js-selectize")
                                              "/share/javascript/selectize.min.js"))
                 (replace-file "selectize/js/es5-shim.min.js"
                               (string-append (assoc-ref inputs "js-es5-shim")
                                              "/share/javascript/es5-shim.min.js"))
                 (for-each (match-lambda
                             ((source . target)
                              (delete-file target)
                              (minify source #:target target)))
                           '(("jqueryui/jquery-ui.js" .
                              "jqueryui/jquery-ui.min.js")
                             ("showdown/src/showdown.js" .
                              "showdown/compressed/showdown.js")
                             ("datepicker/js/bootstrap-datepicker.js" .
                              "datepicker/js/bootstrap-datepicker.min.js")
                             ("ionrangeslider/js/ion.rangeSlider.js" .
                              "ionrangeslider/js/ion.rangeSlider.min.js")
                             ("bootstrap/js/bootstrap.js" .
                              "bootstrap/js/bootstrap.min.js")
                             ("shiny.js" .
                              "shiny.min.js")
                             ("jquery.js" .
                              "jquery.min.js")))))
             #t)))))
    (propagated-inputs
     `(("r-crayon" ,r-crayon)
       ("r-httpuv" ,r-httpuv)
       ("r-mime" ,r-mime)
       ("r-jsonlite" ,r-jsonlite)
       ("r-xtable" ,r-xtable)
       ("r-digest" ,r-digest)
       ("r-htmltools" ,r-htmltools)
       ("r-r6" ,r-r6)
       ("r-sourcetools" ,r-sourcetools)))
    (inputs
     `(("js-datatables" ,js-datatables)
       ("js-html5shiv" ,js-html5shiv)
       ("js-json2" ,js-json2)
       ("js-respond" ,js-respond)
       ("js-selectize" ,js-selectize)
       ("js-strftime" ,js-strftime)
       ("js-highlight" ,js-highlight)
       ("js-es5-shim" ,js-es5-shim)))
    (home-page "http://shiny.rstudio.com")
    (synopsis "Easy interactive web applications with R")
    (description
     "Makes it incredibly easy to build interactive web applications
with R.  Automatic \"reactive\" binding between inputs and outputs and
extensive prebuilt widgets make it possible to build beautiful,
responsive, and powerful applications with minimal effort.")
    (license license:artistic2.0)))

(define-public r-shinydashboard
  (package
    (name "r-shinydashboard")
    (version "0.7.1")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "shinydashboard" version))
              (sha256
               (base32
                "0khac8b27q3swdw07kl609hm0fjfjsjv591b388q99mqqr2rk92i"))))
    (build-system r-build-system)
    ;; The directory inst/AdminLTE/ contains a minified JavaScript file.
    ;; Regenerate it from the included sources.
    (arguments
     `(#:modules ((guix build utils)
                  (guix build r-build-system)
                  (ice-9 popen))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'generate-minified-javascript
           (lambda _
             (with-directory-excursion "inst/AdminLTE"
               (delete-file "app.min.js")
               (let ((minified (open-pipe* OPEN_READ "uglify-js" "app.js")))
                 (call-with-output-file "app.min.js"
                   (lambda (port)
                     (dump-port minified port))))))))))
    (propagated-inputs
     `(("r-htmltools" ,r-htmltools)
       ("r-promises" ,r-promises)
       ("r-shiny" ,r-shiny)))
    (native-inputs
     `(("uglify-js" ,uglify-js)))
    (home-page "http://rstudio.github.io/shinydashboard/")
    (synopsis "Create dashboards with shiny")
    (description "This package provides an extension to the Shiny web
application framework for R, making it easy to create attractive dashboards.")
    ;; This package includes software that was released under the Expat
    ;; license, but the whole package is released under GPL version 2 or
    ;; later.
    (license license:gpl2+)))

(define-public r-shinyfiles
  (package
    (name "r-shinyfiles")
    (version "0.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shinyFiles" version))
       (sha256
        (base32
         "0dlcjrw96x72grg6j915070x8x98l7629pn86gf148iknflm7gd5"))))
    (properties `((upstream-name . "shinyFiles")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fs" ,r-fs)
       ("r-htmltools" ,r-htmltools)
       ("r-jsonlite" ,r-jsonlite)
       ("r-shiny" ,r-shiny)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/thomasp85/shinyFiles")
    (synopsis "Server-side file system viewer for Shiny")
    (description
     "This package provides functionality for client-side navigation of the
server side file system in shiny apps.  In case the app is running locally
this gives the user direct access to the file system without the need to
\"download\" files to a temporary location.  Both file and folder selection as
well as file saving is available.")
    (license license:gpl2+)))

(define-public r-crosstalk
  (package
    (name "r-crosstalk")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "crosstalk" version))
       (sha256
        (base32
         "0lfa89vhrzi7a1rghmygcjr8gzddw35sinb3jx6g49mc9jias7mk"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-htmltools" ,r-htmltools)
       ("r-jsonlite" ,r-jsonlite)
       ("r-lazyeval" ,r-lazyeval)
       ("r-r6" ,r-r6)
       ("r-shiny" ,r-shiny)))
    (home-page "https://rstudio.github.io/crosstalk/")
    (synopsis "Inter-widget interactivity for HTML widgets")
    (description
     "This package provides building blocks for allowing HTML widgets to
communicate with each other, with Shiny or without (i.e.  static @code{.html}
files).  It currently supports linked brushing and filtering.")
    (license license:expat)))

(define-public r-rook
  (package
    (name "r-rook")
    (version "1.1-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rook" version))
       (sha256
        (base32
         "00s9a0kr9rwxvlq433daxjk4ji8m0w60hjdprf502msw9kxfrx00"))))
    (properties `((upstream-name . "Rook")))
    (build-system r-build-system)
    (propagated-inputs `(("r-brew" ,r-brew)))
    (home-page "https://cran.r-project.org/web/packages/Rook")
    (synopsis "Web server interface for R")
    (description
     "This package contains the Rook specification and convenience software
for building and running Rook applications.  A Rook application is an R
reference class object that implements a @code{call} method or an R closure
that takes exactly one argument, an environment, and returns a list with three
named elements: the @code{status}, the @code{headers}, and the @code{body}.")
    (license license:gpl2)))

(define-public r-miniui
  (package
    (name "r-miniui")
    (version "0.1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "miniUI" version))
       (sha256
        (base32
         "1h5h2sc57h95d6bsgs95l26911g38hvjc1v50bc31xl9689l2as5"))))
    (properties `((upstream-name . "miniUI")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-htmltools" ,r-htmltools)
       ("r-shiny" ,r-shiny)))
    (home-page "https://cran.r-project.org/web/packages/miniUI/")
    (synopsis "Shiny UI widgets for small screens")
    (description
     "This package provides UI widget and layout functions for writing Shiny apps that
work well on small screens.")
    (license license:gpl3)))

(define-public r-feather
  (package
    (name "r-feather")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "feather" version))
       (sha256
        (base32
         "1q6dbkfnkpnabq8lb6bm9ma44cfcghx2lm23pyk3vg7943wrn1pi"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-hms" ,r-hms)
       ("r-rcpp" ,r-rcpp)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/wesm/feather")
    (synopsis "R Bindings to the Feather API")
    (description "Read and write feather files, a lightweight binary columnar
data store designed for maximum speed.")
    (license license:asl2.0)))

(define-public r-maps
  (package
    (name "r-maps")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "maps" version))
       (sha256
        (base32
         "05i2ppl5z4p8rawgqmy3z4ia05fcblpq1vvrmrkgkkpdlhczx6hr"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/maps")
    (synopsis "Draw geographical maps")
    (description "This package provides an R module for display of maps.
Projection code and larger maps are in separate packages ('mapproj' and
'mapdata').")
    (license license:gpl2)))

(define-public r-mapproj
  (package
    (name "r-mapproj")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mapproj" version))
       (sha256
        (base32
         "1rggww8cbwv0vzlj5afzhbsbngg4bzj5znbkz7wmxsbshfbsm9b2"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-maps" ,r-maps)))
    (home-page "https://cran.r-project.org/web/packages/mapproj")
    (synopsis "Map projection in R")
    (description "This package converts latitude/longitude into projected
coordinates.")
    (license (list license:gpl2          ; The R interface
                   (license:non-copyleft ; The C code
                    "https://www.gnu.org/licenses/license-list.en.html#lucent102"
                    "Lucent Public License Version 1.02")))))

(define-public r-rgooglemaps
  (package
    (name "r-rgooglemaps")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RgoogleMaps" version))
       (sha256
        (base32
         "06ab3lg1rwm93hkshf1vxfm8mlxq5qsjan0wx43lhnrysay65js4"))))
    (properties `((upstream-name . "RgoogleMaps")))
    (build-system r-build-system)
    (propagated-inputs `(("r-png" ,r-png)))
    (home-page "https://cran.r-project.org/web/packages/RgoogleMaps")
    (synopsis "Use Google Maps in R")
    (description "This package serves two purposes:
@enumerate
@item Provide a comfortable R interface to query the Google server for static
  maps, and
@item Use the map as a background image to overlay plots within R.  This
  requires proper coordinate scaling.
@end enumerate\n")
    (license license:gpl2+)))

(define-public r-geosphere
  (package
    (name "r-geosphere")
    (version "1.5-7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "geosphere" version))
       (sha256
        (base32
         "186qdm5niq7v3d4w4rngx71znsgi44hnam7698bsx9ar5mg5b6wx"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-sp" ,r-sp)))
    (home-page "https://cran.r-project.org/web/packages/geosphere")
    (synopsis "Spherical trigonometry")
    (description "This package computes spherical trigonometry for geographic
applications.  That is, compute distances and related measures for angular
(longitude/latitude) locations.")
    (license license:gpl3+)))

(define-public r-ggmap
  (package
    (name "r-ggmap")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggmap" version))
       (sha256
        (base32
         "0mssb09w818jv58h7mly9y181pzv22sgcd4a079cfpq04bs0wigw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-digest" ,r-digest)
       ("r-geosphere" ,r-geosphere)
       ("r-ggplot2" ,r-ggplot2)
       ("r-jpeg" ,r-jpeg)
       ("r-mapproj" ,r-mapproj)
       ("r-plyr" ,r-plyr)
       ("r-png" ,r-png)
       ("r-proto" ,r-proto)
       ("r-reshape2" ,r-reshape2)
       ("r-rgooglemaps" ,r-rgooglemaps)
       ("r-rjson" ,r-rjson)
       ("r-scales" ,r-scales)))
    (home-page "https://github.com/dkahle/ggmap")
    (synopsis "Spatial visualization with ggplot2")
    (description "This package provides a collection of functions to visualize
spatial data and models on top of static maps from various online sources (e.g
Google Maps and Stamen Maps).  It includes tools common to those tasks,
including functions for geolocation and routing.")
    (license license:gpl2)))

(define-public r-haven
  (package
    (name "r-haven")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "haven" version))
       (sha256
        (base32
         "0pp8xjf5lzqg1wr8cwxj4njx99vxwlflwjrd7jvyzwlfpwh7n1qa"))))
    (build-system r-build-system)
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("r-forcats" ,r-forcats)
       ("r-hms" ,r-hms)
       ("r-rcpp" ,r-rcpp)
       ("r-readr" ,r-readr)
       ("r-tibble" ,r-tibble)))
    (home-page "https://haven.tidyverse.org")
    (synopsis "Import and Export 'SPSS', 'Stata' and 'SAS' Files")
    (description
     "This package lets you mport foreign statistical formats into R via the
embedded @url{https://github.com/WizardMac/ReadStat,ReadStat} C library.")
    (license license:expat)))

(define-public r-amap
  (package
    (name "r-amap")
    (version "0.8-16")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "amap" version))
              (sha256
               (base32
                "1qnl2x98x64iaipkx5126rsddq2sx5ml43h75xyiyn30yvbmlxyk"))))
    (build-system r-build-system)
    (inputs
     `(("gfortran" ,gfortran)))
    (home-page "http://mulcyber.toulouse.inra.fr/projects/amap/")
    (synopsis "Another multidimensional analysis package")
    (description "This package provides tools for clustering and principal
component analysis (with robust methods, and parallelized functions).")
    (license license:gpl2+)))

(define-public r-ape
  (package
    (name "r-ape")
    (version "5.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ape" version))
       (sha256
        (base32
         "05b4yka5cirdgxd4d7iiaqvr428pk3j6n9q6dvg5j38kdj2h5sr7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-nlme" ,r-nlme)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://ape-package.ird.fr/")
    (synopsis "Analyses of phylogenetics and evolution")
    (description
     "This package provides functions for reading, writing, plotting, and
manipulating phylogenetic trees, analyses of comparative data in a
phylogenetic framework, ancestral character analyses, analyses of
diversification and macroevolution, computing distances from DNA sequences,
and several other tools.")
    (license license:gpl2+)))

(define-public r-abbyyr
  (package
    (name "r-abbyyr")
    (version "0.5.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abbyyR" version))
       (sha256
        (base32
         "1jh1c1ad6mgw7brdh2isnza1qpjlfxnqr7jl76yd93axyfl76xjx"))))
    (properties `((upstream-name . "abbyyR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-httr" ,r-httr)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-readr" ,r-readr)
       ("r-xml" ,r-xml)))
    (home-page "https://github.com/soodoku/abbyyR")
    (synopsis "Access to Abbyy Optical Character Recognition (OCR) API")
    (description
     "This package provides tools to get text from images of text using Abbyy
Cloud Optical Character Recognition (OCR) API.  With abbyyyR, one can easily
OCR images, barcodes, forms, documents with machine readable zones, e.g.
passports and get the results in a variety of formats including plain text and
XML.  To learn more about the Abbyy OCR API, see @url{http://ocrsdk.com/}.")
    (license license:expat)))

(define-public r-colorspace
  (package
    (name "r-colorspace")
    (version "1.3-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "colorspace" version))
       (sha256
        (base32 "0d1ya7hx4y58n5ivwmdmq2zgh0g2sbv7ykh13n85c1355csd57yx"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/colorspace")
    (synopsis "Color space manipulation")
    (description
     "This package carries out a mapping between assorted color spaces
including RGB, HSV, HLS, CIEXYZ, CIELUV, HCL (polar CIELUV), CIELAB and polar
CIELAB.  Qualitative, sequential, and diverging color palettes based on HCL
colors are provided.")
    (license license:bsd-3)))

(define-public r-glue
  (package
    (name "r-glue")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "glue" version))
       (sha256
        (base32
         "1vhw5497lpfr4m8lcx9bs0fgdp4ax0sycrk6n8yksp33qd25m7kq"))))
    (build-system r-build-system)
    (home-page "https://github.com/tidyverse/glue")
    (synopsis "Interpreted string literals")
    (description
     "This package provides an implementation of interpreted string literals,
inspired by Python's Literal String Interpolation (PEP-0498) and
Docstrings (PEP-0257) and Julia's Triple-Quoted String Literals.")
    (license license:expat)))

(define-public r-pastecs
  (package
   (name "r-pastecs")
   (version "1.3.21")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "pastecs" version))
            (sha256
             (base32
              "0z4dic94ar646w7zc2ggi5hgvf2qnznsani94c5pyql8zspz47lc"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-boot" ,r-boot)))
   (home-page "http://www.sciviews.org/pastecs")
   (synopsis "Analysis of space-time ecological series")
   (description
    "This package provides functions for regulation, decomposition and analysis
of space-time series.  The @code{pastecs} library is a PNEC-Art4 and IFREMER
initiative to bring PASSTEC 2000 functionalities to R.")
   (license license:gpl2+)))

(define-public r-plogr
  (package
    (name "r-plogr")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "plogr" version))
       (sha256
        (base32
         "0a8dhzlna79ggyhfr0nncgh15a9n6r0dsz664pz0ah323wpblqqf"))))
    (build-system r-build-system)
    (home-page "https://github.com/krlmlr/plogr")
    (synopsis "R bindings for the plog C++ logging library")
    (description
     "This package provides the header files for a stripped-down version of
the plog header-only C++ logging library, and a method to log to R's standard
error stream.")
    (license license:expat)))

(define-public r-pls
  (package
    (name "r-pls")
    (version "2.7-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pls" version))
       (sha256
        (base32
         "0xaqqgmdvfh7g7v1m4bcwjqzph68b9cq3bn4kjisfsadl54i5p2x"))))
    (build-system r-build-system)
    (home-page "http://mevik.net/work/software/pls.html")
    (synopsis "Partial Least Squares and Principal Component Regression")
    (description
     "The pls package implements multivariate regression methods: Partial Least
Squares Regression (@dfn{PLSR}), Principal Component Regression (@dfn{PCR}), and
Canonical Powered Partial Least Squares (@dfn{CPPLS}).  It supports:

@itemize
@item several algorithms: the traditional orthogonal scores (@dfn{NIPALS}) PLS
algorithm, kernel PLS, wide kernel PLS, Simpls, and PCR through @code{svd}
@item multi-response models (or @dfn{PLS2})
@item flexible cross-validation
@item Jackknife variance estimates of regression coefficients
@item extensive and flexible plots: scores, loadings, predictions, coefficients,
(R)MSEP, R², and correlation loadings
@item formula interface, modelled after @code{lm()}, with methods for predict,
print, summary, plot, update, etc.
@item extraction functions for coefficients, scores, and loadings
@item MSEP, RMSEP, and R² estimates
@item multiplicative scatter correction (@dfn{MSC})
@end itemize\n")
    (license license:gpl2)))

(define-public r-ps
  (package
    (name "r-ps")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ps" version))
       (sha256
        (base32 "1zxylcb0nr4qb5v6j199mc2pfgf2bpf00jrw47jajmv59qb0fwmx"))))
    (build-system r-build-system)
    (home-page "http://ps.r-lib.org")
    (synopsis "List, query, and manipulate system processes")
    (description
     "The ps package implements an API to list, query, and manipulate system
processes.  Most of its code is based on the @code{psutil} Python package.")
    (license license:bsd-3)))

(define-public r-pkgbuild
  (package
    (name "r-pkgbuild")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pkgbuild" version))
       (sha256
        (base32
         "1i1rrax7x7r2bplig5cfc50lx85jc4n9a3qmvbdviaj22wr2lghs"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-desc" ,r-desc)
       ("r-prettyunits" ,r-prettyunits)
       ("r-r6" ,r-r6)
       ("r-rprojroot" ,r-rprojroot)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/r-pkgs/pkgbuild")
    (synopsis "Find tools needed to build R packages")
    (description
     "This package provides functions used to build R packages.  It locates
compilers needed to build R packages on various platforms and ensures the PATH
is configured appropriately so R can use them.")
    (license license:gpl3)))

(define-public r-pkgload
  (package
    (name "r-pkgload")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pkgload" version))
       (sha256
        (base32
         "0z7jvharafahi2gv5547mk1n499isjzw06kfwymmxc0gd575d1ii"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-desc" ,r-desc)
       ("r-pkgbuild" ,r-pkgbuild)
       ("r-rlang" ,r-rlang)
       ("r-rprojroot" ,r-rprojroot)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/r-lib/pkgload")
    (synopsis "Simulate package installation and attach")
    (description
     "This package simulates the process of installing a package and then
attaching it.  This is a key part of the @code{devtools} package as it allows
you to rapidly iterate while developing a package.")
    (license license:gpl3)))

(define-public r-rcpp
  (package
    (name "r-rcpp")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rcpp" version))
       (sha256
        (base32 "1hlbw4k79q9ich4w27b01gsvwrsnrflii8zjlcmgfzm1vpq8ndxp"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr))) ; for vignettes
    (home-page "http://www.rcpp.org")
    (synopsis "Seamless R and C++ integration")
    (description
     "The Rcpp package provides R functions as well as C++ classes which offer
a seamless integration of R and C++.  Many R data types and objects can be
mapped back and forth to C++ equivalents which facilitates both writing of new
code as well as easier integration of third-party libraries.  Documentation
about Rcpp is provided by several vignettes included in this package, via the
'Rcpp Gallery' site at <http://gallery.rcpp.org>, the paper by Eddelbuettel
and Francois (2011, JSS), and the book by Eddelbuettel (2013, Springer); see
'citation(\"Rcpp\")' for details on these last two.")
    (license license:gpl2+)))

(define-public r-bindr
  (package
    (name "r-bindr")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bindr" version))
       (sha256
        (base32
         "1l05fpk2yql3jka321c0bdgx6mqq9pvfrg2844lbjfpbgjkmqy3w"))))
    (build-system r-build-system)
    (home-page "https://github.com/krlmlr/bindr")
    (synopsis "Parametrized active bindings")
    (description
     "This package provides a simple interface for creating active bindings
where the bound function accepts additional arguments.")
    (license license:expat)))

(define-public r-bindrcpp
  (package
    (name "r-bindrcpp")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bindrcpp" version))
       (sha256
        (base32
         "0rz4ibjdjsxl99ff3ha79z7cnjmilx4rx58fk9kk7ld9xc4hf4s8"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bindr" ,r-bindr)
       ("r-plogr" ,r-plogr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/krlmlr/bindrcpp")
    (synopsis "Rcpp interface to active bindings")
    (description
     "This package provides an easy way to fill an environment with active
bindings that call a C++ function.")
    (license license:expat)))

(define-public r-auc
  (package
    (name "r-auc")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AUC" version))
       (sha256
        (base32
         "0ripcib2qz0m7rgr1kiz68nx8f6p408l1ww7j78ljqik7p3g41g7"))))
    (properties `((upstream-name . "AUC")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/AUC")
    (synopsis "Compute the area under the curve of selected measures")
    (description
     "This package includes functions to compute the area under the curve of
selected measures: the area under the sensitivity curve (AUSEC), the area
under the specificity curve (AUSPC), the area under the accuracy
curve (AUACC), and the area under the receiver operating characteristic
curve (AUROC).  The curves can also be visualized.  Support for partial areas
is provided.")
    (license license:gpl2+)))

(define-public r-calibrate
  (package
    (name "r-calibrate")
    (version "1.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "calibrate" version))
       (sha256
        (base32
         "010nb1nb9y7zhw2k6d2i2drwy5brp7b83mjj2w7i3wjp9xb6l1kq"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/calibrate")
    (synopsis "Calibration of scatterplot and biplot axes")
    (description
     "This is a package for drawing calibrated scales with tick marks
on (non-orthogonal) variable vectors in scatterplots and biplots.")
    (license license:gpl2)))

(define-public r-shape
  (package
    (name "r-shape")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shape" version))
       (sha256
        (base32
         "0hadk3mapkhbh8xjkiz52vxdagmmgvm15xwpzb90ikw4giyipjzl"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/shape")
    (synopsis "Functions for plotting graphical shapes")
    (description
     "This package provides functions for plotting graphical shapes such as
ellipses, circles, cylinders, arrows, ...")
    (license license:gpl3+)))

(define-public r-globaloptions
  (package
    (name "r-globaloptions")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GlobalOptions" version))
       (sha256
        (base32
         "1wlyqz1yhmhjwslrd7q69jbd9vsbjkjfc01g60kl3cdpyr8hlyjn"))))
    (properties `((upstream-name . "GlobalOptions")))
    (build-system r-build-system)
    (home-page "https://github.com/jokergoo/GlobalOptions")
    (synopsis "Generate functions to get or set global options")
    (description
     "This package provides more controls on the option values such as
validation and filtering on the values, making options invisible or private.")
    (license license:gpl2+)))

(define-public r-circlize
  (package
    (name "r-circlize")
    (version "0.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "circlize" version))
       (sha256
        (base32
         "1l28maiqi549z191srncxgabx5fnvf0lld7smzwfd3vr5cx8nqww"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-colorspace" ,r-colorspace)
       ("r-globaloptions" ,r-globaloptions)
       ("r-shape" ,r-shape)))
    (home-page "https://github.com/jokergoo/circlize")
    (synopsis "Circular visualization")
    (description
     "Circular layout is an efficient way to visualise huge amounts of
information.  This package provides an implementation of circular layout
generation in R as well as an enhancement of available software.  Its
flexibility is based on the usage of low-level graphics functions such that
self-defined high-level graphics can be easily implemented by users for
specific purposes.  Together with the seamless connection between the powerful
computational and visual environment in R, it gives users more convenience and
freedom to design figures for better understanding complex patterns behind
multi-dimensional data.")
    (license license:gpl2+)))

(define-public r-powerlaw
  (package
    (name "r-powerlaw")
    (version "0.70.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "poweRlaw" version))
       (sha256
        (base32
         "04sr0nhdd1v915m0zf5gasznzgi08ykcy20kkwdw0l5mvvdbic8m"))))
    (properties `((upstream-name . "poweRlaw")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-vgam" ,r-vgam)))
    (home-page "https://github.com/csgillespie/poweRlaw")
    (synopsis "Tools for the analysis of heavy tailed distributions")
    (description
     "This package provides an implementation of maximum likelihood estimators
for a variety of heavy tailed distributions, including both the discrete and
continuous power law distributions.  Additionally, a goodness-of-fit based
approach is used to estimate the lower cut-off for the scaling region.")
    ;; Any of these GPL versions.
    (license (list license:gpl2 license:gpl3))))

(define-public r-compare
  (package
    (name "r-compare")
    (version "0.2-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "compare" version))
       (sha256
        (base32
         "0k9zms930b5dz9gy8414li21wy0zg9x9vp7301v5cvyfi0g7xzgw"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/compare")
    (synopsis "Comparing objects for differences")
    (description
     "This package provides functions to compare a model object to a
comparison object.  If the objects are not identical, the functions can be
instructed to explore various modifications of the objects (e.g., sorting
rows, dropping names) to see if the modified versions are identical.")
    (license license:gpl2+)))

(define-public r-dendextend
  (package
    (name "r-dendextend")
    (version "1.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dendextend" version))
       (sha256
        (base32
         "1jiani6zwfajky2vafvay2hq158nh99rdrk3j00lycspds9v35fd"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fpc" ,r-fpc)
       ("r-ggplot2" ,r-ggplot2)
       ("r-magrittr" ,r-magrittr)
       ("r-viridis" ,r-viridis)
       ("r-whisker" ,r-whisker)))
    (home-page "https://cran.r-project.org/web/packages/dendextend")
    (synopsis "Extending 'dendrogram' functionality in R")
    (description
     "This package offers a set of functions for extending @code{dendrogram}
objects in R, letting you visualize and compare trees of hierarchical
clusterings.  You can adjust a tree's graphical parameters (the color, size,
type, etc of its branches, nodes and labels) and visually and statistically
compare different dendrograms to one another.")
    ;; Any of these versions
    (license (list license:gpl2 license:gpl3))))

(define-public r-getoptlong
  (package
    (name "r-getoptlong")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GetoptLong" version))
       (sha256
        (base32
         "1fl3w2n602ldybc5qj7qw4xmzzb804bsjkqwf6dswzj0vf0qiadr"))))
    (properties `((upstream-name . "GetoptLong")))
    (build-system r-build-system)
    (inputs
     `(("perl" ,perl)))
    (propagated-inputs
     `(("r-globaloptions" ,r-globaloptions)
       ("r-rjson" ,r-rjson)))
    (home-page "https://github.com/jokergoo/GetoptLong")
    (synopsis "Parsing command-line arguments and variable interpolation")
    (description
     "This is yet another command-line argument parser which wraps the
powerful Perl module @code{Getopt::Long} and with some adaptation for easier
use in R.  It also provides a simple way for variable interpolation in R.")
    (license license:gpl2+)))

(define-public r-fastmatch
  (package
    (name "r-fastmatch")
    (version "1.1-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fastmatch" version))
       (sha256
        (base32
         "0z80jxkygmzn11sq0c2iz357s9bpki548lg926g85gldhfj1md90"))))
    (build-system r-build-system)
    (home-page "http://www.rforge.net/fastmatch")
    (synopsis "Fast match function")
    (description
     "This package provides a fast @code{match} replacement for cases that
require repeated look-ups.  It is slightly faster that R's built-in
@code{match} function on first match against a table, but extremely fast on
any subsequent lookup as it keeps the hash table in memory.")
    (license license:gpl2)))

(define-public r-ff
  (package
    (name "r-ff")
    (version "2.2-14")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ff" version))
       (sha256
        (base32
         "1w724q4jpzbvzpilb2ifviaxkjgk9lzwxz9gksnvicbmfa20fqqw"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-bit" ,r-bit)))
    (home-page "http://ff.r-forge.r-project.org/")
    (synopsis "Memory-efficient storage of large data on disk and access functions")
    (description
     "This package provides data structures that are stored on disk but
behave (almost) as if they were in RAM by transparently mapping only a section
in main memory.")
    ;; error Architecture not supported.
    (supported-systems (delete "aarch64-linux" %supported-systems))
    (license license:gpl2)))

(define-public r-ffbase
  (package
    (name "r-ffbase")
    (version "0.12.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ffbase" version))
       (sha256
        (base32
         "04kxx2f3f0743c5nvpb7x1x0pcd220dazpd5ag1pidxbz3xa85nw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bit" ,r-bit)
       ("r-fastmatch" ,r-fastmatch)
       ("r-ff" ,r-ff)))
    (home-page "http://github.com/edwindj/ffbase")
    (synopsis "Basic statistical functions for package 'ff'")
    (description
     "This package extends the out of memory vectors of @code{ff} with
statistical functions and other utilities to ease their usage.")
    (license license:gpl3)))

(define-public r-prettyunits
  (package
    (name "r-prettyunits")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prettyunits" version))
       (sha256
        (base32
         "0p3z42hnk53x7ky4d1dr2brf7p8gv3agxr71i99m01n2hq2ri91m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-magrittr" ,r-magrittr)))
    (home-page "https://github.com/gaborcsardi/prettyunits")
    (synopsis "Pretty, human readable formatting of quantities")
    (description
     "This package provides tools for pretty, human readable formatting of
quantities.")
    (license license:expat)))

(define-public r-reshape
  (package
    (name "r-reshape")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reshape" version))
       (sha256
        (base32
         "0s6i0sqxg1vldxs6miv8mi0zydxbqzgpmzfiwkj8y7jix3yrfmad"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://had.co.nz/reshape")
    (synopsis "Flexibly reshape data")
    (description
     "Flexibly restructure and aggregate data using just two functions:
@code{melt} and @code{cast}.  This package provides them.")
    (license license:expat)))

(define-public r-progress
  (package
    (name "r-progress")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "progress" version))
       (sha256
        (base32
         "1rhwm0bdw30z3rvl0bn56xprjl3zrdy7150w4gl4bkvn2d6h9fav"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-crayon" ,r-crayon)
       ("r-hms" ,r-hms)
       ("r-prettyunits" ,r-prettyunits)
       ("r-r6" ,r-r6)))
    (home-page "https://github.com/gaborcsardi/progress")
    (synopsis "Terminal progress bars")
    (description
     "This package provides configurable progress bars.  They may include
percentage, elapsed time, and/or the estimated completion time.  They work in
terminals, in Emacs ESS, RStudio, Windows Rgui, and the macOS R.app.  The
package also provides a C++ API, that works with or without Rcpp.")
    (license license:expat)))

(define-public r-ggally
  (package
    (name "r-ggally")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GGally" version))
       (sha256
        (base32
         "1zjmcc5bzagvy7c5cmdcl39xmx07fwi98yrj4i05w7y40kqcsiws"))))
    (properties `((upstream-name . "GGally")))
    (build-system r-build-system)
    (inputs
     `(("libressl" ,libressl)))
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-gtable" ,r-gtable)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape" ,r-reshape)
       ("r-rlang" ,r-rlang)))
    (home-page "https://ggobi.github.io/ggally")
    (synopsis "Extension to ggplot2")
    (description
     "The R package ggplot2 is a plotting system based on the grammar of
graphics.  GGally extends ggplot2 by adding several functions to reduce the
complexity of combining geometric objects with transformed data.  Some of
these functions include a pairwise plot matrix, a two group pairwise plot
matrix, a parallel coordinates plot, a survival plot, and several functions to
plot networks.")
    (license license:gpl2+)))

(define-public r-proxy
  (package
    (name "r-proxy")
    (version "0.4-22")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "proxy" version))
       (sha256
        (base32
         "0l0ff8irmmvic941is290hd5vszyhaj5nfwna4v3w9c1zk5nr1ma"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/proxy")
    (synopsis "Distance and similarity measures")
    (description
     "This package provides an extensible framework for the efficient
calculation of auto- and cross-proximities, along with implementations of the
most popular ones.")
    (license license:gpl2)))

(define-public r-sp
  (package
    (name "r-sp")
    (version "1.3-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sp" version))
       (sha256
        (base32
         "17xm1ig80p9wc860hm3bgishz6lj9fxgwqidj7rkbk4ap99qp62p"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)))
    (home-page "https://cran.r-project.org/web/packages/sp")
    (synopsis "Classes and methods for spatial data")
    (description
     "This package provides classes and methods for spatial data; the classes
document where the spatial location information resides, for 2D or 3D data.
Utility functions are provided, e.g. for plotting data as maps, spatial
selection, as well as methods for retrieving coordinates, for subsetting,
print, summary, etc.")
    (license license:gpl2+)))

(define-public r-rmtstat
  (package
    (name "r-rmtstat")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RMTstat" version))
       (sha256
        (base32
         "1nn25q4kmh9kj975sxkrpa97vh5irqrlqhwsfinbck6h6ia4rsw1"))))
    (properties `((upstream-name . "RMTstat")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/RMTstat")
    (synopsis "Distributions, statistics and tests derived from random matrix theory")
    (description
     "This package provides functions for working with the Tracy-Widom laws
and other distributions related to the eigenvalues of large Wishart
matrices.")
    (license license:bsd-3)))

(define-public r-rmpi
  (package
    (name "r-rmpi")
    (version "0.6-7")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "Rmpi" version))
              (sha256
               (base32
                "1b62gs7w1xqadqd7ir41jnxlcf14gcqfxd0915kn9ckdlsdrh0sw"))))
    (properties `((upstream-name . "Rmpi")))
    (build-system r-build-system)
    (arguments
     `(#:configure-flags '("--configure-args=\"--with-Rmpi-type=OPENMPI\"")))
    (inputs
     `(("openmpi" ,openmpi)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "http://www.stats.uwo.ca/faculty/yu/Rmpi")
    (synopsis "R interface to message-passing interface (MPI)")
    (description
     "This package provides an interface (wrapper) to MPI APIs.  It also
provides an interactive R manager and worker environment.")
    (license license:gpl2+)))

(define-public r-lmoments
  (package
    (name "r-lmoments")
    (version "1.2-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Lmoments" version))
       (sha256
        (base32
         "13p0r4w16jvjnyjmkhkp3dwdfr1gap2l0k4k5jy41m8nc5fvcx79"))))
    (properties `((upstream-name . "Lmoments")))
    (build-system r-build-system)
    (home-page "http://www.tilastotiede.fi/juha_karvanen.html")
    (synopsis "L-moments and quantile mixtures")
    (description
     "This package contains functions to estimate L-moments and trimmed
L-moments from the data.  It also contains functions to estimate the
parameters of the normal polynomial quantile mixture and the Cauchy polynomial
quantile mixture from L-moments and trimmed L-moments.")
    (license license:gpl2)))

(define-public r-distillery
  (package
    (name "r-distillery")
    (version "1.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "distillery" version))
       (sha256
        (base32
         "1m0pgmlvk7bsb6q3kxagnq422babk61sf73naavac68v8x2q8fix"))))
    (build-system r-build-system)
    (home-page "http://www.ral.ucar.edu/staff/ericg")
    (synopsis "Functions for confidence intervals and object information")
    (description
     "This package provides some very simple method functions for confidence
interval calculation and to distill pertinent information from a potentially
complex object; primarily used in common with the packages extRemes and
SpatialVx.")
    (license license:gpl2+)))

(define-public r-extremes
  (package
    (name "r-extremes")
    (version "2.0-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "extRemes" version))
       (sha256
        (base32
         "0cpvcajk9xyy7662nqkyx333vrxpwsc5nmv0bfnhsbgijz5y0hvm"))))
    (properties `((upstream-name . "extRemes")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-distillery" ,r-distillery)
       ("r-lmoments" ,r-lmoments)))
    (home-page "http://www.assessment.ucar.edu/toolkit/")
    (synopsis "Extreme value analysis")
    (description
     "ExtRemes is a suite of functions for carrying out analyses on the
extreme values of a process of interest; be they block maxima over long blocks
or excesses over a high threshold.")
    (license license:gpl2+)))

(define-public r-lmtest
  (package
    (name "r-lmtest")
    (version "0.9-36")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lmtest" version))
       (sha256
        (base32
         "0sym9sm1vl6bbgq01jhz1plxqmgh8hrgrn7rw0mwvsalcn6id7xy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-zoo" ,r-zoo)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/lmtest")
    (synopsis "Testing linear regression models")
    (description
     "This package provides a collection of tests, data sets, and examples for
diagnostic checking in linear regression models.  Furthermore, some generic
tools for inference in parametric models are provided.")
    ;; Either version is okay
    (license (list license:gpl2 license:gpl3))))

(define-public r-idr
  (package
    (name "r-idr")
    (version "1.2")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "idr" version))
              (sha256
               (base32
                "05nvgw1xdg670bsjjrxkgd1mrdkciccpw4krn0zcgdf2r21dzgwb"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/idr/")
    (synopsis "Irreproducible discovery rate")
    (description
     "This is a package for estimating the copula mixture model and plotting
correspondence curves in \"Measuring reproducibility of high-throughput
experiments\" (2011), Annals of Applied Statistics, Vol. 5, No. 3, 1752-1779,
by Li, Brown, Huang, and Bickel")
    (license license:gpl2+)))

(define-public r-inline
  (package
    (name "r-inline")
    (version "0.3.15")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "inline" version))
              (sha256
               (base32
                "0s4wssvpan189fijahknxq5s22ww9bzmdlmyhnra748r7khky17z"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/inline")
    (synopsis "Functions to inline C, C++, Fortran function calls from R")
    (description
     "This package provides functionality to dynamically define R functions
and S4 methods with inlined C, C++ or Fortran code supporting @code{.C} and
@code{.Call} calling conventions.")
    ;; Any version of the LGPL.
    (license license:lgpl3+)))

(define-public r-bbmle
  (package
    (name "r-bbmle")
    (version "1.0.20")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bbmle" version))
       (sha256
        (base32
         "1xzij7swrrzl5ly8l3lw6awh486zcm00251dwqws1y23fbgyh3vc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-numderiv" ,r-numderiv)))
    (home-page "https://cran.r-project.org/web/packages/bbmle")
    (synopsis "Tools for General Maximum Likelihood Estimation")
    (description
     "This package provides methods and functions for fitting maximum
likelihood models in R.  This package modifies and extends the @code{mle}
classes in the @code{stats4} package.")
    ;; Any version of the GPL
    (license license:gpl2+)))

(define-public r-emdbook
  (package
    (name "r-emdbook")
    (version "1.3.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "emdbook" version))
       (sha256
        (base32
         "0880cx6rqm9vgd2zxnd2k0igfl80gy7ak15w36clwlzavab59hmv"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bbmle" ,r-bbmle)
       ("r-coda" ,r-coda)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://www.math.mcmaster.ca/bolker/emdbook")
    (synopsis "Support functions and data for \"Ecological Models and Data\"")
    (description
     "This package provides auxiliary functions and data sets for \"Ecological
Models and Data\", a book presenting maximum likelihood estimation and related
topics for ecologists (ISBN 978-0-691-12522-0).")
    ;; Any GPL version
    (license (list license:gpl2 license:gpl3))))

(define-public r-lpsolve
  (package
    (name "r-lpsolve")
    (version "5.6.13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lpSolve" version))
       (sha256
        (base32
         "13a9ry8xf5j1f2j6imqrxdgxqz3nqp9sj9b4ivyx9sid459irm6m"))))
    (properties `((upstream-name . "lpSolve")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/lpSolve")
    (synopsis "R interface to Lp_solve to solve linear/integer programs")
    (description
     "Lp_solve is software for solving linear, integer and mixed integer
programs.  This implementation supplies a \"wrapper\" function in C and some R
functions that solve general linear/integer problems, assignment problems, and
transportation problems.")
    (license license:lgpl2.0)))

(define-public r-limsolve
  (package
    (name "r-limsolve")
    (version "1.5.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "limSolve" version))
       (sha256
        (base32
         "1ll6ir42h3g2fzf0wqai213bm82gpwjj2hfma2np3mz024sc09rg"))))
    (properties `((upstream-name . "limSolve")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lpsolve" ,r-lpsolve)
       ("r-mass" ,r-mass)
       ("r-quadprog" ,r-quadprog)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/limSolve")
    (synopsis "Solving linear inverse models")
    (description
     "This package provides functions that:

@enumerate
@item find the minimum/maximum of a linear or quadratic function,
@item sample an underdetermined or overdetermined system,
@item solve a linear system Ax=B for the unknown x.
@end enumerate

It includes banded and tridiagonal linear systems.  The package calls Fortran
functions from LINPACK.")
    ;; Any GPL version.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-fitdistrplus
  (package
    (name "r-fitdistrplus")
    (version "1.0-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fitdistrplus" version))
       (sha256
        (base32
         "12hckg3y5j3zh9q1gwxkc27q813p2r42iqp7wdfiq6nj55jrh6w6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-npsurv" ,r-npsurv)
       ("r-survival" ,r-survival)))
    (home-page "http://riskassessment.r-forge.r-project.org")
    (synopsis "Fitting a parametric distribution from data")
    (description
     "This package extends the @code{fitdistr} function of the MASS package
with several functions to help the fit of a parametric distribution to
non-censored or censored data.  Censored data may contain left-censored,
right-censored and interval-censored values, with several lower and upper
bounds.  In addition to @dfn{maximum likelihood estimation} (MLE), the package
provides moment matching (MME), quantile matching (QME) and maximum
goodness-of-fit estimation (MGE) methods (available only for non-censored
data).  Weighted versions of MLE, MME and QME are available.")
    (license license:gpl2+)))

(define-public r-energy
  (package
    (name "r-energy")
    (version "1.7-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "energy" version))
       (sha256
        (base32
         "15k9dg0a82cs9ypm0wpcsff3il1hzhnnv86dv5ngby1r144czhi4"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/energy")
    (synopsis "Multivariate inference via the energy of data")
    (description
     "This package provides e-statistics (energy) tests and statistics for
multivariate and univariate inference, including distance correlation,
one-sample, two-sample, and multi-sample tests for comparing multivariate
distributions, are implemented.  Measuring and testing multivariate
independence based on distance correlation, partial distance correlation,
multivariate goodness-of-fit tests, clustering based on energy distance,
testing for multivariate normality, distance components (disco) for
non-parametric analysis of structured data, and other energy
statistics/methods are implemented.")
    (license license:gpl2+)))

(define-public r-suppdists
  (package
    (name "r-suppdists")
    (version "1.1-9.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SuppDists" version))
       (sha256
        (base32
         "1ffx8wigqqvz2pnh06jjc0fnf4vq9z2rhwk2y3f9aszn18ap3dgw"))))
    (properties `((upstream-name . "SuppDists")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/SuppDists")
    (synopsis "Supplementary distributions")
    (description
     "This package provides ten distributions supplementing those built into
R.  Inverse Gauss, Kruskal-Wallis, Kendall's Tau, Friedman's chi squared,
Spearman's rho, maximum F ratio, the Pearson product moment correlation
coefficient, Johnson distributions, normal scores and generalized
hypergeometric distributions.  In addition two random number generators of
George Marsaglia are included.")
    (license license:gpl2+)))

(define-public r-ksamples
  (package
    (name "r-ksamples")
    (version "1.2-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "kSamples" version))
       (sha256
        (base32
         "15d5q5vpp4wx5rk5kjxjdxpwc8mkq5sbdz8gi07iscrvhzb5rzfr"))))
    (properties `((upstream-name . "kSamples")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-suppdists" ,r-suppdists)))
    (home-page "https://cran.r-project.org/web/packages/kSamples")
    (synopsis "K-Sample rank tests and their combinations")
    (description
     "This package provides tools to compares k samples using the
Anderson-Darling test, Kruskal-Wallis type tests with different rank score
criteria, Steel's multiple comparison test, and the Jonckheere-Terpstra (JT)
test.  It computes asymptotic, simulated or (limited) exact P-values, all
valid under randomization, with or without ties, or conditionally under random
sampling from populations, given the observed tie pattern.  Except for Steel's
test and the JT test it also combines these tests across several blocks of
samples.")
    (license license:gpl2+)))

(define-public r-cvst
  (package
    (name "r-cvst")
    (version "0.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "CVST" version))
       (sha256
        (base32
         "05l3yzkfrbds09ah9cdwn2sn4ryhq78lz33ryzrgkv176jc8qjw5"))))
    (properties `((upstream-name . "CVST")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-kernlab" ,r-kernlab)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/CVST")
    (synopsis "Fast cross-validation via sequential testing")
    (description
     "This package implements the fast cross-validation via sequential
testing (CVST) procedure.  CVST is an improved cross-validation procedure
which uses non-parametric testing coupled with sequential analysis to
determine the best parameter set on linearly increasing subsets of the data.
Additionally to the CVST the package contains an implementation of the
ordinary k-fold cross-validation with a flexible and powerful set of helper
objects and methods to handle the overall model selection process.  The
implementations of the Cochran's Q test with permutations and the sequential
testing framework of Wald are generic and can therefore also be used in other
contexts.")
    (license license:gpl2+)))

(define-public r-squarem
  (package
    (name "r-squarem")
    (version "2017.10-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SQUAREM" version))
       (sha256
        (base32
         "10xj26x7qjyvzndnbjl5krr9wabnb9cbrnp3m7xg673g8ddr12cv"))))
    (properties `((upstream-name . "SQUAREM")))
    (build-system r-build-system)
    (home-page "http://www.jhsph.edu/agingandhealth/People/Faculty_personal_pages/Varadhan.html")
    (synopsis "Squared Extrapolation Methods for Accelerating EM-Like Monotone Algorithms")
    (description
     "This package provides algorithms for accelerating the convergence of
slow, monotone sequences from smooth, contraction mapping such as the EM
algorithm.  It can be used to accelerate any smooth, linearly convergent
acceleration scheme.  A tutorial style introduction to this package is
available in a vignette.")
    (license license:gpl2+)))

(define-public r-lava
  (package
    (name "r-lava")
    (version "1.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lava" version))
       (sha256
        (base32
         "0cayjspry3r2lcbvl77v5v52b2zarri3b8xsf87pw5a3jn9anxcf"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-numderiv" ,r-numderiv)
       ("r-squarem" ,r-squarem)
       ("r-survival" ,r-survival)))
    (home-page "https://github.com/kkholst/lava")
    (synopsis "Latent variable models")
    (description
     "This package provides tools for the estimation and simulation of latent
variable models.")
    (license license:gpl3)))

(define-public r-drr
  (package
    (name "r-drr")
    (version "0.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "DRR" version))
       (sha256
        (base32
         "1yd1fvllfkcrwg9v322n4wkk4q4q84nvy58y4vac9pdr3yf3i4vl"))))
    (properties `((upstream-name . "DRR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cvst" ,r-cvst)
       ("r-kernlab" ,r-kernlab)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/DRR")
    (synopsis "Dimensionality reduction via regression")
    (description
     "This package provides an implementation of dimensionality reduction via
regression using Kernel Ridge Regression.")
    (license license:gpl3)))

(define-public r-prodlim
  (package
    (name "r-prodlim")
    (version "2018.04.18")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prodlim" version))
       (sha256
        (base32
         "1aslq87sqwikh8chxc378r38146y7kv79zz0kcq3j93ivx7va8jb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-kernsmooth" ,r-kernsmooth)
       ("r-lava" ,r-lava)
       ("r-rcpp" ,r-rcpp)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/prodlim")
    (synopsis "Product-limit estimation for censored event history analysis")
    (description
     "This package provides a fast and user-friendly implementation of
nonparametric estimators for censored event history (survival) analysis with
the Kaplan-Meier and Aalen-Johansen methods.")
    (license license:gpl2+)))

(define-public r-dimred
  (package
    (name "r-dimred")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dimRed" version))
       (sha256
        (base32
         "0ssy2qriiy6zdawriqcbl67qiq68ipml3frq7aqlq70r2fqyyw48"))))
    (properties `((upstream-name . "dimRed")))
    (build-system r-build-system)
    (propagated-inputs `(("r-drr" ,r-drr)))
    (home-page "https://github.com/gdkrmr/dimRed")
    (synopsis "Framework for dimensionality reduction")
    (description
     "This package provides a collection of dimensionality reduction
techniques from R packages and provides a common interface for calling the
methods.")
    (license license:gpl3)))

(define-public r-timedate
  (package
    (name "r-timedate")
    (version "3043.102")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "timeDate" version))
       (sha256
        (base32
         "0wvl5pq261rvbgly7vilk3x3m9xk3ly6il1i5scwdf6srl1vlz1p"))))
    (properties `((upstream-name . "timeDate")))
    (build-system r-build-system)
    (home-page "https://www.rmetrics.org")
    (synopsis "Chronological and calendar objects")
    (description
     "This package provides an environment for teaching \"Financial
Engineering and Computational Finance\" and for managing chronological and
calendar objects.")
    (license license:gpl2+)))

(define-public r-magic
  (package
    (name "r-magic")
    (version "1.5-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "magic" version))
       (sha256
        (base32
         "0snmdh6vk0p6ar1swsihisinxrx7l8371dri5lk0z24ysgr5w7gs"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)))
    (home-page "https://github.com/RobinHankin/magic.git")
    (synopsis "Create and investigate magic squares")
    (description
     "This package provides a collection of efficient, vectorized algorithms
for the creation and investigation of magic squares and hypercubes, including
a variety of functions for the manipulation and analysis of arbitrarily
dimensioned arrays.")
    (license license:gpl2)))

(define-public r-rmysql
  (package
    (name "r-rmysql")
    (version "0.10.15")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RMySQL" version))
       (sha256
        (base32
         "0bmc7w5fnkjaf333sgc0hskiy332m9gmfaxg0yzkjxscpizdw43n"))))
    (properties `((upstream-name . "RMySQL")))
    (build-system r-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("mariadb" ,mariadb)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(("r-dbi" ,r-dbi)))
    (home-page "https://github.com/r-dbi/RMySQL")
    (synopsis "Database interface and MySQL driver for R")
    (description
     "This package provides a DBI interface to MySQL / MariaDB.  The RMySQL
package contains an old implementation based on legacy code from S-PLUS which
is being phased out.  A modern MySQL client based on Rcpp is available from
the RMariaDB package.")
    (license license:gpl2)))

(define-public r-rpostgresql
  (package
    (name "r-rpostgresql")
    (version "0.6-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RPostgreSQL" version))
       (sha256
        (base32
         "1mdhw5821v2h7hpa53v10wz53k4i90r0vb6a3dia5gq8f9j1h088"))))
    (properties `((upstream-name . "RPostgreSQL")))
    (build-system r-build-system)
    (inputs
     `(("postgresql" ,postgresql)))
    (propagated-inputs
     `(("r-dbi" ,r-dbi)))
    (home-page "https://github.com/tomoakin/RPostgreSQL")
    (synopsis "R interface to the PostgreSQL database system")
    (description
     "This package provides a Database Interface (DBI) compliant driver for R
to access PostgreSQL database systems.")
    ;; The whole package is released under GPL version 2.  It includes code
    ;; under the PostgreSQL license.
    (license license:gpl2)))

(define-public r-geometry
  (package
    (name "r-geometry")
    (version "0.3-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "geometry" version))
       (sha256
        (base32
         "0s09vi0rr0smys3an83mz6fk41bplxyz4myrbiinf4qpk6n33qib"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-magic" ,r-magic)))
    (home-page "http://geometry.r-forge.r-project.org/")
    (synopsis "Mesh generation and surface tesselation")
    (description
     "This package makes the qhull library available in R, in a similar manner
as in Octave.  Qhull computes convex hulls, Delaunay triangulations, halfspace
intersections about a point, Voronoi diagrams, furthest-site Delaunay
triangulations, and furthest-site Voronoi diagrams.  It runs in 2-d, 3-d, 4-d,
and higher dimensions.  It implements the Quickhull algorithm for computing
the convex hull.  Qhull does not support constrained Delaunay triangulations,
or mesh generation of non-convex objects, but the package does include some R
functions that allow for this.  Currently the package only gives access to
Delaunay triangulation and convex hull computation.")
    ;; The Qhull sources are included and are distributed under a custom
    ;; non-copyleft license.  The R sources are released under GPL version 2.
    (license (list license:gpl2
                   (license:non-copyleft "http://www.qhull.org/COPYING.txt")))))

(define-public r-ddalpha
  (package
    (name "r-ddalpha")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ddalpha" version))
       (sha256
        (base32
         "16cn0bhbaz9l9k4y79sv2d4f7pvs7dyka273y89igs5jvr99kfj1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-class" ,r-class)
       ("r-geometry" ,r-geometry)
       ("r-mass" ,r-mass)
       ("r-rcpp" ,r-rcpp)
       ("r-robustbase" ,r-robustbase)
       ("r-sfsmisc" ,r-sfsmisc)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/ddalpha")
    (synopsis "Depth-Based classification and calculation of data depth")
    (description
     "This package contains procedures for depth-based supervised learning,
which are entirely non-parametric, in particular the DDalpha-procedure (Lange,
Mosler and Mozharovskyi, 2014).  The training data sample is transformed by a
statistical depth function to a compact low-dimensional space, where the final
classification is done.  It also offers an extension to functional data and
routines for calculating certain notions of statistical depth functions.  50
multivariate and 5 functional classification problems are included.")
    (license license:gpl2)))

(define-public r-gower
  (package
    (name "r-gower")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gower" version))
       (sha256
        (base32
         "1mbrj1lam3jfbby2j32shmmj5cn09zx3rkxbamq7q8sdg39b54gb"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/markvanderloo/gower")
    (synopsis "Gower's distance")
    (description
     "This package provides tools to compute Gower's distance (or similarity)
coefficient between records, and to compute the top-n matches between records.
Core algorithms are executed in parallel on systems supporting OpenMP.")
    (license license:gpl3)))

(define-public r-rcpproll
  (package
    (name "r-rcpproll")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RcppRoll" version))
       (sha256
        (base32
         "0srzfhzkk42kzrdjnhbb37946jp1p688rgysy6k3i2is8jb21zyb"))))
    (properties `((upstream-name . "RcppRoll")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/RcppRoll")
    (synopsis "Efficient rolling and windowed operations")
    (description
     "This package provides fast and efficient routines for common rolling /
windowed operations.  Routines for the efficient computation of windowed mean,
median, sum, product, minimum, maximum, standard deviation and variance are
provided.")
    (license license:gpl2+)))

(define-public r-ipred
  (package
    (name "r-ipred")
    (version "0.9-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ipred" version))
       (sha256
        (base32
         "01xcg3c121ndfpz9dirqxszknh4yb1p222p7f1wbwwhdrg1i27cw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-class" ,r-class)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-prodlim" ,r-prodlim)
       ("r-rpart" ,r-rpart)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/ipred")
    (synopsis "Improved predictors")
    (description
     "This package provides improved predictive models by indirect
classification and bagging for classification, regression and survival
problems as well as resampling based estimators of prediction error.")
    (license license:gpl2+)))

(define-public r-psych
  (package
    (name "r-psych")
    (version "1.8.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "psych" version))
       (sha256
        (base32
         "0n3frgzsfmnan6cp3yyq5h6c28v5pd7q5a42pp6byaa7n7d1v478"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreign" ,r-foreign)
       ("r-lattice" ,r-lattice)
       ("r-mnormt" ,r-mnormt)
       ("r-nlme" ,r-nlme)))
    (home-page "https://cran.r-project.org/web/packages/psych/")
    (synopsis "Procedures for psychological, psychometric, and personality research")
    (description
     "This package provides a general purpose toolbox for personality,
psychometric theory and experimental psychology.  Functions are primarily for
multivariate analysis and scale construction using factor analysis, principal
component analysis, cluster analysis and reliability analysis, although others
provide basic descriptive statistics.  Item Response Theory is done using
factor analysis of tetrachoric and polychoric correlations.  Functions for
analyzing data at multiple levels include within and between group statistics,
including correlations and factor analysis.  Functions for simulating and
testing particular item and test structures are included.  Several functions
serve as a useful front end for structural equation modeling.  Graphical
displays of path diagrams, factor analysis and structural equation models are
created using basic graphics.")
    (license license:gpl2+)))

(define-public r-broom
  (package
    (name "r-broom")
    (version "0.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "broom" version))
       (sha256
        (base32
         "1r3831vq0fd5sh5841xr844sghg88z7ws91hg4jgnzbbkxfjp4ag"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-backports" ,r-backports)
       ("r-dplyr" ,r-dplyr)
       ("r-nlme" ,r-nlme)
       ("r-purrr" ,r-purrr)
       ("r-reshape2" ,r-reshape2)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/tidyverse/broom")
    (synopsis "Convert statistical analysis objects into tidy data frames")
    (description
     "This package provides tools to convert statistical analysis objects from
R into tidy data frames, so that they can more easily be combined, reshaped
and otherwise processed with tools like @code{dplyr}, @code{tidyr} and
@code{ggplot2}.  The package provides three S3 generics: @code{tidy}, which
summarizes a model's statistical findings such as coefficients of a
regression; @code{augment}, which adds columns to the original data such as
predictions, residuals and cluster assignments; and @code{glance}, which
provides a one-row summary of model-level statistics.")
    (license license:expat)))

(define-public r-recipes
  (package
    (name "r-recipes")
    (version "0.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "recipes" version))
       (sha256
        (base32
         "0bwijw4427v2k5z3qci2kyr5dyzql8b3lvf88rwy16p741jckjsn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-ddalpha" ,r-ddalpha)
       ("r-dimred" ,r-dimred)
       ("r-dplyr" ,r-dplyr)
       ("r-gower" ,r-gower)
       ("r-ipred" ,r-ipred)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-matrix" ,r-matrix)
       ("r-pls" ,r-pls)
       ("r-purrr" ,r-purrr)
       ("r-rcpproll" ,r-rcpproll)
       ("r-rlang" ,r-rlang)
       ("r-tibble" ,r-tibble)
       ("r-tidyselect" ,r-tidyselect)
       ("r-timedate" ,r-timedate)))
    (home-page "https://github.com/topepo/recipes")
    (synopsis "Preprocessing tools to create design matrices")
    (description
     "Recipes is an extensible framework to create and preprocess design
matrices.  Recipes consist of one or more data manipulation and analysis
\"steps\".  Statistical parameters for the steps can be estimated from an
initial data set and then applied to other data sets.  The resulting design
matrices can then be used as inputs into statistical or machine learning
models.")
    (license license:gpl2)))

(define-public r-pdist
  (package
    (name "r-pdist")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pdist" version))
       (sha256
        (base32
         "18nd3mgad11f2zmwcp0w3sxlch4a9y6wp8dfdyzvjn7y4b4bq0dd"))))
    (build-system r-build-system)
    (home-page "https://github.com/jeffwong/pdist")
    (synopsis "Partitioned distance function")
    (description
     "Pdist computes the euclidean distance between rows of a matrix X and
rows of another matrix Y.  Previously, this could be done by binding the two
matrices together and calling @code{dist}, but this creates unnecessary
computation by computing the distances between a row of X and another row of
X, and likewise for Y.  Pdist strictly computes distances across the two
matrices, not within the same matrix, making computations significantly faster
for certain use cases.")
    (license license:gpl3+)))

(define-public r-ggrepel
  (package
    (name "r-ggrepel")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggrepel" version))
       (sha256
        (base32
         "1m3p84d6nh9mzzvxb82vgig3ngcvkz86rjwzl9a66ckdf5p611k3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-rcpp" ,r-rcpp)
       ("r-scales" ,r-scales)))
    (home-page "http://github.com/slowkow/ggrepel")
    (synopsis "Repulsive text and label geometries for ggplot2")
    (description
     "This package provides text and label geometries for ggplot2 that help to
avoid overlapping text labels.  Labels repel away from each other and away
from the data points.")
    (license license:gpl3)))

(define-public r-corrplot
  (package
    (name "r-corrplot")
    (version "0.84")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "corrplot" version))
       (sha256
        (base32
         "1k03qd8db7pwg1v318xapx5mpiypiz2n07qr19c4b45diri5xkhd"))))
    (build-system r-build-system)
    (home-page "https://github.com/taiyun/corrplot")
    (synopsis "Visualization of a correlation matrix")
    (description
     "This package provides a graphical display of a correlation matrix or
general matrix.  It also contains some algorithms to do matrix reordering.  In
addition, corrplot is good at details, including choosing color, text labels,
color labels, layout, etc.")
    ;; Any version of the GPL
    (license license:gpl2+)))

(define-public r-stringdist
  (package
    (name "r-stringdist")
    (version "0.9.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "stringdist" version))
       (sha256
        (base32
         "0gap1g9xwhp0zxqsznkc2carpvi80z03prr4q8m528684lznx2xa"))))
    (build-system r-build-system)
    (home-page "https://github.com/markvanderloo/stringdist")
    (synopsis "Approximate string matching and string distance functions")
    (description
     "This package implements an approximate string matching version of R's
native @code{match} function.  It can calculate various string distances based
on edits (Damerau-Levenshtein, Hamming, Levenshtein, optimal sting alignment),
qgrams (q- gram, cosine, jaccard distance) or heuristic metrics (Jaro,
Jaro-Winkler).  An implementation of soundex is provided as well.  Distances
can be computed between character vectors while taking proper care of encoding
or between integer vectors representing generic sequences.")
    (license license:gpl3+)))

(define-public r-ucminf
  (package
    (name "r-ucminf")
    (version "1.1-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ucminf" version))
       (sha256
        (base32
         "01vggwg1w71k98qs6fhb0x1843vi322mf4g3hbclks94kcpkisx2"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/ucminf/")
    (synopsis "General-purpose unconstrained non-linear optimization")
    (description
     "This package provides an implementation of an algorithm for
general-purpose unconstrained non-linear optimization.  The algorithm is of
quasi-Newton type with BFGS updating of the inverse Hessian and soft line
search with a trust region type monitoring of the input to the line search
algorithm.  The interface of @code{ucminf} is designed for easy interchange
with the package @code{optim}.")
    (license license:gpl2+)))

(define-public r-ordinal
  (package
    (name "r-ordinal")
    (version "2018.8-25")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ordinal" version))
       (sha256
        (base32
         "03cv9hcrw8j3lhamzhz8sk2p3ns4cw9z41x49h301k2b3pajv43h"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-numderiv" ,r-numderiv)
       ("r-ucminf" ,r-ucminf)))
    (home-page "https://github.com/runehaubo/ordinal")
    (synopsis "Regression models for ordinal data")
    (description
     "This package provides an implementation of cumulative link (mixed)
models also known as ordered regression models, proportional odds models,
proportional hazards models for grouped survival times and ordered models.
Estimation is via maximum likelihood and mixed models are fitted with the
Laplace approximation and adaptive Gauss-Hermite quadrature.")
    (license license:gpl2+)))

(define-public r-jomo
  (package
    (name "r-jomo")
    (version "2.6-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "jomo" version))
       (sha256
        (base32
         "109q5m69clrvvialxdxznd0wdb54ajhx84nj8slx8bf909a427mj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lme4" ,r-lme4)
       ("r-mass" ,r-mass)
       ("r-ordinal" ,r-ordinal)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/jomo/")
    (synopsis "Multilevel Joint Modelling Multiple Imputation")
    (description
     "Similarly to Schafer's package pan, jomo is a package for multilevel
joint modelling multiple imputation @url{Carpenter and Kenward (2013),
http://doi.org/10.1002/9781119942283}.  Novel aspects of jomo are the
possibility of handling binary and categorical data through latent normal
variables, the option to use cluster-specific covariance matrices and to
impute compatibly with the substantive model.")
    (license license:gpl2)))

(define-public r-pan
  (package
    (name "r-pan")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pan" version))
       (sha256
        (base32
         "1dk3jjj826p7xrz10qz04vyc068xnypg7bp0pj4c32z3da0xzh5d"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/pan/")
    (synopsis "Multiple imputation for multivariate panel or clustered data")
    (description
     "This package implements multiple imputation for multivariate panel or
clustered data.")
    (license license:gpl3)))

(define-public r-mitml
  (package
    (name "r-mitml")
    (version "0.3-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mitml" version))
       (sha256
        (base32
         "1pkqv4qazih3byws5z6629pp232n8ra56lip7502727b0b4bsndw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-haven" ,r-haven)
       ("r-jomo" ,r-jomo)
       ("r-pan" ,r-pan)))
    (home-page "https://cran.r-project.org/web/packages/mitml/")
    (synopsis "Tools for multiple imputation in multilevel modeling")
    (description
     "This package provides tools for multiple imputation of missing data in
multilevel modeling.  It includes a user-friendly interface to the packages
pan and jomo, and several functions for visualization, data management and the
analysis of multiply imputed data sets.")
    (license license:gpl2+)))

(define-public r-mice
  (package
    (name "r-mice")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mice" version))
       (sha256
        (base32
         "1p0ipbqk5aqdi7iikw3qrjyvdi9sdhpnw1h5mwakwvv0yl0pzbyx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-mitml" ,r-mitml)
       ("r-nnet" ,r-nnet)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)
       ("r-rpart" ,r-rpart)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/mice/")
    (synopsis "Multivariate imputation by chained equations")
    (description
     "Multiple imputation using @dfn{Fully Conditional Specification} (FCS)
implemented by the MICE algorithm as described in @url{Van Buuren and
Groothuis-Oudshoorn (2011), http://doi.org/10.18637/jss.v045.i03}.  Each
variable has its own imputation model.  Built-in imputation models are
provided for continuous data (predictive mean matching, normal), binary
data (logistic regression), unordered categorical data (polytomous logistic
regression) and ordered categorical data (proportional odds).  MICE can also
impute continuous two-level data (normal model, pan, second-level variables).
Passive imputation can be used to maintain consistency between variables.
Various diagnostic plots are available to inspect the quality of the
imputations.")
    ;; Any of these two versions.
    (license (list license:gpl2 license:gpl3))))

(define-public r-truncnorm
  (package
    (name "r-truncnorm")
    (version "1.0-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "truncnorm" version))
       (sha256
        (base32
         "0zn88wdd58223kibk085rhsikl4yhlrwiyq109hzjg06hy6lwmj9"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/truncnorm/")
    (synopsis "Truncated normal distribution")
    (description "This package provides functions for the truncated normal
distribution with mean equal to @code{mean} and standard deviation equal to
@code{sd}.  It includes density, distribution, quantile, and expected value
functions, as well as a random generation function.")
    (license license:gpl2)))

(define-public r-rsolnp
  (package
    (name "r-rsolnp")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rsolnp" version))
       (sha256
        (base32
         "0w7nkj6igr0gi7r7jg950lsx7dj6aipgxi6vbjsf5f5yc9h7fhii"))))
    (properties `((upstream-name . "Rsolnp")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-truncnorm" ,r-truncnorm)))
    (home-page "https://cran.r-project.org/web/packages/Rsolnp/")
    (synopsis "General non-linear optimization")
    (description "The Rsolnp package implements a general non-linear augmented
Lagrange multiplier method solver, a @dfn{sequential quadratic
programming} (SQP) based solver).")
    ;; Any version of the GPL.
    (license license:gpl2+)))

(define-public r-hardyweinberg
  (package
    (name "r-hardyweinberg")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "HardyWeinberg" version))
       (sha256
        (base32
         "16n8qanxx0p5ny5zqxafn8hwb1xv94y1wig1iql8as5a5qh8lwcz"))))
    (properties `((upstream-name . "HardyWeinberg")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mice" ,r-mice)
       ("r-rcpp" ,r-rcpp)
       ("r-rsolnp" ,r-rsolnp)))
    (home-page "https://cran.r-project.org/package=HardyWeinberg")
    (synopsis "Statistical tests and graphics for Hardy-Weinberg equilibrium")
    (description
     "This package contains tools for exploring Hardy-Weinberg equilibrium for
diallelic genetic marker data.  All classical tests (chi-square, exact,
likelihood-ratio and permutation tests) for Hardy-Weinberg equilibrium are
included in the package, as well as functions for power computation and for
the simulation of marker data under equilibrium and disequilibrium.  Routines
for dealing with markers on the X-chromosome are included.  Functions for
testing equilibrium in the presence of missing data by using multiple
imputation are also provided.  Implements several graphics for exploring the
equilibrium status of a large set of diallelic markers: ternary plots with
acceptance regions, log-ratio plots and Q-Q plots.")
    (license license:gpl2+)))

(define-public r-sm
  (package
    (name "r-sm")
    (version "2.2-5.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sm" version))
       (sha256
        (base32
         "0c4whcx879gb4lwvqnzxl5n9xgpcqh2c54ip9ami3mwfprzcv45q"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "http://www.stats.gla.ac.uk/~adrian/sm/")
    (synopsis "Smoothing methods for nonparametric regression and density estimation")
    (description
     "This is software accompanying the book 'Applied Smoothing Techniques for
Data Analysis---The Kernel Approach with S-Plus Illustrations', Oxford
University Press.  It provides smoothing methods for nonparametric regression
and density estimation")
    (license license:gpl2+)))

(define-public r-venndiagram
  (package
    (name "r-venndiagram")
    (version "1.6.20")
    (source (origin
              (method url-fetch)
              (uri (cran-uri "VennDiagram" version))
              (sha256
               (base32
                "1ic1jaxzw98si2p4n1fl4n3myhd7fpw0njb634cwhviwybzv6775"))))
    (properties `((upstream-name . "VennDiagram")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-futile-logger" ,r-futile-logger)))
    (home-page "https://cran.r-project.org/web/packages/VennDiagram/")
    (synopsis "Generate High-Resolution Venn and Euler Plots")
    (description
     "This package provides a set of functions to generate high-resolution
Venn and Euler plots.  It includes handling for several special cases,
including two-case scaling, and extensive customization of plot shape and
structure.")
    (license license:gpl2+)))

(define-public r-vioplot
  (package
    (name "r-vioplot")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vioplot" version))
       (sha256
        (base32
         "16wkb26kv6qr34hv5zgqmgq6zzgysg9i78pvy2c097lr60v087v0"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-sm" ,r-sm)))
    (home-page "http://wsopuppenkiste.wiso.uni-goettingen.de/~dadler")
    (synopsis "Violin plot")
    (description
     "This package provides a violin plot, which is a combination of a box
plot and a kernel density plot.")
    (license license:bsd-3)))

(define-public r-rsofia
  (package
    (name "r-rsofia")
    (version "1.1")
    (source (origin
              (method url-fetch)
              ;; This package has been removed from CRAN, so we can
              ;; only fetch it from the archives.
              (uri (string-append "https://cran.r-project.org/src/"
                                  "contrib/Archive/RSofia/RSofia_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0q931y9rcf6slb0s2lsxhgqrzy4yqwh8hb1124nxg0bjbxvjbihn"))))
    (properties `((upstream-name . "RSofia")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/src/contrib/Archive/RSofia")
    (synopsis "Port of sofia-ml to R")
    (description "This package is a port of sofia-ml to R.  Sofia-ml is a
suite of fast incremental algorithms for machine learning that can be used for
training models for classification or ranking.")
    (license license:asl2.0)))

(define-public r-xts
  (package
    (name "r-xts")
    (version "0.11-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "xts" version))
       (sha256
        (base32
         "1f0kxrvn13py3hk2gh2m56cqm39x3bqp1i350r5viddacrm2yxqj"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-zoo" ,r-zoo)))
    (home-page "https://github.com/joshuaulrich/xts")
    (synopsis "Extensible time series")
    (description
     "This package provides for uniform handling of R's different time-based
data classes by extending @code{zoo}, maximizing native format information
preservation and allowing for user-level customization and extension, while
simplifying cross-class interoperability.")
    (license license:gpl2+)))

(define-public r-performanceanalytics
  (package
    (name "r-performanceanalytics")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PerformanceAnalytics" version))
       (sha256
        (base32
         "01bgm57z079g6r505w3bj293zkbd49fwa8sg55z87vizwavipml6"))))
    (properties
     `((upstream-name . "PerformanceAnalytics")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-quadprog" ,r-quadprog)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (home-page "https://r-forge.r-project.org/projects/returnanalytics/")
    (synopsis "Econometric tools for performance and risk analysis")
    (description "This is a collection of econometric functions for
performance and risk analysis.  This package aims to aid practitioners and
researchers in utilizing the latest research in analysis of non-normal return
streams.  In general, it is most tested on return (rather than price) data on
a regular scale, but most functions will work with irregular return data as
well, and increasing numbers of functions will work with P&L or price data
where possible.")
    ;; Either version may be picked.
    (license (list license:gpl2 license:gpl3))))

(define-public r-laeken
  (package
    (name "r-laeken")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "laeken" version))
       (sha256
        (base32
         "1rhkv1kk508pwln1d325iq4fink2ncssps0ypxi52j9d7wk78la6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/laeken/")
    (synopsis "Estimation of indicators on social exclusion and poverty")
    (description "This package provides tools for the estimation of indicators
on social exclusion and poverty, as well as an implementation of Pareto tail
modeling for empirical income distributions.")
    (license license:gpl2+)))

(define-public r-vcd
  (package
    (name "r-vcd")
    (version "1.4-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vcd" version))
       (sha256
        (base32
         "1lp99h0wvsc61l1dgcqjxdrcgpgw88ak430cdsv43kmm43qssqd5"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-colorspace" ,r-colorspace)
       ("r-lmtest" ,r-lmtest)
       ("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/vcd/")
    (synopsis "Visualizing categorical data")
    (description "This package provides visualization techniques, data sets,
summary and inference procedures aimed particularly at categorical data.
Special emphasis is given to highly extensible grid graphics.  The package was
originally inspired by the book \"Visualizing Categorical Data\" by Michael
Friendly and is now the main support package for a new book, \"Discrete Data
Analysis with R\" by Michael Friendly and David Meyer (2015).")
    (license license:gpl2)))

(define-public r-ica
  (package
    (name "r-ica")
    (version "1.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ica" version))
       (sha256
        (base32
         "0ya1nph1zwhad0bfz4yxs27kl45yk1dhnphdlrq34p8pqrpmj8g7"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ica/")
    (synopsis "Independent component analysis")
    (description "This package provides tools for @dfn{Independent Component
Analysis} (ICA) using various algorithms: FastICA,
Information-Maximization (Infomax), and @dfn{Joint Approximate Diagonalization
of Eigenmatrices} (JADE).")
    (license license:gpl2+)))

(define-public r-dtw
  (package
    (name "r-dtw")
    (version "1.20-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dtw" version))
       (sha256
        (base32
         "1w301xwizncy5r8v9rwwdxfshydgp3l1pnjla1fjn6n8lx3imjj3"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-proxy" ,r-proxy)))
    (home-page "http://dtw.r-forge.r-project.org/")
    (synopsis "Dynamic Time Warping Algorithms")
    (description "This package provides a comprehensive implementation of
@dfn{dynamic time warping} (DTW) algorithms in R.  DTW computes the
optimal (least cumulative distance) alignment between points of two time
series.  Common DTW variants covered include local (slope) and global (window)
constraints, subsequence matches, arbitrary distance definitions,
normalizations, minimum variance matching, and so on.")
    (license license:gpl2+)))

(define-public r-sdmtools
  (package
    (name "r-sdmtools")
    (version "1.1-221")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SDMTools" version))
       (sha256
        (base32
         "1kacrpamshv7wz83yn45sfbw4m9c44xrrngzcklnwx8gcxx2knm6"))))
    (properties `((upstream-name . "SDMTools")))
    (build-system r-build-system)
    (propagated-inputs `(("r-r-utils" ,r-r-utils)))
    (home-page "http://www.rforge.net/SDMTools/")
    (synopsis "Species distribution modelling tools")
    (description "This packages provides a set of tools for post processing
the outcomes of species distribution modeling exercises.  It includes novel
methods for comparing models and tracking changes in distributions through
time.  It further includes methods for visualizing outcomes, selecting
thresholds, calculating measures of accuracy and landscape fragmentation
statistics, etc.")
    (license license:gpl3+)))

(define-public r-scatterplot3d
  (package
    (name "r-scatterplot3d")
    (version "0.3-41")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "scatterplot3d" version))
       (sha256
        (base32
         "152xqz9c70qab86mpgng049gxsg5f4fpf1m8dh93fb9v1avjd0sc"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/scatterplot3d/")
    (synopsis "3D scatter plot")
    (description "This package provides an implementation of scatter plots for
plotting.  a three dimensional point cloud.")
    (license license:gpl2)))

(define-public r-ggridges
  (package
    (name "r-ggridges")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggridges" version))
       (sha256
        (base32
         "0dhwcpy785ac2ny5bjp284595nnybi3554wd0yffsli0vzf7ry01"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-scales" ,r-scales)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/clauswilke/ggridges")
    (synopsis "Ridgeline plots in ggplot2")
    (description
     "Ridgeline plots provide a convenient way of visualizing changes in
distributions over time or space.  This package enables the creation of such
plots in @code{ggplot2}.")
    (license license:gpl2)))

(define-public r-ggjoy
  (package
    (name "r-ggjoy")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggjoy" version))
       (sha256
        (base32
         "012md2m0jqfcccb933j423m3ck31v3p0pd41gjxpyg9082y7ixyj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-ggridges" ,r-ggridges)))
    (home-page "https://github.com/clauswilke/ggjoy")
    (synopsis "Joyplots in ggplot2")
    (description "Joyplots provide a convenient way of visualizing changes in
distributions over time or space.  This package enables the creation of such
plots in @code{ggplot2}.")
    (license license:gpl2)))

(define-public r-cli
  (package
    (name "r-cli")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cli" version))
       (sha256
        (base32
         "1r2yih4c0bdmbx0qrarlf0m1p5z30sri755zmdazsq2pw76zp07g"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-crayon" ,r-crayon)))
    (home-page "https://github.com/r-lib/cli#readme")
    (synopsis "Helpers for developing command line interfaces")
    (description "This package provides a suite of tools designed to build
attractive command line interfaces (CLIs).  It includes tools for drawing
rules, boxes, trees, and Unicode symbols with ASCII alternatives.")
    (license license:expat)))

(define-public r-argparser
  (package
    (name "r-argparser")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "argparser" version))
       (sha256
        (base32
         "0s1wxshx4jk69wfxhycx973q6y8cmqrfymyjklhq1i8xrj0kmmx9"))))
    (build-system r-build-system)
    (home-page "https://bitbucket.org/djhshih/argparser")
    (synopsis "Command-line argument parser")
    (description
     "This package provides a cross-platform command-line argument parser
written purely in R with no external dependencies.  It is useful with the
Rscript front-end and facilitates turning an R script into an executable
script.")
    (license license:gpl3+)))

(define-public r-debugme
  (package
    (name "r-debugme")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "debugme" version))
       (sha256
        (base32
         "1c9sg55zvf10h8198jdnpamm6f66lzw3c3jnmdp9ls6na0j0xbjd"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-crayon" ,r-crayon)))
    (home-page "https://github.com/r-lib/debugme#readme")
    (synopsis "Debug R packages")
    (description
     "This package allows the user to specify debug messages as special string
constants, and control debugging of packages via environment variables.")
    (license license:expat)))

(define-public r-processx
  (package
    (name "r-processx")
    (version "3.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "processx" version))
       (sha256
        (base32
         "1pzx4ap4xa07gf9zkd6hacdsnb9sp3kb60a7v7ljl0ywrcpn1fn4"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-crayon" ,r-crayon)
       ("r-ps" ,r-ps)
       ("r-r6" ,r-r6)
       ("r-testthat" ,r-testthat)))
    (home-page "https://github.com/r-lib/processx3")
    (synopsis "Execute and control system processes")
    (description
     "This package provides portable tools to run system processes in the
background.  It can check if a background process is running; wait on a
background process to finish; get the exit status of finished processes; kill
background processes and their children; restart processes.  It can read the
standard output and error of the processes, using non-blocking connections.
@code{processx} can poll a process for standard output or error, with a
timeout.  It can also poll several processes at once.")
    (license license:expat)))

(define-public r-tsp
  (package
    (name "r-tsp")
    (version "1.1-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TSP" version))
       (sha256
        (base32
         "1ym97xl2icjpfkrici0wig29w06bb704hp51v7h5liygjlwpkhlc"))))
    (properties `((upstream-name . "TSP")))
    (build-system r-build-system)
    (propagated-inputs `(("r-foreach" ,r-foreach)))
    (home-page "https://cran.r-project.org/web/packages/TSP/")
    (synopsis "Traveling salesperson problem (TSP)")
    (description "This package provides basic infrastructure and some
algorithms for the @dfn{traveling salesperson problem}(TSP) (also known as the
traveling salesman problem).")
    (license license:gpl3)))

(define-public r-qap
  (package
    (name "r-qap")
    (version "0.1-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "qap" version))
       (sha256
        (base32
         "0d2d1ni1camixyi45lfy00f4pn3p063k7bsi8gj5scp6n15mdgb0"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/qap/")
    (synopsis "Heuristics for the quadratic assignment problem (QAP)")
    (description "This package implements heuristics for the @dfn{quadratic
assignment problem} (QAP).  Currently only a simulated annealing heuristic is
available.")
    (license license:gpl3)))

(define-public r-gclus
  (package
    (name "r-gclus")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gclus" version))
       (sha256
        (base32
         "02ba6zj9bjwrzykamjp40ajynx9xjx9h2i85n0ym0r5lcki4x6fn"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-cluster" ,r-cluster)))
    (home-page "https://cran.r-project.org/web/packages/gclus/")
    (synopsis "Clustering graphics")
    (description "This package orders panels in scatterplot matrices and
parallel coordinate displays by some merit index.  It contains various indices
of merit, ordering functions, and enhanced versions of @code{pairs} and
@code{parcoord} which color panels according to their merit level.")
    (license license:gpl2+)))

(define-public r-webshot
  (package
    (name "r-webshot")
    (version "0.5.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "webshot" version))
       (sha256
        (base32
         "08sb1xi376pfy1vwilk2d68zljsg9yiv04n2dkqz383gdhh0sxdr"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-jsonlite" ,r-jsonlite)
       ("r-magrittr" ,r-magrittr)))
    (home-page "https://github.com/wch/webshot/")
    (synopsis "Take screenshots of web pages")
    (description
     "Webshot makes it easy to take screenshots of web pages from within R.
It can also run Shiny applications locally and take screenshots of the
application; and it can render and screenshot static as well as interactive R
Markdown documents.")
    (license license:gpl2)))

(define-public r-seriation
  (package
    (name "r-seriation")
    (version "1.2-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "seriation" version))
       (sha256
        (base32
         "1q6hw4hjw224b4y0dc0j630v2pgj6sn455nwkilb70w8k31hpk92"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cluster" ,r-cluster)
       ("r-colorspace" ,r-colorspace)
       ("r-dendextend" ,r-dendextend)
       ("r-gclus" ,r-gclus)
       ("r-gplots" ,r-gplots)
       ("r-mass" ,r-mass)
       ("r-qap" ,r-qap)
       ("r-registry" ,r-registry)
       ("r-tsp" ,r-tsp)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "http://s2.smu.edu/IDA/seriation/")
    (synopsis "Infrastructure for ordering objects using seriation")
    (description
     "This package provides infrastructure for seriation with an
implementation of several seriation/sequencing techniques to reorder matrices,
dissimilarity matrices, and dendrograms.  It also provides (optimally)
reordered heatmaps, color images and clustering visualizations like
dissimilarity plots, and visual assessment of cluster tendency plots (VAT and
iVAT).")
    (license license:gpl3)))

(define-public r-xfun
  (package
    (name "r-xfun")
    (version "0.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "xfun" version))
       (sha256
        (base32
         "0991ywgc2dsraba91kkj37akhfzhzn02cnz7c88hhdis9kag3pwv"))))
    (build-system r-build-system)
    (home-page "https://github.com/yihui/xfun")
    (synopsis "Miscellaneous functions")
    (description
     "This package provides miscellaneous functions commonly used in other
packages maintained by Yihui Xie.")
    (license license:expat)))

(define-public r-utf8
  (package
    (name "r-utf8")
    (version "1.1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "utf8" version))
       (sha256
        (base32
         "0m0ywg8k3blfiahxvh1i4zn9dksrlc937d2lbza5fc38zjnrrnpn"))))
    (build-system r-build-system)
    (home-page "https://github.com/patperry/r-utf8")
    (synopsis "Unicode text processing")
    (description
     "This package provides tools to process and print UTF-8 encoded
international text (Unicode).  Input, validate, normalize, encode, format, and
display.")
    (license license:asl2.0)))

(define-public r-pillar
  (package
    (name "r-pillar")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pillar" version))
       (sha256
        (base32
         "1q6arybmfqxhp5zqj1fri5pb8v7ywcv7bmgf81rrmgl892p4bn5f"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-fansi" ,r-fansi)
       ("r-rlang" ,r-rlang)
       ("r-utf8" ,r-utf8)))
    (home-page "https://github.com/r-lib/pillar")
    (synopsis "Coloured formatting for columns")
    (description
     "This package provides a @code{pillar} generic designed for formatting
columns of data using the full range of colours provided by modern
terminals.")
    (license license:gpl3)))

(define-public r-uuid
  (package
    (name "r-uuid")
    (version "0.1-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "uuid" version))
       (sha256
        (base32
         "1gmisd630fc8ybg845hbg13wmm3pk3npaamrh5wqbc1nqd6p0wfx"))))
    (build-system r-build-system)
    (home-page "http://www.rforge.net/uuid")
    (synopsis "Tools for generating and handling of UUIDs")
    (description
     "This package provides tools for generating and handling of
@dfn{Universally Unique Identifiers} (UUIDs).")
    (license license:expat)))

(define-public r-tinytex
  (package
    (name "r-tinytex")
    (version "0.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tinytex" version))
       (sha256
        (base32
         "08w5hyq3ysh631d5whgcfv1bb007cdc0bjhb83vwmhazs6rgvyjy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-xfun" ,r-xfun)))
    (home-page "https://github.com/yihui/tinytex")
    (synopsis "Helper functions for TeX Live and compiling LaTeX documents")
    (description
     "This package provides helper functions to install and maintain the LaTeX
distribution named TinyTeX, a lightweight, cross-platform, portable, and
easy-to-maintain version of TeX Live.  This package also contains helper
functions to compile LaTeX documents, and install missing LaTeX packages
automatically.")
    (license license:expat)))

(define-public r-metap
  (package
    (name "r-metap")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "metap" version))
       (sha256
        (base32
         "18rzvqfzyk8fn54gjvy2qd21nk9w69j7ihww477ma3f3ab6i982h"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-rdpack" ,r-rdpack)))
    (home-page "http://www.dewey.myzen.co.uk/meta/meta.html")
    (synopsis "Meta-analysis of significance values")
    (description
     "The canonical way to perform meta-analysis involves using effect sizes.
When they are not available this package provides a number of methods for
meta-analysis of significance values including the methods of Edgington,
Fisher, Stouffer, Tippett, and Wilkinson; a number of data-sets to replicate
published results; and a routine for graphical display.")
    (license license:gpl2)))

(define-public r-network
  (package
    (name "r-network")
    (version "1.13.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "network" version))
       (sha256
        (base32
         "1bbkbqkqf1d7irfwh08c13c2pfypir1ssvlqrln83irqns1ikdv0"))))
    (build-system r-build-system)
    (home-page "https://statnet.org/")
    (synopsis "Classes for relational data")
    (description
     "This package provides tools to create and modify network objects.  The
@code{network} class can represent a range of relational data types, and
supports arbitrary vertex/edge/graph attributes.")
    (license license:gpl2+)))

(define-public r-statnet-common
  (package
    (name "r-statnet-common")
    (version "4.1.4")
    (source
      (origin
        (method url-fetch)
        (uri (cran-uri "statnet.common" version))
        (sha256
          (base32
            "14dydm4c4dzc4v6ldxpn04q551nczzfablwibrd8lzgja8x9ksic"))))
    (properties
      `((upstream-name . "statnet.common")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-coda" ,r-coda)))
    (home-page "https://statnet.org")
    (synopsis "R scripts and utilities used by the Statnet software")
    (description "This package provides non-statistical utilities used by the
software developed by the Statnet Project.")
    (license license:gpl3)))

(define-public r-sna
  (package
    (name "r-sna")
    (version "2.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sna" version))
       (sha256
        (base32
         "1ks8819qvpdfansfqj9p32s1rhvl26frvbi78m4rx1wd1qcv74i2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-network" ,r-network)
       ("r-statnet-common" ,r-statnet-common)))
    (home-page "https://statnet.org")
    (synopsis "Tools for social network analysis")
    (description
     "This package provides a range of tools for social network analysis,
including node and graph-level indices, structural distance and covariance
methods, structural equivalence detection, network regression, random graph
generation, and 2D/3D network visualization.")
    (license license:gpl2+)))

(define-public r-ttr
  (package
    (name "r-ttr")
    (version "0.23-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TTR" version))
       (sha256
        (base32
         "18mzyv6cmxmqyqsfwlx2b2k055887mfgc2jgj8xkn8c6m56n05zb"))))
    (properties `((upstream-name . "TTR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://github.com/joshuaulrich/TTR")
    (synopsis "Technical trading rules")
    (description
     "This package provides functions and data to construct technical trading
rules with R.")
    (license license:gpl2)))

(define-public r-leaps
  (package
    (name "r-leaps")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "leaps" version))
       (sha256
        (base32
         "11gjmn1azrjw5xlvdb4gknj9985kck9x8zb9np1rnk2smp6pka2m"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/leaps/")
    (synopsis "Regression subset selection")
    (description
     "This package provides tools for regression subset selection, including
exhaustive search.")
    (license license:gpl2+)))

(define-public r-splus2r
  (package
    (name "r-splus2r")
    (version "1.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "splus2R" version))
       (sha256
        (base32
         "0xrbj8vxy0pc6hl7m8abv71d3hjw47cl51s7j7priadyqczkq6sz"))))
    (properties `((upstream-name . "splus2R")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/splus2R/")
    (synopsis "Supplemental S-PLUS functionality in R")
    (description
     "Currently there are many functions in S-PLUS that are missing in R.  To
facilitate the conversion of S-PLUS packages to R packages, this package
provides some missing S-PLUS functionality in R.")
    (license license:gpl2)))

(define-public r-ifultools
  (package
    (name "r-ifultools")
    (version "2.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ifultools" version))
       (sha256
        (base32
         "0pv2msaa1rmj8csxdclzi2jwg9pfdvh87blj9j3xa3myisglq092"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/ifultools/")
    (synopsis "Insightful research tools")
    (description "This package provides C code used by the wmtsa, fractal, and
sapa R packages.")
    (license license:gpl2)))

(define-public r-sapa
  (package
    (name "r-sapa")
    (version "2.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sapa" version))
       (sha256
        (base32
         "056xlh14dnzq4x7sbp7ff2k61jxy7110a742b502vz549qfrr5ds"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/sapa/")
    (synopsis "Spectral analysis for physical applications")
    (description "This package provides software for the book Spectral
Analysis for Physical Applications, Donald B. Percival and Andrew T. Walden,
Cambridge University Press, 1993.")
    (license license:gpl2)))

(define-public r-aggregation
  (package
    (name "r-aggregation")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "aggregation" version))
       (sha256
        (base32
         "0j9g604m2ccc7hcy02539yja9cf3xcbl25gvp838bp4x8w18my46"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/aggregation/")
    (synopsis "Methods for p-value aggregation")
    (description
     "This package contains functionality for performing the following methods
of p-value aggregation: Fisher's method, the Lancaster method (weighted
Fisher's method), and Sidak correction.")
    (license license:gpl3)))

(define-public r-quantmod
  (package
    (name "r-quantmod")
    (version "0.4-13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "quantmod" version))
       (sha256
        (base32
         "16aldg96z7amp5mr90nb8127yy04gxsihfr26km5p3cx3j117yv0"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-ttr" ,r-ttr)
       ("r-xts" ,r-xts)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/quantmod/")
    (synopsis "Quantitative financial modelling framework")
    (description "This package provides a quantitative financial modelling
framework to allow users to specify, build, trade, and analyse quantitative
financial trading strategies.")
    (license license:gpl3)))

(define-public r-tseries
  (package
    (name "r-tseries")
    (version "0.10-45")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tseries" version))
       (sha256
        (base32
         "14s1glh5zzdvdl05a2z7ymhgf962svxf8xircghg5sc649lb33n0"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-quadprog" ,r-quadprog)
       ("r-quantmod" ,r-quantmod)
       ("r-zoo" ,r-zoo)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/tseries/")
    (synopsis "Time series analysis and computational finance")
    (description
     "This package provides functions relating to time series analysis and
computational finance.")
    (license license:gpl2)))

(define-public r-wmtsa
  (package
    (name "r-wmtsa")
    (version "2.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "wmtsa" version))
       (sha256
        (base32
         "1q436krz5p1f4a7a7sya6a9rh9x9mi8zzcgq66gbk9w9w4hcqcj6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-mass" ,r-mass)
       ("r-splus2r" ,r-splus2r)))
    (home-page "https://cran.r-project.org/web/packages/wmtsa/")
    (synopsis "Wavelet methods for time series analysis")
    (description
     "This package provides software to accompany the book \"Wavelet Methods
for Time Series Analysis\", Donald B. Percival and Andrew T. Walden, Cambridge
University Press, 2000.")
    (license license:gpl2)))

(define-public r-tsa
  (package
    (name "r-tsa")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TSA" version))
       (sha256
        (base32
         "0gjfqibwdznz0nka95k4fjm935svxjpnqfywwz403crn2lh30h6q"))))
    (properties `((upstream-name . "TSA")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-leaps" ,r-leaps)
       ("r-locfit" ,r-locfit)
       ("r-mgcv" ,r-mgcv)))
    (home-page "http://www.stat.uiowa.edu/~kchan/TSA.htm")
    (synopsis "Time series analysis")
    (description
     "This package contains R functions and datasets detailed in the book
\"Time Series Analysis with Applications in R (second edition)\" by Jonathan
Cryer and Kung-Sik Chan.")
    (license license:gpl2+)))

(define-public r-extradistr
  (package
    (name "r-extradistr")
    (version "1.8.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "extraDistr" version))
       (sha256
        (base32
         "00lvqp5bb3iak5myiz4rqm887bkq9sdh7aybmz84mmfni6q01m28"))))
    (properties `((upstream-name . "extraDistr")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/twolodzko/extraDistr")
    (synopsis "Additional univariate and multivariate distributions")
    (description
     "This package implements density, distribution functions, quantile
functions and random generation functions for a large number of univariate and
multivariate distributions.")
    (license license:gpl2)))

(define-public r-fractal
  (package
    (name "r-fractal")
    (version "2.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fractal" version))
       (sha256
        (base32
         "18lr9z0gslvfc3z8vyj3krqj3bfhg60zv1fzinrwwkc4cpk1w7mp"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ifultools" ,r-ifultools)
       ("r-mass" ,r-mass)
       ("r-sapa" ,r-sapa)
       ("r-scatterplot3d" ,r-scatterplot3d)
       ("r-splus2r" ,r-splus2r)
       ("r-wmtsa" ,r-wmtsa)))
    (home-page "https://cran.r-project.org/web/packages/fractal/")
    (synopsis "Fractal time series modeling and analysis")
    (description
     "This package provides tools for stochastic fractal and deterministic
chaotic time series analysis.")
    (license license:gpl2)))

(define-public r-urca
  (package
    (name "r-urca")
    (version "1.3-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "urca" version))
       (sha256
        (base32
         "1akaqwf3fvvvx4sgfn641fd4sj51s0701pvfl6s5hnz2k0iwh732"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-nlme" ,r-nlme)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/urca/")
    (synopsis "Unit root and cointegration tests for time series data")
    (description
     "This package provides unit root and cointegration tests encountered in
applied econometric analysis.")
    (license license:gpl2+)))

(define-public r-cubature
  (package
    (name "r-cubature")
    (version "1.4-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cubature" version))
       (sha256
        (base32
         "10jl5l3xnigiq95829ssq69xbim97k851187dghc30awszcx4clh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/bnaras/cubature")
    (synopsis "Adaptive multivariate integration over hypercubes")
    (description
     "This package is an R wrapper around the cubature C library for adaptive
multivariate integration over hypercubes.  This version provides both
@code{hcubature} and @code{pcubature} routines in addition to a vector
interface.")
    ;; The included cubature C library is released under GPLv2+, but the
    ;; wrapper declares the license to be GPLv3+.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-trend
  (package
    (name "r-trend")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "trend" version))
       (sha256
        (base32
         "1bd567n15k2vpmgbx02584k5kglrc58mlb5kgd07wdss3knpa48q"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-extradistr" ,r-extradistr)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/trend/")
    (synopsis "Non-parametric trend tests and change-point detection")
    (description
     "The analysis of environmental data often requires the detection of
trends and change-points.  This package includes tests for trend
detection (Cox-Stuart Trend Test, Mann-Kendall Trend Test, (correlated)
Hirsch-Slack Test, partial Mann-Kendall Trend Test, multivariate (multisite)
Mann-Kendall Trend Test, (Seasonal) Sen's slope, partial Pearson and Spearman
correlation trend test), change-point detection (Lanzante's test procedures,
Pettitt's test, Buishand Range Test, Buishand U Test, Standard Normal
Homogeinity Test), detection of non-randomness (Wallis-Moore Phase Frequency
Test, Bartels rank von Neumann's ratio test, Wald-Wolfowitz Test) and the two
sample Robust Rank-Order Distributional Test.")
    (license license:gpl3)))

(define-public r-expm
  (package
    (name "r-expm")
    (version "0.999-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "expm" version))
       (sha256
        (base32
         "04k4a6g071jkjc0d30ncmf713dj16brcs9m6pj43hnycc1caq6si"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-matrix" ,r-matrix)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://r-forge.r-project.org/projects/expm/")
    (synopsis "Tools for matrix exponentials and related quantities")
    (description
     "This package provides tools for the computation of the matrix
exponential, logarithm, square root, and related quantities.")
    (license license:gpl2+)))

(define-public r-complexplus
  (package
    (name "r-complexplus")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "complexplus" version))
       (sha256
        (base32
         "16w9v7d1ckavqmr86l34frr37pkvdn0iqnb17ssb8xaggns5lgqx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-expm" ,r-expm)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/complexplus/")
    (synopsis "Functions of complex or real variables")
    (description
     "This package extends several functions to the complex domain, including
the matrix exponential and logarithm, and the determinant.")
    (license license:gpl2)))

(define-public r-phontools
  (package
    (name "r-phontools")
    (version "0.2-2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "phonTools" version))
       (sha256
        (base32
         "01i481mhswsys3gpasw9gn6nxkfmi7bz46g5c84m13pg0cv8hxc7"))))
    (properties `((upstream-name . "phonTools")))
    (build-system r-build-system)
    (home-page "http://www.santiagobarreda.com/rscripts.html")
    (synopsis "Tools for phonetic and acoustic analyses")
    (description
     "This package contains tools for the organization, display, and analysis
of the sorts of data frequently encountered in phonetics research and
experimentation, including the easy creation of IPA vowel plots, and the
creation and manipulation of WAVE audio files.")
    (license license:bsd-2)))

(define-public r-np
  (package
    (name "r-np")
    (version "0.60-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "np" version))
       (sha256
        (base32
         "1z4jcpx8bbgwslv42wrphfd1qfq965qjn0kmfxm5f6hbbycahcgy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-cubature" ,r-cubature)
       ("r-quadprog" ,r-quadprog)
       ("r-quantreg" ,r-quantreg)))
    (home-page "https://github.com/JeffreyRacine/R-Package-np")
    (synopsis "Non-parametric kernel smoothing methods for mixed data types")
    (description "This package provides non-parametric (and semi-parametric)
kernel methods that seamlessly handle a mix of continuous, unordered, and
ordered factor data types.")
    ;; Any version of the GPL.
    (license license:gpl3+)))

(define-public r-powerplus
  (package
    (name "r-powerplus")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "powerplus" version))
       (sha256
        (base32
         "0ayp6x34hkzgris4j3zbbs0r23n81bhww3wgfyy630ri4sk6brrn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-complexplus" ,r-complexplus)
       ("r-expm" ,r-expm)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-phontools" ,r-phontools)))
    (home-page "https://cran.r-project.org/web/packages/powerplus/")
    (synopsis "Exponentiation operations")
    (description
     "This package provides tools for the computation of matrix and scalar
exponentiation.")
    (license license:gpl2)))

(define-public r-heatmaply
  (package
    (name "r-heatmaply")
    (version "0.15.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "heatmaply" version))
       (sha256
        (base32
         "0h8s5djzj4mrmaswlcaap6jbwxrkbzc43bbqik3qf8vrqz335w04"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-colorspace" ,r-colorspace)
       ("r-dendextend" ,r-dendextend)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gplots" ,r-gplots)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-knitr" ,r-knitr) ; needed for vignettes
       ("r-magrittr" ,r-magrittr)
       ("r-plotly" ,r-plotly)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape2" ,r-reshape2)
       ("r-scales" ,r-scales)
       ("r-seriation" ,r-seriation)
       ("r-viridis" ,r-viridis)
       ("r-webshot" ,r-webshot)))
    (home-page "https://cran.r-project.org/package=heatmaply")
    (synopsis "Interactive cluster heat maps using plotly")
    (description
     "This package enables you to create interactive cluster heatmaps that can
be saved as a stand-alone HTML file, embedded in R Markdown documents or in a
Shiny app, and made available in the RStudio viewer pane.  Hover the mouse
pointer over a cell to show details or drag a rectangle to zoom.  A heatmap is
a popular graphical method for visualizing high-dimensional data, in which a
table of numbers is encoded as a grid of colored cells.  The rows and columns
of the matrix are ordered to highlight patterns and are often accompanied by
dendrograms.")
    ;; Either version of the license.
    (license (list license:gpl2 license:gpl3))))

(define-public r-h5
  (package
    (name "r-h5")
    (version "0.9.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "h5" version))
       (sha256
        (base32
         "14p7i1sj24ky87kd7qr3n9fc9l64s0bp0rwbyl6i2x69xn75gpsx"))))
    (build-system r-build-system)
    (inputs
     `(("zlib" ,zlib)
       ("hdf5" ,hdf5)))
    (native-inputs
     `(("which" ,which)))
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/mannau/h5")
    (synopsis "Interface to the HDF5 Library")
    (description
     "This package provides an S4 interface to the HDF5 library supporting
fast storage and retrieval of R-objects like vectors, matrices and arrays to
binary files in a language independent format.  The HDF5 format can therefore
be used as an alternative to R's save/load mechanism.  Since h5 is able to
access only subsets of stored data it can also handle data sets which do not
fit into memory.")
    (license license:bsd-2)))

(define-public r-cgdsr
  (package
    (name "r-cgdsr")
    (version "1.2.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "cgdsr" version))
       (sha256
        (base32
         "1xyhw7mhmjichr1l6f9y1qvfj9wm87kfbm87ji7lcwf36gxh5g23"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-r-methodss3" ,r-r-methodss3)
       ("r-r-oo" ,r-r-oo)))
    (home-page "https://github.com/cBioPortal/cgdsr")
    (synopsis "R-based API for accessing the MSKCC Cancer Genomics Data Server")
    (description
     "This package provides a basic set of R functions for querying the Cancer
Genomics Data Server (CGDS), hosted by the Computational Biology Center at
Memorial-Sloan-Kettering Cancer Center (MSKCC).")
    (license license:lgpl3)))

(define-public r-import
  (package
    (name "r-import")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "import" version))
       (sha256
        (base32
         "0blf9539rbfwcmw8zsb4k58slb4pdnc075v34vmyjw752fznhcji"))))
    (build-system r-build-system)
    (home-page "https://github.com/smbache/import")
    (synopsis "Import mechanism for R")
    (description
     "This is an alternative mechanism for importing objects from packages.
The syntax allows for importing multiple objects from a package with a single
command in an expressive way.  The import package bridges some of the gap
between using @code{library} (or @code{require}) and direct (single-object)
imports.  Furthermore the imported objects are not placed in the current
environment.  It is also possible to import objects from stand-alone @code{.R}
files.")
    (license license:expat)))

(define-public r-shinyace
  (package
    (name "r-shinyace")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shinyAce" version))
       (sha256
        (base32
         "1fbk5i6w6cpam8s3acf4bgdp8hajn4digjjix3i6i4q3p2rvn6zx"))))
    (properties `((upstream-name . "shinyAce")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-shiny" ,r-shiny)
       ("r-jsonlite" ,r-jsonlite)))
    (home-page "http://cran.r-project.org/web/packages/shinyAce")
    (synopsis "Ace editor bindings for Shiny")
    (description
     "This package provides Ace editor bindings to enable a rich text editing
environment within Shiny.")
    (license license:expat)))

(define-public r-radiant-data
  (package
    (name "r-radiant-data")
    (version "0.9.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "radiant.data" version))
       (sha256
        (base32
         "1f98ahki0kyb27gl55a859zb0lsvk9gddd9f54y767xfs6h89cgk"))
       (modules '((guix build utils)))
       (snippet
        '(begin
           ;; Delete files that are under CC-NC-SA.
           (delete-file-recursively "inst/app/tools/help")
           #t))))
    (properties `((upstream-name . "radiant.data")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-broom" ,r-broom)
       ("r-car" ,r-car)
       ("r-curl" ,r-curl)
       ("r-dplyr" ,r-dplyr)
       ("r-dt" ,r-dt)
       ("r-glue" ,r-glue)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-import" ,r-import)
       ("r-jsonlite" ,r-jsonlite)
       ("r-knitr" ,r-knitr)
       ("r-lubridate" ,r-lubridate)
       ("r-magrittr" ,r-magrittr)
       ("r-markdown" ,r-markdown)
       ("r-plotly" ,r-plotly)
       ("r-psych" ,r-psych)
       ("r-readr" ,r-readr)
       ("r-readxl" ,r-readxl)
       ("r-rlang" ,r-rlang)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-scales" ,r-scales)
       ("r-shiny" ,r-shiny)
       ("r-shinyfiles" ,r-shinyfiles)
       ("r-shinyace" ,r-shinyace)
       ("r-summarytools" ,r-summarytools)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-writexl" ,r-writexl)))
    (home-page "https://github.com/radiant-rstats/radiant.data")
    (synopsis "Data menu for Radiant: business analytics using R and Shiny")
    (description
     "The Radiant Data menu includes interfaces for loading, saving, viewing,
visualizing, summarizing, transforming, and combining data.  It also contains
functionality to generate reproducible reports of the analyses conducted in
the application.")
    (license license:agpl3)))

(define-public r-algdesign
  (package
    (name "r-algdesign")
    (version "1.1-7.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AlgDesign" version))
       (sha256
        (base32
         "0bl7mx4dnmkgs2x1fj7cqnrp7jx18mqwxyga0rzlniq12h8mc3fz"))))
    (properties `((upstream-name . "AlgDesign")))
    (build-system r-build-system)
    (home-page "https://github.com/jvbraun/AlgDesign")
    (synopsis "Algorithmic experimental design")
    (description
     "This package provides tools to calculate exact and approximate theory
experimental designs for D, A, and I criteria.  Very large designs may be
created.  Experimental designs may be blocked or blocked designs created from
a candidate list, using several criteria.  The blocking can be done when whole
and within plot factors interact.")
    (license license:gpl2+)))

(define-public r-signal
  (package
    (name "r-signal")
    (version "0.7-6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "signal" version))
       (sha256
        (base32
         "1vsxramz5qd9q9s3vlqzmfdpmwl2rhlb2n904zw6f0fg0xxjfq3b"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-mass" ,r-mass)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/signal/")
    (synopsis "Signal processing")
    (description
     "This package provides a set of signal processing functions originally
written for Matlab and GNU Octave.  It includes filter generation utilities,
filtering functions, resampling routines, and visualization of filter models.
It also includes interpolation functions.")
    (license license:gpl2)))

(define-public r-gsubfn
  (package
    (name "r-gsubfn")
    (version "0.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gsubfn" version))
       (sha256
        (base32
         "00j6b8b6xsx6v370h220x233rpk6asca78165y3d48jpwvwisdc9"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-proto" ,r-proto)))
    (home-page "http://gsubfn.googlecode.com")
    (synopsis "Utilities for strings and function arguments.")
    (description
     "This package provides @code{gsubfn} which is like @code{gsub} but can
take a replacement function or certain other objects instead of the
replacement string.  Matches and back references are input to the replacement
function and replaced by the function output.  @code{gsubfn} can be used to
split strings based on content rather than delimiters and for quasi-perl-style
string interpolation.  The package also has facilities for translating
formulas to functions and allowing such formulas in function calls instead of
functions.")
    (license license:gpl2+)))

(define-public r-sqldf
  (package
    (name "r-sqldf")
    (version "0.4-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sqldf" version))
       (sha256
        (base32
         "0q12vsb53p2wchgp8wfz5bk08wfnm0jxjrakclj4jyy6x3a7ksff"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-chron" ,r-chron)
       ("r-dbi" ,r-dbi)
       ("r-gsubfn" ,r-gsubfn)
       ("r-proto" ,r-proto)
       ("r-rsqlite" ,r-rsqlite)))
    (home-page "https://github.com/ggrothendieck/sqldf")
    (synopsis "Manipulate R data frames using SQL")
    (description
     "The @code{sqldf} function is typically passed a single argument which is
an SQL select statement where the table names are ordinary R data frame names.
@code{sqldf} transparently sets up a database, imports the data frames into
that database, performs the SQL statement and returns the result using a
heuristic to determine which class to assign to each column of the returned
data frame.  The @code{sqldf} or @code{read.csv.sql} functions can also be
used to read filtered files into R even if the original files are larger than
R itself can handle.")
    (license license:gpl2)))

(define-public r-abind
  (package
    (name "r-abind")
    (version "1.4-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abind" version))
       (sha256
        (base32
         "0b1zd8jbnl6l292cr9rb50m09fy3ylxvzkpgi5lfb1nbzddcwfis"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abind/")
    (synopsis "Combine multidimensional arrays")
    (description
     "This package provides tools to combine multidimensional arrays into a
single array.  This is a generalization of @code{cbind} and @code{rbind}.  It
works with vectors, matrices, and higher-dimensional arrays.  It also provides
the functions @code{adrop}, @code{asub}, and @code{afill} for manipulating,
extracting and replacing data in arrays.")
    (license license:lgpl2.0+)))

(define-public r-prroc
  (package
    (name "r-prroc")
    (version "1.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PRROC" version))
       (sha256
        (base32
         "1m28h8pcd78049lz2qixhkcr9h5b3jik3maqzfbvq9y58z71i4a7"))))
    (properties `((upstream-name . "PRROC")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/PRROC/")
    (synopsis "Precision-Recall and ROC curves for weighted and unweighted data")
    (description
     "This package computes the areas under the @dfn{precision-recall} (PR)
and ROC curve for weighted (e.g. soft-labeled) and unweighted data.  In
contrast to other implementations, the interpolation between points of the PR
curve is done by a non-linear piecewise function.  In addition to the areas
under the curves, the curves themselves can also be computed and plotted by a
specific S3-method.")
    (license license:gpl3)))

(define-public r-vim
  (package
    (name "r-vim")
    (version "4.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "VIM" version))
       (sha256
        (base32
         "1vjcs5wvjv94ln01d94h9rs4j50d3ky4n26mm3prgh13raylrmnd"))))
    (properties `((upstream-name . "VIM")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-colorspace" ,r-colorspace)
       ("r-data-table" ,r-data-table)
       ("r-e1071" ,r-e1071)
       ("r-laeken" ,r-laeken)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-rcpp" ,r-rcpp)
       ("r-robustbase" ,r-robustbase)
       ("r-sp" ,r-sp)
       ("r-vcd" ,r-vcd)))
    (home-page "https://github.com/alexkowa/VIM")
    (synopsis "Visualization and imputation of missing values")
    (description
     "This package provides tools for the visualization of missing and/or
imputed values are introduced, which can be used for exploring the data and
the structure of the missing and/or imputed values.  Depending on this
structure of the missing values, the corresponding methods may help to
identify the mechanism generating the missing values and allows to explore the
data including missing values.  In addition, the quality of imputation can be
visually explored using various univariate, bivariate, multiple and
multivariate plot methods.")
    (license license:gpl2+)))

(define-public r-fnn
  (package
    (name "r-fnn")
    (version "1.1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "FNN" version))
       (sha256
        (base32
         "1n61jrcmakqif8f827x4qnlhm2jqpj5fgjj65c4p0kdd8lzw8pqp"))))
    (properties `((upstream-name . "FNN")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/FNN")
    (synopsis "Fast nearest neighbor search algorithms and applications")
    (description
     "This package provides cover-tree and kd-tree fast k-nearest neighbor
search algorithms.  Related applications including KNN classification,
regression and information measures are implemented.")
    ;; The DESCRIPTION file erroneously states that GPL version 2.1 or
    ;; later can be used.
    (license license:gpl2+)))

(define-public r-smoother
  (package
    (name "r-smoother")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "smoother" version))
       (sha256
        (base32
         "0nqr1bvlr5bnasqg74zmknjjl4x28kla9h5cxpga3kq5z215pdci"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ttr" ,r-ttr)))
    (home-page "http://cran.r-project.org/web/packages/smoother")
    (synopsis "Functions relating to the smoothing of numerical data")
    (description
     "This package provides a collection of methods for smoothing numerical
data, commencing with a port of the Matlab gaussian window smoothing function.
In addition, several functions typically used in smoothing of financial data
are included.")
    (license license:gpl2)))

(define-public r-riverplot
  (package
    (name "r-riverplot")
    (version "0.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "riverplot" version))
       (sha256
        (base32
         "0q1icpny8nkxyjhawyjzwrw8qlz0ayn2xyrsqrm4vkxyv6c9xk8z"))))
    (build-system r-build-system)
    (home-page "https://logfc.wordpress.com")
    (synopsis "Sankey or ribbon plots")
    (description
     "Sankey plots are a type of diagram that is convenient to illustrate how
flow of information, resources etc. separates and joins, much like observing
how rivers split and merge.  For example, they can be used to compare
different clusterings.  This package provides an implementation of Sankey
plots for R.")
    (license license:gpl2+)))

(define-public r-dyn
  (package
    (name "r-dyn")
    (version "0.2-9.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dyn" version))
       (sha256
        (base32
         "16fqv9k7yxdgybwzafjkyqm16qpgqz13lcjpi6a1nc8xbzlzh0gb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/dyn")
    (synopsis "Time series regression")
    (description
     "This package provides the dyn class interfaces @code{ts}, @code{irts},
@code{zoo} and @code{zooreg} time series classes to @code{lm}, @code{glm},
@code{loess}, @code{quantreg::rq}, @code{MASS::rlm},
@code{MCMCpack::MCMCregress()}, @code{quantreg::rq()},
@code{randomForest::randomForest()} and other regression functions, allowing
those functions to be used with time series including specifications that may
contain lags, diffs and missing values.")
    ;; Any GPL version.
    (license license:gpl2+)))

(define-public r-catdap
  (package
    (name "r-catdap")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "catdap" version))
       (sha256
        (base32
         "0i877l61f6c75pczi235rzci67w29zv1d7z5zn5p5ymndclvlpl2"))))
    (build-system r-build-system)
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/catdap/")
    (synopsis "Tools for categorical data analysis")
    (description
     "This package provides functions for analyzing multivariate data.
Dependencies of the distribution of the specified variable (response
variable) to other variables (explanatory variables) are derived and
evaluated by the @dfn{Akaike Information Criterion} (AIC).")
    (license license:gpl2+)))

(define-public r-arules
  (package
    (name "r-arules")
    (version "1.6-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "arules" version))
       (sha256
        (base32
         "0glfqgxr87900kigmkby2ff7qrjvd6aq595q85y056i5ckjcp615"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-matrix" ,r-matrix)))
    (home-page "https://github.com/mhahsler/arules")
    (synopsis "Mining association rules and frequent itemsets")
    (description
     "This package provides an infrastructure for representing, manipulating
and analyzing transaction data and patterns (frequent itemsets and association rules).
It also provides C implementations of the association mining algorithms Apriori
and Eclat.")
    (license license:gpl3)))

(define-public r-parsedate
  (package
    (name "r-parsedate")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "parsedate" version))
       (sha256
        (base32
         "0mg7hbm3903iwvmpn51gjpaaq03rsp72hjb1g8h5g84r81iha002"))))
    (build-system r-build-system)
    (home-page "https://github.com/gaborcsardi/parsedate")
    (synopsis
     "Recognize and parse dates in various formats")
    (description
     "This package provides three functions for dealing with dates:
@code{parse_iso_8601} recognizes and parses all valid ISO 8601 date and
time formats, @code{parse_date} parses dates in unspecified formats,
and @code{format_iso_8601} formats a date in ISO 8601 format.")
    (license license:gpl2)))

(define-public r-abc-data
  (package
    (name "r-abc-data")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abc.data" version))
       (sha256
        (base32
         "1bv1n68ah714ws58cf285n2s2v5vn7382lfjca4jxph57lyg8hmj"))))
    (properties `((upstream-name . "abc.data")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abc.data/")
    (synopsis "Data for Approximate Bayesian Computation (ABC) package")
    (description
     "This package contains data which are used by functions of the abc
package which implements several @dfn{Approximate Bayesian Computation} (ABC)
algorithms for performing parameter estimation, model selection, and
goodness-of-fit.")
    (license license:gpl3+)))

(define-public r-abc
  (package
    (name "r-abc")
    (version "2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abc" version))
       (sha256
        (base32
         "0ngzaaz2y2s03fhngvwipmy4kq38xrmyddaz6a6l858rxvadrlhb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abc-data" ,r-abc-data)
       ("r-locfit" ,r-locfit)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-quantreg" ,r-quantreg)))
    (home-page "https://cran.r-project.org/web/packages/abc/")
    (synopsis "Tools for Approximate Bayesian Computation (ABC)")
    (description
     "This package implements several @dfn{Approximate Bayesian
Computation} (ABC) algorithms for performing parameter estimation, model
selection, and goodness-of-fit.  Cross-validation tools are also available for
measuring the accuracy of ABC estimates, and to calculate the
misclassification probabilities of different models.")
    (license license:gpl3+)))

(define-public r-zip
  (package
    (name "r-zip")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "zip" version))
       (sha256
        (base32
         "0rgr9pcdhdq3k8n29h2ircp3ri1ibhrx81gja1y7331v15xyrabg"))))
    (build-system r-build-system)
    (home-page "https://github.com/gaborcsardi/zip")
    (synopsis "Cross-platform Zip compression")
    (description
     "This package provides a cross-platform Zip compression library for R.
It is a replacement for the @code{zip} function, that does not require any
additional external tools on any platform.")
    (license license:cc0)))

(define-public r-openxlsx
  (package
    (name "r-openxlsx")
    (version "4.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "openxlsx" version))
       (sha256
        (base32
         "1n7z22pm78xa77fvn77kdn68az6xzxk36y11sqf0w6h6adri4yxb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)
       ("r-zip" ,r-zip)))
    (home-page "https://github.com/awalker89/openxlsx")
    (synopsis "Read, write and edit XLSX files")
    (description
     "This package simplifies the creation of Excel @code{.xlsx} files by
providing a high level interface to writing, styling and editing worksheets.
Through the use of Rcpp, read/write times are comparable to the @code{xlsx}
and @code{XLConnect} packages with the added benefit of removing the
dependency on Java.")
    (license license:gpl3)))

(define-public r-rio
  (package
    (name "r-rio")
    (version "0.5.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rio" version))
       (sha256
        (base32
         "158xg3vj0glk3fslwi6fywwmfym2b6kn3fdmjligdfy5lf68khix"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-curl" ,r-curl)
       ("r-data-table" ,r-data-table)
       ("r-foreign" ,r-foreign)
       ("r-haven" ,r-haven)
       ("r-openxlsx" ,r-openxlsx)
       ("r-readxl" ,r-readxl)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/leeper/rio")
    (synopsis "Swiss-army knife for data I/O")
    (description
     "This package provides streamlined data import and export infrastructure
by making assumptions that the user is probably willing to make: @code{import}
and @code{export} determine the data structure from the file extension,
reasonable defaults are used for data import and export (e.g.,
@code{stringsAsFactors=FALSE}), web-based import is natively
supported (including from SSL/HTTPS), compressed files can be read directly
without explicit decompression, and fast import packages are used where
appropriate.  An additional convenience function, @code{convert}, provides a
simple method for converting between file types.")
    (license license:gpl2)))

(define-public r-maptools
  (package
    (name "r-maptools")
    (version "0.9-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "maptools" version))
       (sha256
        (base32
         "1753kgyc4kmbb5h6knz5wgvvvj8v77kzm8lz0kwz05m5k3spa24k"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreign" ,r-foreign)
       ("r-lattice" ,r-lattice)
       ("r-sp" ,r-sp)))
    (home-page "http://r-forge.r-project.org/projects/maptools/")
    (synopsis "Tools for reading and handling spatial objects")
    (description
     "This package provides a set of tools for manipulating and reading
geographic data, in particular ESRI Shapefiles.  It includes binary access to
GSHHG shoreline files.  The package also provides interface wrappers for
exchanging spatial objects with other R packages.")
    ;; The C source files from shapelib are released under the Expat license.
    ;; The R code is released under GPL version 2 or later.
    (license (list license:gpl2+
                   license:expat))))

(define-public r-later
  (package
    (name "r-later")
    (version "0.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "later" version))
       (sha256
        (base32
         "0xhwn37makzm85zb6w5acc7svzibxcnz69rks0kxw22vapkxwz1i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)))
    (home-page "https://github.com/r-lib/later")
    (synopsis "Utilities for delaying function execution")
    (description
     "This package provides tools to execute arbitrary R or C functions some
time after the current time, after the R execution stack has emptied.")
    (license license:gpl2+)))

(define-public r-promises
  (package
    (name "r-promises")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "promises" version))
       (sha256
        (base32
         "0n2mlv6bvfb4yhgcml696l9vkbw21pz0smqylivr606z99rwgny2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-later" ,r-later)
       ("r-magrittr" ,r-magrittr)
       ("r-r6" ,r-r6)
       ("r-rcpp" ,r-rcpp)
       ("r-rlang" ,r-rlang)))
    (home-page "https://rstudio.github.io/promises")
    (synopsis "Abstractions for promise-based asynchronous programming")
    (description
     "This package provides fundamental abstractions for doing asynchronous
programming in R using promises.  Asynchronous programming is useful for
allowing a single R process to orchestrate multiple tasks in the background
while also attending to something else.  Semantics are similar to JavaScript
promises, but with a syntax that is idiomatic R.")
    (license license:expat)))

(define-public r-dosnow
  (package
    (name "r-dosnow")
    (version "1.0.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "doSNOW" version))
       (sha256
        (base32
         "13ir4a8252h4yvp5ir9xnwack1kn58i4ny6sf2qdc12zspn3850n"))))
    (properties `((upstream-name . "doSNOW")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-foreach" ,r-foreach)
       ("r-iterators" ,r-iterators)
       ("r-snow" ,r-snow)))
    (home-page "https://cran.r-project.org/web/packages/doSNOW")
    (synopsis "Foreach parallel adaptor for the snow package")
    (description
     "This package provides a parallel backend for the @code{%dopar%} function
using the @code{snow} package.")
    (license license:gpl2)))

(define-public r-snowfall
  (package
   (name "r-snowfall")
   (version "1.84-6.1")
   (source (origin
            (method url-fetch)
            (uri (cran-uri "snowfall" version))
            (sha256
             (base32 "13941rlw1jsdjsndp1plzj1cq5aqravizkrqn6l25r9im7rnsi2w"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-snow" ,r-snow)))
   (home-page "http://cran.r-project.org/web/packages/snowfall/")
   (synopsis "Easier cluster computing")
   (description "This package is a usability wrapper around snow for easier
development of parallel R programs.  This package offers e.g. extended error
checks, and additional functions.  All functions work in sequential mode, too,
if no cluster is present or wished.  The package is also designed as connector
to the cluster management tool @code{sfCluster}, but can also used without
it.")
   (license license:gpl2+)))

(define-public r-rappdirs
  (package
    (name "r-rappdirs")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rappdirs" version))
       (sha256
        (base32
         "0ji6sg3bdn5gazkq14xmmcq7jnbsyxw4lzmmbgv6526j2vn93n1g"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rappdirs/")
    (synopsis "Determine where to save data, caches, and logs")
    (description
     "This package provides an easy way to determine which directories on the
user's computer should be used to save data, caches and logs.  It is a port of
Python's @url{https://github.com/ActiveState/appdirs,Appdirs} to R.")
    (license license:expat)))

(define-public r-learnr
  (package
    (name "r-learnr")
    (version "0.9.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "learnr" version))
       (sha256
        (base32
         "0jbk0g6fkw7zs8ykzhsvh9vvz8xmc4v03bqzjsa5mmpxpqan5vx5"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-evaluate" ,r-evaluate)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-jsonlite" ,r-jsonlite)
       ("r-knitr" ,r-knitr)
       ("r-markdown" ,r-markdown)
       ("r-rappdirs" ,r-rappdirs)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-rprojroot" ,r-rprojroot)
       ("r-shiny" ,r-shiny)
       ("r-withr" ,r-withr)))
    (home-page "https://rstudio.github.io/learnr/")
    (synopsis "Interactive tutorials for R")
    (description
     "This package provides tools to create interactive tutorials using R
Markdown.  Use a combination of narrative, figures, videos, exercises, and
quizzes to create self-paced tutorials for learning about R and R packages.")
    (license license:asl2.0)))

(define-public r-analytics
  (package
    (name "r-analytics")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "analytics" version))
       (sha256
        (base32
         "0js3c8lwj3knccb55nq03cbjlf4w390p9aid2mi5x80l3ayd9in1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-cluster" ,r-cluster)
       ("r-fractal" ,r-fractal)
       ("r-lmtest" ,r-lmtest)
       ("r-mass" ,r-mass)
       ("r-np" ,r-np)
       ("r-powerplus" ,r-powerplus)
       ("r-robust" ,r-robust)
       ("r-trend" ,r-trend)
       ("r-tsa" ,r-tsa)
       ("r-urca" ,r-urca)
       ("r-vim" ,r-vim)))
    (home-page "https://cran.r-project.org/web/packages/analytics/")
    (synopsis "Collection of data analysis tools")
    (description
     "This package is a collection of data analysis tools.  It includes tools
for regression outlier detection in a fitted linear model, stationary
bootstrap using a truncated geometric distribution, a comprehensive test for
weak stationarity, column means by group, weighted biplots, and a heuristic to
obtain a better initial configuration in non-metric MDS.")
    (license license:gpl2)))

(define-public r-reticulate
  (package
    (name "r-reticulate")
    (version "1.10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reticulate" version))
       (sha256
        (base32
         "0bz3lxbisjwn6cv23090zivpy0bxcncr82g5qja13l37i8xnvqsq"))))
    (build-system r-build-system)
    (inputs `(("python" ,python)))
    (propagated-inputs
     `(("r-jsonlite" ,r-jsonlite)
       ("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/rstudio/reticulate")
    (synopsis "R interface to Python")
    (description
     "This package provides an interface from R to Python modules, classes,
and functions.  When calling into Python, R data types are automatically
converted to their equivalent Python types.  When values are returned from
Python to R they are converted back to R types.")
    (license license:asl2.0)))

(define-public r-bibtex
  (package
    (name "r-bibtex")
    (version "0.4.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bibtex" version))
       (sha256
        (base32
         "0wl3925ryd54g1nv3ncwllc493d39dpgy5md61940h69c0van1hz"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-stringr" ,r-stringr)))
    (home-page "https://github.com/romainfrancois/bibtex")
    (synopsis "Bibtex parser")
    (description "This package provides a utility for R to parse a bibtex
file.")
    (license license:gpl2+)))

(define-public r-ggseqlogo
  (package
    (name "r-ggseqlogo")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggseqlogo" version))
       (sha256
        (base32
         "13q6kcpxrqxqbji889fx63p0nsi08lk5yymkchig75r5k1d18ky1"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-ggplot2" ,r-ggplot2)))
    (home-page "https://github.com/omarwagih/ggseqlogo")
    (synopsis "ggplot2 extension for drawing genetic sequence logos")
    (description
     "The range of functions provided by this package makes it possible to
draw highly versatile genomic sequence logos.  Features include, but are not
limited to, modifying colour schemes and fonts used to draw the logo,
generating multiple logo plots, and aiding the visualisation with annotations.
Sequence logos can easily be combined with other ggplot2 plots.")
    ;; Unspecified version of the LGPL.
    (license license:lgpl3+)))

(define-public r-ggsci
  (package
    (name "r-ggsci")
    (version "2.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggsci" version))
       (sha256
        (base32
         "0g73x6grbka7ahjh6z23m3wrcifp5rdfdiasbl8lq4sp6rplxwaa"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-scales" ,r-scales)))
    (home-page "https://nanx.me/ggsci/")
    (synopsis "Scientific journal and sci-fi themed color palettes for ggplot2")
    (description
     "This package provides a collection of ggplot2 color palettes inspired by
plots in scientific journals, data visualization libraries, science fiction
movies, and TV shows.")
    (license license:gpl3)))

(define-public r-ggsignif
  (package
    (name "r-ggsignif")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggsignif" version))
       (sha256
        (base32
         "1rn58d7pb3axk6chiihryykrzw76adaa2yiafq4d0j6qbhax78f7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)))
    (home-page "https://github.com/const-ae/ggsignif")
    (synopsis "Significance brackets for ggplot2")
    (description
     "Enrich your ggplots with group-wise comparisons.  This package provides
an easy way to indicate if two groups are significantly different.  Commonly
this is shown by a bracket on top connecting the groups of interest which
itself is annotated with the level of significance.  The package provides a
single layer that takes the groups for comparison and the test as arguments
and adds the annotation to the plot.")
    (license license:gpl3)))

(define-public r-ggpubr
  (package
    (name "r-ggpubr")
    (version "0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggpubr" version))
       (sha256
        (base32
         "0rkpcjb1x7lvhj68aam5airbi534jqyiq12x5xk40a25iifhghq6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cowplot" ,r-cowplot)
       ("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggrepel" ,r-ggrepel)
       ("r-ggsci" ,r-ggsci)
       ("r-ggsignif" ,r-ggsignif)
       ("r-glue" ,r-glue)
       ("r-gridextra" ,r-gridextra)
       ("r-magrittr" ,r-magrittr)
       ("r-polynom" ,r-polynom)
       ("r-purrr" ,r-purrr)
       ("r-scales" ,r-scales)
       ("r-tidyr" ,r-tidyr)))
    (home-page "http://www.sthda.com/english/rpkgs/ggpubr")
    (synopsis "ggplot2-based publication-ready plots")
    (description
     "The ggplot2 package is an excellent and flexible package for elegant
data visualization in R.  However the default generated plots require some
formatting before we can send them for publication.  The ggpubr package
provides some easy-to-use functions for creating and customizing ggplot2-based
publication-ready plots.")
    (license license:gpl2)))

(define-public r-ellipse
  (package
    (name "r-ellipse")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ellipse" version))
       (sha256
        (base32
         "0g82vc51m3c1k0hnpp2zla6amxxgk2mmkl8ssnsc49jv3599r6hs"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ellipse/")
    (synopsis "Functions for drawing ellipses and ellipse-like confidence regions")
    (description
     "This package contains various routines for drawing ellipses and
ellipse-like confidence regions, implementing the plots described in Murdoch
and Chow (1996), A graphical display of large correlation matrices, The
American Statistician 50, 178-180.  There are also routines implementing the
profile plots described in Bates and Watts (1988), Nonlinear Regression
Analysis and its Applications.")
    (license license:gpl2+)))

(define-public r-flashclust
  (package
    (name "r-flashclust")
    (version "1.01-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "flashClust" version))
       (sha256
        (base32
         "0l4lpz451ll7f7lfxmb7ds24ppzhfg1c3ypvydglcc35p2dq99s8"))))
    (properties `((upstream-name . "flashClust")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/flashClust/")
    (synopsis "Implementation of optimal hierarchical clustering")
    (description
     "This package provides a fast implementation of hierarchical
clustering.")
    (license license:gpl2+)))

(define-public r-factominer
  (package
    (name "r-factominer")
    (version "1.41")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "FactoMineR" version))
       (sha256
        (base32
         "1h20hydav6l2b7bngqw1av4l5rrh0wk58nhailga1f4qw9lrv259"))))
    (properties `((upstream-name . "FactoMineR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-cluster" ,r-cluster)
       ("r-ellipse" ,r-ellipse)
       ("r-flashclust" ,r-flashclust)
       ("r-lattice" ,r-lattice)
       ("r-leaps" ,r-leaps)
       ("r-mass" ,r-mass)
       ("r-scatterplot3d" ,r-scatterplot3d)))
    (home-page "http://factominer.free.fr")
    (synopsis "Multivariate exploratory data analysis and data mining")
    (description
     "This package provides exploratory data analysis methods to summarize,
visualize and describe datasets.  The main principal component methods are
available, those with the largest potential in terms of applications:
principal component analysis (PCA) when variables are quantitative,
correspondence analysis (CA) and multiple correspondence analysis (MCA) when
variables are categorical, Multiple Factor Analysis when variables are
structured in groups, etc. and hierarchical cluster analysis.")
    (license license:gpl2+)))

(define-public r-factoextra
  (package
    (name "r-factoextra")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "factoextra" version))
       (sha256
        (base32
         "1l6m8k7qhdw8ndar8nhmym0lfyd1i2iszl1cicjax0vq23ss6xw1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-cluster" ,r-cluster)
       ("r-dendextend" ,r-dendextend)
       ("r-factominer" ,r-factominer)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggpubr" ,r-ggpubr)
       ("r-ggrepel" ,r-ggrepel)
       ("r-reshape2" ,r-reshape2)
       ("r-tidyr" ,r-tidyr)))
    (home-page "http://www.sthda.com/english/rpkgs/factoextra")
    (synopsis "Extract and visualize the results of multivariate data analyses")
    (description
     "This package provides some easy-to-use functions to extract and
visualize the output of multivariate data analyses, including
@code{PCA} (Principal Component Analysis), @code{CA} (Correspondence
Analysis), @code{MCA} (Multiple Correspondence Analysis), @code{FAMD} (Factor
Analysis of Mixed Data), @code{MFA} (Multiple Factor Analysis) and
@code{HMFA} (Hierarchical Multiple Factor Analysis) functions from different R
packages.  It contains also functions for simplifying some clustering analysis
steps and provides ggplot2-based elegant data visualization.")
    (license license:gpl2)))

(define-public r-fansi
  (package
    (name "r-fansi")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fansi" version))
       (sha256
        (base32
         "02f2rx7v7wz6w97m2slwky2i5y8f9iafycmkyr3siy3z3k8fj171"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr))) ; for vignettes
    (home-page "https://github.com/brodieG/fansi")
    (synopsis "ANSI control sequence aware string functions")
    (description
     "This package provides counterparts to R string manipulation functions
that account for the effects of ANSI text formatting control sequences.")
    (license license:gpl2+)))

(define-public r-nbclust
  (package
    (name "r-nbclust")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "NbClust" version))
       (sha256
        (base32
         "1vwb48zy6ln1ddpqmfngii1i80n8qmqyxnzdp6gbaq96lakl3w3c"))))
    (properties `((upstream-name . "NbClust")))
    (build-system r-build-system)
    (home-page "https://sites.google.com/site/malikacharrad/research/nbclust-package")
    (synopsis "Determine the best number of clusters in a data set")
    (description
     "NbClust provides 30 indexes for determining the optimal number of
clusters in a data set and offers the best clustering scheme from different
results to the user.")
    (license license:gpl2)))

(define-public r-hdf5r
  (package
    (name "r-hdf5r")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "hdf5r" version))
       (sha256
        (base32
         "0h222q80li8rs3cv4c5lvv3g91ygd51w43ay6fwyk9q9d315vwrj"))))
    (build-system r-build-system)
    (inputs
     `(("hdf5" ,hdf5)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(("r-bit64" ,r-bit64)
       ("r-r6" ,r-r6)))
    (home-page "https://hhoeflin.github.io/hdf5r")
    (synopsis "Interface to the HDF5 binary data format")
    (description
     "HDF5 is a data model, library and file format for storing and managing
large amounts of data.  This package provides a nearly feature complete,
object oriented wrapper for the HDF5 API using R6 classes.  Additionally,
functionality is added so that HDF5 objects behave very similar to their
corresponding R counterparts.")
    (license license:asl2.0)))

(define-public r-itertools
  (package
    (name "r-itertools")
    (version "0.1-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "itertools" version))
       (sha256
        (base32
         "1ls5biiva10pb1dj3ph4griykb9vam02hkrdmlr5a5wf660hg6xn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-iterators" ,r-iterators)))
    (home-page "https://cran.r-project.org/web/packages/itertools/")
    (synopsis "Iterator tools")
    (description
     "This package provides various tools for creating iterators, many
patterned after functions in the Python @code{itertools} module, and others
patterned after functions in the snow package.")
    (license license:gpl2)))

(define-public r-polynom
  (package
    (name "r-polynom")
    (version "1.3-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "polynom" version))
       (sha256
        (base32
         "1s4xxv5rvpigawknvq27v9vzvs83phfsj5h8mim2lmf5bj950nnk"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/polynom/")
    (synopsis "Functions for univariate polynomial manipulations")
    (description
     "This package provides a collection of functions to implement a class for
univariate polynomial manipulations.")
    (license license:gpl2)))

(define-public r-gbrd
  (package
    (name "r-gbrd")
    (version "0.4-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gbRd" version))
       (sha256
        (base32
         "06x97rw5i6v6cgjxkfhxnw4dn7lghn5q6ra7ri5ag1x9dkfzcl82"))))
    (properties `((upstream-name . "gbRd")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/gbRd/")
    (synopsis "Utilities for processing Rd objects and files")
    (description
     "This package provides utilities for processing Rd objects and files.
Extract argument descriptions and other parts of the help pages of
functions.")
    (license license:gpl2+)))

(define-public r-rjags
  (package
    (name "r-rjags")
    (version "4-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rjags" version))
       (sha256
        (base32
         "17xmjksj69f9wk4x71jxk4cgiqhaf2fj6bjm0mgzp4qln5x84a8m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-coda" ,r-coda)))
    (inputs
     `(("jags" ,jags)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "http://mcmc-jags.sourceforge.net")
    (synopsis "Bayesian graphical models using MCMC")
    (description
     "This package provides an R interface to the JAGS MCMC library.  JAGS is
Just Another Gibbs Sampler.  It is a program for analysis of Bayesian
hierarchical models using Markov Chain Monte Carlo (MCMC) simulation.")
    (license license:gpl2)))

(define-public r-rdpack
  (package
    (name "r-rdpack")
    (version "0.10-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rdpack" version))
       (sha256
        (base32
         "0bbjnw88h54v40hzim00i8yd3p4rk9i84zfdmgcbnylscwvsf0av"))))
    (properties `((upstream-name . "Rdpack")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bibtex" ,r-bibtex)
       ("r-gbrd" ,r-gbrd)))
    (home-page "https://github.com/GeoBosh/Rdpack")
    (synopsis "Update and manipulate Rd documentation objects")
    (description
     "This package provides functions for manipulation of R documentation
objects, including functions @code{reprompt()} and @code{ereprompt()} for
updating Rd documentation for functions, methods and classes; it also includes
Rd macros for citations and import of references from bibtex files for use in
Rd files and roxygen2 comments, as well as many functions for manipulation of
references and Rd files.")
    (license license:gpl2+)))

(define-public r-officer
  (package
    (name "r-officer")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "officer" version))
       (sha256
        (base32
         "14b6ii9h3fi5g8ja929mfhxps9r7x78flqjdy437y9aygkhmiz2i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-digest" ,r-digest)
       ("r-htmltools" ,r-htmltools)
       ("r-magrittr" ,r-magrittr)
       ("r-r6" ,r-r6)
       ("r-rcpp" ,r-rcpp)
       ("r-uuid" ,r-uuid)
       ("r-xml2" ,r-xml2)
       ("r-zip" ,r-zip)))
    (home-page "https://davidgohel.github.io/officer")
    (synopsis "Manipulation of Word and PowerPoint documents")
    (description
     "This package provides tools to access and manipulate Word and PowerPoint
documents from R.  The package focuses on tabular and graphical reporting from
R; it also provides two functions that let users get document content into
data objects.  A set of functions lets add and remove images, tables and
paragraphs of text in new or existing documents.  When working with PowerPoint
presentations, slides can be added or removed; shapes inside slides can also
be added or removed.  When working with Word documents, a cursor can be used
to help insert or delete content at a specific location in the document.")
    (license license:gpl3)))

(define-public r-abn
  (package
    (name "r-abn")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abn" version))
       (sha256
        (base32
         "00k0razgdb5y5f62622fm7rxkcxrxg470nyyb02dvpfp60254kvs"))))
    (build-system r-build-system)
    (inputs
     `(("gsl" ,gsl)))
    (propagated-inputs
     `(("r-cairo" ,r-cairo)
       ("r-lme4" ,r-lme4)
       ("r-mass" ,r-mass)
       ("r-nnet" ,r-nnet)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-rjags" ,r-rjags)))
    (home-page "http://www.r-bayesian-networks.org")
    (synopsis "Modelling multivariate data with additive bayesian networks")
    (description
     "Bayesian network analysis is a form of probabilistic graphical models
which derives from empirical data a directed acyclic graph, DAG, describing
the dependency structure between random variables.  An additive Bayesian
network model consists of a form of a DAG where each node comprises a
@dfn{generalized linear model} (GLM).  Additive Bayesian network models are
equivalent to Bayesian multivariate regression using graphical modelling, they
generalises the usual multivariable regression, GLM, to multiple dependent
variables.  This package provides routines to help determine optimal Bayesian
network models for a given data set, where these models are used to identify
statistical dependencies in messy, complex data.")
    (license license:gpl2+)))

(define-public r-acd
  (package
    (name "r-acd")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACD" version))
       (sha256
        (base32
         "1a67bi3hklq8nlc50r0qnyr4k7m9kpvijy8sqqpm54by5hsysfd6"))))
    (properties `((upstream-name . "ACD")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ACD/")
    (synopsis "Categorical data analysis with complete or missing responses")
    (description
     "This package provides tools for categorical data analysis with complete
or missing responses.")
    (license license:gpl2+)))

(define-public r-acdm
  (package
    (name "r-acdm")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACDm" version))
       (sha256
        (base32
         "0b4f02ga5ra66mbrm79g0bnlzmii82rks9kmxixxqgf18yhlyjil"))))
    (properties `((upstream-name . "ACDm")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-rsolnp" ,r-rsolnp)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/ACDm/")
    (synopsis "Tools for Autoregressive Conditional Duration Models")
    (description
     "ACDm is a package for Autoregressive Conditional Duration (ACD, Engle
and Russell, 1998) models.  It creates trade, price or volume durations from
transactions (tic) data, performs diurnal adjustments, fits various ACD models
and tests them.")
    (license license:gpl2+)))

(define-public r-overlap
  (package
    (name "r-overlap")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "overlap" version))
       (sha256
        (base32
         "1j3m6ir1chdz0si2fhcw6gs7c9h09bv0chz18rpzxsywww6d4rzy"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/overlap/")
    (synopsis "Estimates of coefficient of overlapping for animal activity patterns")
    (description
     "This package provides functions to fit kernel density functions to data
on temporal activity patterns of animals; estimate coefficients of overlapping
of densities for two species; and calculate bootstrap estimates of confidence
intervals.")
    (license license:gpl3+)))

(define-public r-snakecase
  (package
    (name "r-snakecase")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "snakecase" version))
       (sha256
        (base32
         "1g6xai53dl24ws0mwhqrkcv583ziaq505cv3z8v5dhjgy98kilyj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-stringi" ,r-stringi)
       ("r-stringr" ,r-stringr)))
    (home-page "https://github.com/Tazinho/snakecase")
    (synopsis "Convert strings into any case")
    (description
     "This package provides a consistent, flexible and easy to use tool to
parse and convert strings into cases like snake or camel among others.")
    (license license:gpl3)))

(define-public r-prediction
  (package
    (name "r-prediction")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "prediction" version))
       (sha256
        (base32
         "19d7312f5lkqfglfvlgssnvyw7gl161s0xradcry44r1i6qp05j1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-data-table" ,r-data-table)))
    (home-page "https://github.com/leeper/prediction")
    (synopsis "Tidy, type-safe prediction methods")
    (description
     "This package provides the @code{prediction()} function, a type-safe
alternative to @code{predict()} that always returns a data frame.  The package
currently supports common model types (e.g., @code{\"lm\"}, @code{\"glm\"})
from the @code{stats} package, as well as numerous other model classes from
other add-on packages.")
    (license license:expat)))

(define-public r-sjlabelled
  (package
    (name "r-sjlabelled")
    (version "1.0.14")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjlabelled" version))
       (sha256
        (base32
         "0ayfzhm9bwjfaarq5z0gvn9kapjwj3532azgin97nr5fnjdhvgaw"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-haven" ,r-haven)
       ("r-magrittr" ,r-magrittr)
       ("r-prediction" ,r-prediction)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-snakecase" ,r-snakecase)
       ("r-tibble" ,r-tibble)
       ("r-tidyselect" ,r-tidyselect)))
    (home-page "https://github.com/strengejacke/sjlabelled")
    (synopsis "Labelled data utility functions")
    (description
     "This package provides a collection of functions dealing with labelled
data, like reading and writing data between R and other statistical software
packages.  This includes easy ways to get, set or change value and variable
label attributes, to convert labelled vectors into factors or numeric (and
vice versa), or to deal with multiple declared missing values.")
    (license license:gpl3)))

(define-public r-sjmisc
  (package
    (name "r-sjmisc")
    (version "2.7.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjmisc" version))
       (sha256
        (base32
         "1jhrigikjpkdar3jxvi7qhqsg6lgjkjqhqll9vaay98b88rfc2im"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-crayon" ,r-crayon)
       ("r-dplyr" ,r-dplyr)
       ("r-haven" ,r-haven)
       ("r-magrittr" ,r-magrittr)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-sjlabelled" ,r-sjlabelled)
       ("r-stringdist" ,r-stringdist)
       ("r-stringr" ,r-stringr)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/strengejacke/sjmisc")
    (synopsis "Data and variable transformation functions")
    (description
     "This package is a collection of miscellaneous utility functions,
supporting data transformation tasks like recoding, dichotomizing or grouping
variables, setting and replacing missing values.  The data transformation
functions also support labelled data, and all integrate seamlessly into a
tidyverse workflow.")
    (license license:gpl3)))

(define-public r-nortest
  (package
    (name "r-nortest")
    (version "1.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "nortest" version))
       (sha256
        (base32
         "17r0wpz72z9312c70nwi1i1kp1v9fm1h6jg7q5cx1mc1h420m1d3"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/nortest/")
    (synopsis "Tests for normality")
    (description
     "This package provides five omnibus tests for testing the composite
hypothesis of normality.")
    (license license:gpl2+)))

(define-public r-moonbook
  (package
    (name "r-moonbook")
    (version "0.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "moonBook" version))
       (sha256
        (base32
         "0hys56mwbm776ff7dibi8wzyf69qiais9rs1jazv79lk6h56s9s6"))))
    (properties `((upstream-name . "moonBook")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-magrittr" ,r-magrittr)
       ("r-nortest" ,r-nortest)
       ("r-purrr" ,r-purrr)
       ("r-sjmisc" ,r-sjmisc)
       ("r-stringr" ,r-stringr)
       ("r-survival" ,r-survival)))
    (home-page "https://github.com/cardiomoon/moonBook")
    (synopsis "Functions and datasets for the book by Keon-Woong Moon")
    (description
     "This package provides several analysis-related functions for the book
entitled \"R statistics and graph for medical articles\" (written in Korean),
version 1, by Keon-Woong Moon with Korean demographic data with several plot
functions.")
    (license license:gpl2)))

(define-public r-flextable
  (package
    (name "r-flextable")
    (version "0.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "flextable" version))
       (sha256
        (base32
         "0fa42dvf0wyl91w4v0rywm3xgw9n03cfyl28ficrv8iabz4k4382"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-gdtools" ,r-gdtools)
       ("r-htmltools" ,r-htmltools)
       ("r-knitr" ,r-knitr)
       ("r-officer" ,r-officer)
       ("r-r6" ,r-r6)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-stringr" ,r-stringr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://davidgohel.github.io/flextable")
    (synopsis "Functions for tabular reporting")
    (description
     "This package provides tools to create pretty tables for HTML documents
and other formats.  Functions are provided to let users create tables, modify
and format their content.  It extends the @code{officer} package and can be
used within R markdown documents when rendering to HTML and to Word
documents.")
    (license license:gpl3)))

(define-public r-writexl
  (package
    (name "r-writexl")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "writexl" version))
       (sha256
        (base32
         "0r2v12dc4zqmr1agp6vbw0fc48i278018684x84psjjqfmnv14cf"))))
    (build-system r-build-system)
    (inputs `(("zlib" ,zlib)))
    (home-page "https://github.com/ropensci/writexl")
    (synopsis "Export data frames to xlsx format")
    (description
     "This package provides a data frame to xlsx exporter based on
libxlsxwriter.")
    (license license:bsd-2)))

(define-public r-biasedurn
  (package
    (name "r-biasedurn")
    (version "1.07")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BiasedUrn" version))
       (sha256
        (base32
         "13i2lgfnjhlbbm2yxfc2l5hswqw6x03pwba5csjmirv8kpjw4xr3"))))
    (properties `((upstream-name . "BiasedUrn")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/BiasedUrn/")
    (synopsis "Biased Urn model distributions")
    (description
     "This package provides statistical models of biased sampling in the form
of univariate and multivariate noncentral hypergeometric distributions,
including Wallenius' noncentral hypergeometric distribution and Fisher's
noncentral hypergeometric distribution (also called extended hypergeometric
distribution).")
    (license license:gpl3)))

(define-public r-goplot
  (package
    (name "r-goplot")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "GOplot" version))
       (sha256
        (base32
         "1y8dv0kbzpr9za91njw0x233vx5d13vqml9hmpddcyi9s6va5nix"))))
    (properties `((upstream-name . "GOplot")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggdendro" ,r-ggdendro)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-rcolorbrewer" ,r-rcolorbrewer)))
    (home-page "https://github.com/wencke/wencke.github.io")
    (synopsis "Visualization of functional analysis data")
    (description
     "This package provides an implementation of multilayered visualizations
for enhanced graphical representation of functional analysis data.  It
combines and integrates omics data derived from expression and functional
annotation enrichment analyses.  Its plotting functions have been developed
with an hierarchical structure in mind: starting from a general overview to
identify the most enriched categories (modified bar plot, bubble plot) to a
more detailed one displaying different types of relevant information for the
molecules in a given set of categories (circle plot, chord plot, cluster plot,
Venn diagram, heatmap).")
    (license license:gpl2)))

(define-public r-getopt
  (package
    (name "r-getopt")
    (version "1.20.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "getopt" version))
       (sha256
        (base32
         "13p35lbpy7i578752fa71sbfvcsqw5qfa9p6kf8b5m3c5p9i4v1x"))))
    (build-system r-build-system)
    (home-page "https://github.com/trevorld/getopt")
    (synopsis "Command-line option processor for R")
    (description
     "This package is designed to be used with Rscript to write shebang
scripts that accept short and long options.  Many users will prefer to
use the packages @code{optparse} or @code{argparse} which add extra
features like automatically generated help options and usage texts,
support for default values, positional argument support, etc.")
    (license license:gpl2+)))

(define-public r-findpython
  (package
    (name "r-findpython")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "findpython" version))
       (sha256
        (base32
         "1y08jk2ffmkf9zpwiz2xymjhfwqvls9vzsnq62v278ghw9d571jl"))))
    (build-system r-build-system)
    (home-page "https://github.com/trevorld/findpython")
    (synopsis "Functions to find an acceptable Python binary")
    (description
     "This package was designed to find an acceptable Python binary that
matches version and feature constraints.")
    (license license:expat)))

;; This in not the same as "r-argparser"
(define-public r-argparse
  (package
    (name "r-argparse")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "argparse" version))
       (sha256
        (base32
         "0fzrbj87b274vf96azdnsjxk2nf45d5wy58vzmlah4b4h7q4j524"))))
    (build-system r-build-system)
    (inputs `(("python" ,python)))
    (propagated-inputs
     `(("r-findpython" ,r-findpython)
       ("r-getopt" ,r-getopt)
       ("r-jsonlite" ,r-jsonlite)
       ("r-proto" ,r-proto)))
    (home-page "https://github.com/trevorld/argparse")
    (synopsis "Command line optional and positional argument parser")
    (description
     "This package provides a command line parser to be used with Rscript to
write shebang scripts that gracefully accept positional and optional arguments
and automatically generate usage notices.")
    (license license:gpl2+)))

(define-public r-hash
  (package
    (name "r-hash")
    (version "2.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "hash" version))
       (sha256
        (base32
         "0mkx59bmni3b283znvbndnkbar85fzavzdfgmwrhskidsqcz34yz"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/hash/")
    (synopsis "Implementation of hash/associated arrays/dictionaries")
    (description
     "This package implements a data structure similar to hashes in Perl and
dictionaries in Python but with a purposefully R flavor.  For objects of
appreciable size, access using hashes outperforms native named lists and
vectors.")
    (license license:gpl2+)))

(define-public r-orddom
  (package
    (name "r-orddom")
    (version "3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "orddom" version))
       (sha256
        (base32
         "165axs15fvwhrp89xd87l81q3h2qjll1vrwcsap645cwvb85nwsh"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-psych" ,r-psych)))
    (home-page "https://cran.r-project.org/web/packages/orddom/")
    (synopsis "Ordinal dominance statistics")
    (description
     "This package provides tools to compute ordinal, statistics and effect
sizes as an alternative to mean comparison: Cliff's delta or success rate
difference (SRD), Vargha and Delaney's A or the Area Under a Receiver
Operating Characteristic Curve (AUC), the discrete type of McGraw & Wong's
Common Language Effect Size (CLES) or Grissom & Kim's Probability of
Superiority (PS), and the Number needed to treat (NNT) effect size.  Moreover,
comparisons to Cohen's d are offered based on Huberty & Lowman's Percentage of
Group (Non-)Overlap considerations.")
    (license license:gpl2)))

(define-public r-doby
  (package
    (name "r-doby")
    (version "4.6-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "doBy" version))
       (sha256
        (base32
         "02vbv9nfgywg6lsiialkmfnax5z3rkyb9nr8j9l2cp8xi6ml95mb"))))
    (properties `((upstream-name . "doBy")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-magrittr" ,r-magrittr)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-plyr" ,r-plyr)))
    (home-page "http://people.math.aau.dk/~sorenh/software/doBy/")
    (synopsis "Groupwise statistics, LSmeans, linear contrasts, and utilities")
    (description
     "This package contains:

@itemize
@item facilities for working with grouped data: @code{do}
  something to data stratified @code{by} some variables.
@item implementations of least-squares means, general linear contrasts, and
@item miscellaneous other utilities.
@end itemize\n")
    (license license:gpl2+)))

(define-public r-refgenome
  (package
    (name "r-refgenome")
    (version "1.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "refGenome" version))
       (sha256
        (base32
         "15p0ra2p1pwhy5ixbhsz1g79c5sc2aap4i4c8kil0m2syg9y45sn"))))
    (properties `((upstream-name . "refGenome")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dbi" ,r-dbi)
       ("r-doby" ,r-doby)
       ("r-rsqlite" ,r-rsqlite)))
    (home-page "https://cran.r-project.org/web/packages/refGenome/")
    (synopsis
     "Gene and splice site annotation using annotation data from Ensembl and UCSC")
    (description
     "This package contains functionality for importing and managing of
downloaded genome annotation data from the Ensembl genome browser (European
Bioinformatics Institute) and from the UCSC genome browser (University of
California, Santa Cruz) and annotation routines for genomic positions and
splice site positions.")
    (license license:gpl2)))

(define-public r-basix
  (package
    (name "r-basix")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BASIX" version))
       (sha256
        (base32
         "18dkvv1iwskfnlpl6xridcgqpalbbpm2616mvc3hfrc0b26v01id"))))
    (properties `((upstream-name . "BASIX")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/BASIX/")
    (synopsis "Efficient C/C++ toolset for R")
    (description
     "BASIX provides some efficient C/C++ implementations of native R
procedures to speed up calculations in R.")
    (license license:gpl2)))

(define-public r-blockfest
  (package
    (name "r-blockfest")
    (version "1.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BlockFeST" version))
       (sha256
        (base32
         "0hj7a5as7nxbgjac7lbj6qfwffx3g8x8phpf9a55f1c9cdzi73a5"))))
    (properties `((upstream-name . "BlockFeST")))
    (build-system r-build-system)
    (propagated-inputs `(("r-basix" ,r-basix)))
    (home-page "https://cran.r-project.org/web/packages/BlockFeST/")
    (synopsis "Bayesian calculation of region-specific fixation index")
    (description
     "This package provides an R implementation of an extension of the
BayeScan software for codominant markers, adding the option to group
individual SNPs into pre-defined blocks.  A typical application of this new
approach is the identification of genomic regions, genes, or gene sets
containing one or more SNPs that evolved under directional selection.")
    (license license:gpl2)))

(define-public r-proc
  (package
    (name "r-proc")
    (version "1.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pROC" version))
       (sha256
        (base32
         "0ain17clympkx09ym7gydylcd93096dxzqx1qzci310yq2l7fknm"))))
    (properties `((upstream-name . "pROC")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-rcpp" ,r-rcpp)))
    (home-page "http://expasy.org/tools/pROC/")
    (synopsis "Display and analyze ROC curves")
    (description
     "This package provides tools for visualizing, smoothing and comparing
receiver operating characteristic (ROC curves).  The area under the
curve (AUC) can be compared with statistical tests based on U-statistics or
bootstrap.  Confidence intervals can be computed for (p)AUC or ROC curves.")
    (license license:gpl3+)))

(define-public r-rootsolve
  (package
    (name "r-rootsolve")
    (version "1.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rootSolve" version))
       (sha256
        (base32
         "08ic6ggcc5dw4nv9xsqkm3vnvswmxyhnqnv1rdjv1h2gy1ivpcq8"))))
    (properties `((upstream-name . "rootSolve")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/rootSolve/")
    (synopsis "Tools for the analysis of ordinary differential equations")
    (description
     "This package provides routines to find the root of nonlinear functions,
and to perform steady-state and equilibrium analysis of @dfn{ordinary
differential equations} (ODE).  It includes routines that:

@enumerate
@item generate gradient and jacobian matrices (full and banded),
@item find roots of non-linear equations by the Newton-Raphson method,
@item estimate steady-state conditions of a system of (differential) equations
  in full, banded or sparse form, using the Newton-Raphson method, or by
  dynamically running,
@item solve the steady-state conditions for uni- and multicomponent 1-D, 2-D,
  and 3-D partial differential equations, that have been converted to ordinary
  differential equations by numerical differencing (using the method-of-lines
  approach).
@end enumerate\n")
    (license license:gpl2+)))

(define-public r-abcanalysis
  (package
    (name "r-abcanalysis")
    (version "1.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCanalysis" version))
       (sha256
        (base32 "0wac1ksmnxa36v99ca4hv8k0rsh3igwpcllmlv9wf7i9kgqviqwi"))))
    (properties `((upstream-name . "ABCanalysis")))
    (build-system r-build-system)
    (propagated-inputs `(("r-plotrix" ,r-plotrix)))
    (home-page "https://www.uni-marburg.de/fb12/arbeitsgruppen/datenbionik/software-en/")
    (synopsis "Computed ABC Analysis")
    (description
     "Multivariate data sets often differ in several factors or derived statistical
parameters, which have to be selected for a valid interpretation.  Basing this
selection on traditional statistical limits leads occasionally to the perception
of losing information from a data set.  This package provides tools to calculate
these limits on the basis of the mathematical properties of the distribution of
the analyzed items.")
    (license license:gpl3)))

(define-public r-slam
  (package
    (name "r-slam")
    (version "0.1-43")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "slam" version))
       (sha256
        (base32 "0hy4qzngcgafxxr6ld7n9a9wy979ji998gpcc32vidwyab66dj5h"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/slam/")
    (synopsis "Sparse lightweight arrays and matrices")
    (description
     "This package contains data structures and algorithms for sparse arrays and matrices,
based on index arrays and simple triplet representations, respectively.")
    (license license:gpl2)))

(define-public r-manipulatewidget
  (package
    (name "r-manipulatewidget")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "manipulateWidget" version))
       (sha256
        (base32 "1zagrbwkn2d50zzw8i2vyb1hsq4cydmfsqiy1a2qlp6zrv8a6q9x"))))
    (properties
     `((upstream-name . "manipulateWidget")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64enc" ,r-base64enc)
       ("r-codetools" ,r-codetools)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-knitr" ,r-knitr)
       ("r-miniui" ,r-miniui)
       ("r-shiny" ,r-shiny)
       ("r-webshot" ,r-webshot)))
    (home-page "https://github.com/rte-antares-rpackage/manipulateWidget/")
    (synopsis "Add even more interactivity to interactive charts")
    (description
     "This package lets you create in just a few lines of R code a nice user interface to
modify the data or the graphical parameters of one or multiple interactive
charts.  It is useful to quickly explore visually some data or for package
developers to generate user interfaces easy to maintain.")
    (license license:gpl2+)))

(define-public r-a3
  (package
    (name "r-a3")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "A3" version))
       (sha256
        (base32 "017hq9pjsv1h9i7cqk5cfx27as54shlhdsdvr6jkhb8jfkpdb6cw"))))
    (properties `((upstream-name . "A3")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-pbapply" ,r-pbapply)
       ("r-xtable" ,r-xtable)))
    (home-page "https://cran.r-project.org/web/packages/A3/")
    (synopsis "Error metrics for predictive models")
    (description
     "This package supplies tools for tabulating and analyzing the results of predictive
models.  The methods employed are applicable to virtually any predictive model
and make comparisons between different methodologies straightforward.")
    (license license:gpl2+)))

(define-public r-infotheo
  (package
    (name "r-infotheo")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "infotheo" version))
       (sha256
        (base32
         "18xacczfq3z3xpy434js4nf3l19lczngzd0lq26wh22pvg1yniwv"))))
    (build-system r-build-system)
    (home-page "http://homepage.meyerp.com/software")
    (synopsis "Information-theoretic measures")
    (description
     "This package implements various measures of information theory based on
several entropy estimators.")
    (license license:gpl3+)))

(define-public r-abcoptim
  (package
    (name "r-abcoptim")
    (version "0.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCoptim" version))
       (sha256
        (base32 "1ih0xk88qhsmpvnxf56041wx5sk8as2f4f2gdnpnwdym9mbr9n4b"))))
    (properties `((upstream-name . "ABCoptim")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/gvegayon/ABCoptim/")
    (synopsis "Optimization of Artificial Bee Colony algorithm")
    (description
     "Artificial Bee Colony (ABC) is one of the most recently defined algorithms by Dervis
Karaboga in 2005, motivated by the intelligent behavior of honey bees.  It is as
simple as Particle Swarm Optimization (PSO) and Differential Evolution (DE)
algorithms, and uses only common control parameters such as colony size and
maximum cycle number.  The @code{r-abcoptim} implements the Artificial bee
colony optimization algorithm @url{http://mf.erciyes.edu.tr/abc/pub/tr06_2005.pdf}.
  This version is a work-in-progress and is written in R code.")
    (license license:expat)))

(define-public r-abcp2
  (package
    (name "r-abcp2")
    (version "1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABCp2" version))
       (sha256
        (base32 "1s2skkxpzss7c29i8600psgrp0hl46jcrxqrmy2b4db8hc0kcnbx"))))
    (properties `((upstream-name . "ABCp2")))
    (build-system r-build-system)
    (propagated-inputs `(("r-mass" ,r-mass)))
    (home-page "https://cran.r-project.org/web/packages/ABCp2/")
    (synopsis "Approximate Bayesian Computational Model for Estimating P2")
    (description
     "This package tests the goodness of fit of a distribution of offspring to the Normal,
Poisson, and Gamma distribution and estimates the proportional paternity of the
second male (P2) based on the best fit distribution.")
    (license license:gpl2)))

(define-public r-abcrf
  (package
    (name "r-abcrf")
    (version "1.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abcrf" version))
       (sha256
        (base32 "06vy3inikrr9hv36q4djhrgzi9zizdfnhz17wpra8kadmr7qj441"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrixstats" ,r-matrixstats)
       ("r-ranger" ,r-ranger)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-readr" ,r-readr)
       ("r-stringr" ,r-stringr)))
    (home-page "https://cran.r-project.org/web/packages/abcrf/")
    (synopsis "Approximate bayesian computation via random forests")
    (description
     "This package performs approximate bayesian computation (ABC) model choice and
parameter inference via random forests.  This machine learning tool named random
forests (RF) can conduct selection among the highly complex models covered by
ABC algorithms.")
    (license license:gpl2+)))

(define-public r-abctools
  (package
    (name "r-abctools")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abctools" version))
       (sha256
        (base32 "07s9dg10i8lsxl73b4n2hynca2fjgb0ykb0dz8c3zv6cgw3cyx97"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abc" ,r-abc)
       ("r-abind" ,r-abind)
       ("r-hmisc" ,r-hmisc)
       ("r-plyr" ,r-plyr)))
    (home-page "https://github.com/dennisprangle/abctools/")
    (synopsis "Tools for ABC analyses")
    (description
     "This @code{r-abctools} package provides tools for approximate Bayesian computation
including summary statistic selection and assessing coverage.  This includes
recent dimension reduction algorithms to tune the choice of summary statistics,
and coverage methods to tune the choice of threshold.")
    (license license:gpl2+)))

(define-public r-ggstance
  (package
    (name "r-ggstance")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggstance" version))
       (sha256
        (base32 "0v7f3xdaaridw6d4jvnsfwxmpjrasvx5vl555wsrn50aah17fkvh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-rlang" ,r-rlang)
       ("r-withr" ,r-withr)))
    (home-page "https://cran.r-project.org/web/packages/ggstance/")
    (synopsis "Horizontal and vertical versions of @code{r-ggplot2}")
    (description
     "This package is a @code{r-ggplot2} extension that provides flipped components:
@enumerate
@item horizontal versions of @code{r-ggplot2} stats and @code{r-ggplot2} geoms;
@item vertical versions of @code{r-ggplot2} positions.
@end enumerate")
    (license license:gpl3)))

(define-public r-mosaiccore
  (package
    (name "r-mosaiccore")
    (version "0.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mosaicCore" version))
       (sha256
        (base32 "1klw97h6lchw1cpcl8s637ikcl428cckmjq0czi7mibh9q9mw72z"))))
    (properties `((upstream-name . "mosaicCore")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-lazyeval" ,r-lazyeval)
       ("r-mass" ,r-mass)
       ("r-rlang" ,r-rlang)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/ProjectMOSAIC/mosaicCore/")
    (synopsis "Common utilities for mosaic family packages")
    (description
     "Common utilities used in other Mosaic family packages are collected here.")
    (license license:gpl2+)))

(define-public r-ggformula
  (package
    (name "r-ggformula")
    (version "0.9.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggformula" version))
       (sha256
        (base32 "1pmpdfjfbrc6kcpq70cr1kbj2qy711hw940g2aiis6l443z706kh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-ggstance" ,r-ggstance)
       ("r-magrittr" ,r-magrittr)
       ("r-mosaiccore" ,r-mosaiccore)
       ("r-rlang" ,r-rlang)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/ProjectMOSAIC/ggformula/")
    (synopsis "Formula interface for the @code{r-ggplot2}")
    (description
     "The @code{r-ggformula} introduces a family of graphics functions, gf_point(),
gf_density(), and so on, bring the formula interface to ggplot().  This captures
and extends the excellent simplicity of the lattice-graphics formula interface,
while providing the intuitive capabilities of @code{r-ggplot2}.")
    (license license:expat)))

(define-public r-mosaicdata
  (package
    (name "r-mosaicdata")
    (version "0.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mosaicData" version))
       (sha256
        (base32 "04z0mdm52mykqsxsinhmsihn181zf6cw321gayk2rjp7lj7mwdq9"))))
    (properties `((upstream-name . "mosaicData")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/mosaicData/")
    (synopsis "Data sets for project Mosaic")
    (description
     "This package provides data sets from project Mosaic @url{http://mosaic-web.org}
used to teach mathematics, statistics, computation and modeling.")
    (license license:gpl2+)))

(define-public r-mosaic
  (package
   (name "r-mosaic")
   (version "1.4.0")
   (source
    (origin
     (method url-fetch)
     (uri (cran-uri "mosaic" version))
     (sha256
      (base32 "10jbrg8kli00kfgbh2f67bymm5cnlancc9dplb1j7fl552yjddn2"))))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-broom" ,r-broom)
      ("r-dplyr" ,r-dplyr)
      ("r-ggdendro" ,r-ggdendro)
      ("r-ggformula" ,r-ggformula)
      ("r-ggplot2" ,r-ggplot2)
      ("r-ggrepel" ,r-ggrepel)
      ("r-glue" ,r-glue)
      ("r-gridextra" ,r-gridextra)
      ("r-lattice" ,r-lattice)
      ("r-latticeextra" ,r-latticeextra)
      ("r-lazyeval" ,r-lazyeval)
      ("r-mass" ,r-mass)
      ("r-matrix" ,r-matrix)
      ("r-mosaiccore" ,r-mosaiccore)
      ("r-mosaicdata" ,r-mosaicdata)
      ("r-readr" ,r-readr)
      ("r-tidyr" ,r-tidyr)))
   (home-page "https://github.com/ProjectMOSAIC/mosaic/")
   (synopsis "Mathematics, statistics, and computation teaching utilities")
   (description
    "This package contain data sets and utilities from
@url{http://mosaic-web.org, Project MOSAIC} used to teach mathematics,
statistics, computation and modeling.  Project MOSAIC is a community of
educators working to tie together aspects of quantitative work that students
in science, technology, engineering and mathematics will need in their
professional lives, but which are usually taught in isolation, if at all.")
   (license license:gpl2+)))

(define-public r-abd
  (package
    (name "r-abd")
    (version "0.2-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abd" version))
       (sha256
        (base32 "191gspqzdv573vaw624ri0f5cm6v4j524bjs74d4a1hn3kn6r9b7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lattice" ,r-lattice)
       ("r-mosaic" ,r-mosaic)
       ("r-nlme" ,r-nlme)))
    (home-page "https://cran.r-project.org/web/packages/abd/")
    (synopsis "Analysis of biological data")
    (description
     "The @code{r-abd} package contains data sets and sample code for the Analysis of
biological data by Michael Whitlock and Dolph Schluter.")
    (license license:gpl2)))

(define-public r-svgui
  (package
    (name "r-svgui")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "svGUI" version))
       (sha256
        (base32 "1r7ab0p4yr8q03gj02hmj7k1ghksgkg4nx750c0ajfs2q9y1dxfc"))))
    (properties `((upstream-name . "svGUI")))
    (build-system r-build-system)
    (home-page "https://github.com/SciViews/svGUI/")
    (synopsis "Functions for managing GUI clients in R")
    (description
     "The SciViews @code{svGUI} package eases the management of Graphical User
Interfaces (GUI) in R.  It is independent from any particular GUI widgets.  It
centralizes info about GUI elements currently used, and it dispatches GUI
calls to the particular toolkits in use in function of the context.")
    (license license:gpl2)))

(define-public r-svdialogs
  (package
    (name "r-svdialogs")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "svDialogs" version))
       (sha256
        (base32 "0xqppydfawnwk84kb5qiybwbcmv38vn4imgz01mz2pnq4xb80p97"))))
    (properties `((upstream-name . "svDialogs")))
    (build-system r-build-system)
    (inputs
     `(("yad" ,yad)
       ("zenity" ,zenity)))
    (propagated-inputs
     `(("r-rstudioapi" ,r-rstudioapi)
       ("r-svgui" ,r-svgui)))
    (home-page "https://github.com/SciViews/svDialogs/")
    (synopsis "Portable dialog boxes")
    (description
     "This package helps to construct standard dialog boxes for your GUI, including
message boxes, input boxes, list, file or directory selection, and others.  In
case R cannot display GUI dialog boxes, a simpler command line version of these
interactive elements is also provided as a fallback solution.")
    (license license:gpl2)))

(define-public r-abe
  (package
    (name "r-abe")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abe" version))
       (sha256
        (base32
         "1f19h3xzzmjhvwc1rrb8z0rai3ip03y4gdi2gg9bfr5sg2nfklk6"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abe/")
    (synopsis "Augmented backward elimination")
    (description
     "This package performs augmented backward elimination and checks the
stability of the obtained model.  Augmented backward elimination combines
significance or information based criteria with the change in estimate to
either select the optimal model for prediction purposes or to serve as a tool
to obtain a practically sound, highly interpretable model.")
    (license license:gpl2+)))

(define-public r-abf2
  (package
    (name "r-abf2")
    (version "0.7-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abf2" version))
       (sha256
        (base32 "0d65mc1w4pbiv7xaqzdlw1bfsxf25587rv597hh41vs0j0zlfpxx"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/abf2/")
    (synopsis "Load gap-free axon @code{r-abf2} files")
    (description
     "This package loads electrophysiology data from ABF2 files, as created by
Axon Instruments/Molecular Devices software.  Only files recorded in gap-free
mode are currently supported.")
    (license license:artistic2.0)))

(define-public r-abhgenotyper
  (package
    (name "r-abhgenotyper")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABHgenotypeR" version))
       (sha256
        (base32 "08cpmnaaxsm5c5bjifnfxdlvg5inrf13biqpcl2yq5zpqjmiki0l"))))
    (properties `((upstream-name . "ABHgenotypeR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-reshape2" ,r-reshape2)))
    (home-page "https://github.com/StefanReuscher/ABHgenotypeR/")
    (synopsis "Visualize and manipulate ABH genotypes")
    (description
     "The @code{r-abhgenotyper} package provides simple imputation,
error-correction and plotting capacities for genotype data.  The package is
supposed to serve as an intermediate but independent analysis tool between the
TASSEL GBS pipeline and the @code{r-qtl} package.  It provides functionalities
not found in either TASSEL or @code{r-qtl} in addition to visualization of
genotypes as \"graphical genotypes\".")
    (license license:gpl3)))

(define-public r-abjutils
  (package
    (name "r-abjutils")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abjutils" version))
       (sha256
        (base32 "0qrsc4if7aif73qp95lw6b5986c2r0jn7m39123zij8k15vc935b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-devtools" ,r-devtools)
       ("r-dplyr" ,r-dplyr)
       ("r-glue" ,r-glue)
       ("r-httr" ,r-httr)
       ("r-magrittr" ,r-magrittr)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-purrr" ,r-purrr)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-scales" ,r-scales)
       ("r-stringi" ,r-stringi)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/abjur/abjutils/")
    (synopsis "Collection of tools for jurimetrical analysis")
    (description
     "This package implements general purpose tools, such as functions for
sampling and basic manipulation of Brazilian lawsuits identification number.
It also implements functions for text cleaning, such as accentuation
removal.")
    (license license:expat)))

(define-public r-abnormality
  (package
    (name "r-abnormality")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abnormality" version))
       (sha256
        (base32 "1fzfskl9akl06nliy8hkv2a0pznpj8pwcypg3gj5r2nzvr3kan9v"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/abnormality/")
    (synopsis "Measure a subject's abnormality with respect to a reference population")
    (description
     "This package contains functions to implement the methodology and
considerations laid out by Marks et al. in the article \"Measuring abnormality
in high dimensional spaces: applications in biomechanical gait analysis\".
Using high-dimensional datasets to measure a subject's overall level of
abnormality as compared to a reference population is often needed in outcomes
research.")
    (license license:expat)))

(define-public r-abodoutlier
  (package
    (name "r-abodoutlier")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abodOutlier" version))
       (sha256
        (base32 "1pvhgxmh23br84r0fbmv7g53z2427birdja96a67vqgz18r3fdvj"))))
    (properties `((upstream-name . "abodOutlier")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cluster" ,r-cluster)))
    (home-page "https://cran.r-project.org/web/packages/abodOutlier/")
    (synopsis "Angle-based outlier detection")
    (description
     "This package performs angle-based outlier detection on a given data
frame.  It offers three methods to process data:
@enumerate
@item full but slow implementation using all the data that has cubic
  complexity;
@item a fully randomized method;
@item a method using k-nearest neighbours.
@end enumerate
These algorithms are well suited for high dimensional data outlier
detection.")
    (license license:expat)))

(define-public r-abps
  (package
    (name "r-abps")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ABPS" version))
       (sha256
        (base32 "0n3f66nmfi5v94il1mxy026mi84w01ph2aljk60vn3mrz8kwf2ll"))))
    (properties `((upstream-name . "ABPS")))
    (build-system r-build-system)
    (propagated-inputs `(("r-kernlab" ,r-kernlab)))
    (home-page "https://cran.r-project.org/web/packages/ABPS/")
    (synopsis "Abnormal blood profile score to detect blood doping")
    (description
     "This package offers an implementation of the @dfn{Abnormal blood profile score} (ABPS).
The ABPS is a part of the Athlete biological passport program of the World
anti-doping agency, which combines several blood parameters into a single
score in order to detect blood doping.  The package also contains functions to
calculate other scores used in anti-doping programs, such as the ratio of
hemoglobin to reticulocytes (OFF-score), as well as example data.")
    (license license:gpl2+)))

(define-public r-parmigene
  (package
    (name "r-parmigene")
    (version "1.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "parmigene" version))
       (sha256
        (base32
         "1fsm6pkr17jcbzkj1hbn91jf890fviqk1lq6ls8pihsdgah1zb4d"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/parmigene/")
    (synopsis "Mutual information estimation for gene network reconstruction")
    (description
     "This package provides a parallel estimation of the mutual information
based on entropy estimates from k-nearest neighbors distances and algorithms
for the reconstruction of gene regulatory networks.")
    (license license:agpl3+)))

(define-public r-pscl
  (package
    (name "r-pscl")
    (version "1.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pscl" version))
       (sha256
        (base32 "1phf3awsfr4ncqfqzin5m1pz0g7y1zhbcm2sz7358ssw914fd7rc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)))
    (home-page "https://github.com/atahk/pscl/")
    (synopsis "Political science computational laboratory")
    (description
     "The @code{pscl} is an R package providing classes and methods for:
@enumerate
@item Bayesian analysis of roll call data (item-response models);
@item elementary Bayesian statistics;
@item maximum likelihood estimation of zero-inflated and hurdle models for count
data;
@item utility functions.
@end enumerate")
    (license license:gpl2)))

(define-public r-accelmissing
  (package
    (name "r-accelmissing")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "accelmissing" version))
       (sha256
        (base32 "1nql9inx6azdzi3z4sfm2vdml2mms6krl8wzlf1dn1c97ahn57fy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mice" ,r-mice)
       ("r-pscl" ,r-pscl)))
    (home-page "https://cran.r-project.org/web/packages/accelmissing/")
    (synopsis "Missing value imputation for accelerometer data")
    (description
     "This package provides a statistical method to impute the missing values in
accelerometer data.  The methodology includes both parametric and
semi-parametric multiple imputations under the zero-inflated Poisson lognormal
model.  It also provides multiple functions to preprocess the accelerometer data
previous to the missing data imputation.  These include detecting the wearing
and the non-wearing time, selecting valid days and subjects, and creating plots.")
    (license license:gpl2+)))

(define-public r-mhsmm
  (package
    (name "r-mhsmm")
    (version "0.4.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mhsmm" version))
       (sha256
        (base32 "009dj0zkj1zry7jr9hf4cknb686z50a2l967if64xm0dvjmp7dgs"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-mvtnorm" ,r-mvtnorm)))
    (home-page "https://github.com/jaredo/mhsmm/")
    (synopsis "Inference for hidden Markov and semi-Markov models")
    (description
     "The @code{r-mhsmm} package implements estimation and prediction methods for
hidden Markov and semi-Markov models for multiple observation sequences.  Such
techniques are of interest when observed data is thought to be dependent on some
unobserved (or hidden) state.  Also, this package is suitable for equidistant
time series data, with multivariate and/or missing data.  Allows user defined
emission distributions.")
    (license license:gpl2+)))

(define-public r-nleqslv
  (package
    (name "r-nleqslv")
    (version "3.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "nleqslv" version))
       (sha256
        (base32 "1v9znvncyigw9r25wx2ma0b7ib179b488dl0qsrhp5zrcz7mcjgm"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/nleqslv/")
    (synopsis "Solve systems of nonlinear equations")
    (description
     "The @code{r-nleqslv} package solves a system of nonlinear equations using a
Broyden or a Newton method with a choice of global strategies such as line
search and trust region.  There are options for using a numerical or user
supplied Jacobian, for specifying a banded numerical Jacobian and for allowing a
singular or ill-conditioned Jacobian.")
    (license license:gpl2+)))

(define-public r-physicalactivity
  (package
    (name "r-physicalactivity")
    (version "0.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "PhysicalActivity" version))
       (sha256
        (base32 "14z6plgwyr46vs9m997rvlz8sdglfs9g087an8668zqkzzs2w4ln"))))
    (properties
     `((upstream-name . "PhysicalActivity")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/PhysicalActivity/")
    (synopsis "Procesing accelerometer data for physical activity measurement")
    (description
     "This @code{r-physicalactivity} package provides a function @code{wearingMarking}
for classification of monitor wear and nonwear time intervals in accelerometer
data collected to assess physical activity.  The package also contains functions
for making plots of accelerometer data and obtaining the summary of various
information including daily monitor wear time and the mean monitor wear time
during valid days.  The revised package version 0.2-1 improved the functions
regarding speed, robustness and add better support for time zones and daylight
saving.  In addition, several functions were added:
@enumerate
@item the @code{markDelivery} can classify days for ActiGraph delivery by mail;
@item the @code{markPAI} can categorize physical activity intensity level based
on user-defined cut-points of accelerometer counts.
@end enumerate
  It also supports importing ActiGraph (AGD) files with @code{readActigraph} and
@code{queryActigraph} functions.")
    (license license:gpl3+)))

(define-public r-acc
  (package
    (name "r-acc")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "acc" version))
       (sha256
        (base32 "1ii2vm47djxbixa75h690q1s2f9m9x6i8nkygik93j6dayr6kr1m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-circlize" ,r-circlize)
       ("r-dbi" ,r-dbi)
       ("r-ggplot2" ,r-ggplot2)
       ("r-iterators" ,r-iterators)
       ("r-mhsmm" ,r-mhsmm)
       ("r-nleqslv" ,r-nleqslv)
       ("r-physicalactivity" ,r-physicalactivity)
       ("r-plyr" ,r-plyr)
       ("r-r-utils" ,r-r-utils)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-rsqlite" ,r-rsqlite)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/acc/")
    (synopsis "Exploring accelerometer data")
    (description
     "This package processes accelerometer data from uni-axial and tri-axial devices
and generates data summaries.  Also, includes functions to plot, analyze, and
simulate accelerometer data.")
    (license license:gpl2+)))

(define-public r-rbenchmark
  (package
    (name "r-rbenchmark")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rbenchmark" version))
       (sha256
        (base32 "010fn3qwnk2k411cbqyvra1d12c3bhhl3spzm8kxffmirj4p2al9"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rbenchmark/")
    (synopsis "Benchmarking routine for R")
    (description
     "This @code{r-rbenchmark} package is inspired by the Perl module Benchmark,
and is intended to facilitate benchmarking of arbitrary R code.  The library
consists of just one function, benchmark, which is a simple wrapper around
system.time.  Given a specification of the benchmarking process (counts of
replications, evaluation environment) and an arbitrary number of expressions,
benchmark evaluates each of the expressions in the specified environment,
replicating the evaluation as many times as specified, and returning the results
conveniently wrapped into a data frame.")
    (license license:gpl2+)))

(define-public r-dvmisc
  (package
    (name "r-dvmisc")
    (version "1.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dvmisc" version))
       (sha256
        (base32 "1dy0yykskwhkql19bhzmbwsgv028afc8jh9yqwbczj6f3vpv31zh"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-rbenchmark" ,r-rbenchmark)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/dvmisc/")
    (synopsis "Faster computation of common statistics and miscellaneous functions")
    (description
     "This package implements faster versions of base R functions (e.g. mean, standard
deviation, covariance, weighted mean), mostly written in C++, along with
miscellaneous functions for various purposes (e.g. create the histogram with
fitted probability density function or probability mass function curve, create
the body mass index groups, assess the linearity assumption in logistic
regression).")
    (license license:gpl2)))

(define-public r-accelerometry
  (package
    (name "r-accelerometry")
    (version "3.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "accelerometry" version))
       (sha256
        (base32 "13xzrwhr4i1nj9c8vrmfdg2rmrc8n446iihcyxmy99sm99hpzyip"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dvmisc" ,r-dvmisc)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/accelerometry/")
    (synopsis "Functions for processing accelerometer data")
    (description
     "This package provides a collection of functions that perform operations on
time-series accelerometer data, such as identify the non-wear time, flag minutes
that are part of an activity bout, and find the maximum 10-minute average count
value.  The functions are generally very flexible, allowing for a variety of
algorithms to be implemented.")
    (license license:gpl3)))

(define-public r-absim
  (package
    (name "r-absim")
    (version "0.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AbSim" version))
       (sha256
        (base32 "16ddjk8b6xw80ch4jis1y751i9561wdxh0gifbf15qiz3vjckq8m"))))
    (properties `((upstream-name . "AbSim")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ape" ,r-ape)
       ("r-powerlaw" ,r-powerlaw)))
    (home-page "https://cran.r-project.org/web/packages/AbSim/")
    (synopsis "Time resolved simulations of antibody repertoires")
    (description
     "This package provides simulation methods for the evolution of antibody repertoires.
  The heavy and light chain variable region of both human and C57BL/6 mice can
be simulated in a time-dependent fashion.  Both single lineages using one set of
V-, D-, and J-genes or full repertoires can be simulated.  The algorithm begins
with an initial V-D-J recombination event, starting the first phylogenetic tree.
  Upon completion, the main loop of the algorithm begins, with each iteration
representing one simulated time step.  Various mutation events are possible at
each time step, contributing to a diverse final repertoire.")
    (license license:gpl2)))

(define-public r-quic
  (package
    (name "r-quic")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "QUIC" version))
       (sha256
        (base32 "021bp9xbaih60qmss015ycblbv6d1dvb1z89y93zpqqnc2qhpv3c"))))
    (properties `((upstream-name . "QUIC")))
    (build-system r-build-system)
    (home-page "https://www.cs.utexas.edu/users/sustik/QUIC/")
    (synopsis "Regularized sparse inverse covariance matrix estimation")
    (description
     "This package implements the regularized Gaussian maximum likelihood
estimation of the inverse of a covariance matrix.  It uses Newton's method and
coordinate descent to solve the regularized inverse covariance matrix
estimation problem.")
    ;; The project home page states that the release is under GPLv3 or later.
    ;; The CRAN page only says GPL-3.
    (license license:gpl3+)))

(define-public r-abundant
  (package
    (name "r-abundant")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "abundant" version))
       (sha256
        (base32 "1m76qdmqvwpgm0sihazi2dna7cgsz9rljal18vgffb5wamwmg9k7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-quic" ,r-quic)))
    (home-page "https://cran.r-project.org/web/packages/abundant/")
    (synopsis "Abundant regression and high-dimensional principal fitted components")
    (description
     "This package provides tools to fit and predict with the high-dimensional
principal fitted components model.  This model is described by Cook, Forzani,
and Rothman (2012) @url{doi:10.1214/11-AOS962}.")
    ;; The DESCRIPTION file states GPL-2, but since it directly depends on a
    ;; GPLv3+ package (QUIC) this likely means GPLv2+.
    (license license:gpl2+)))

(define-public r-ac3net
  (package
    (name "r-ac3net")
    (version "1.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Ac3net" version))
       (sha256
        (base32 "1ns4n0xxz6p34c11bj0k7nzgmyqr9mis2b0g5nfz37dbikndyqyz"))))
    (properties `((upstream-name . "Ac3net")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-data-table" ,r-data-table)))
    (home-page "https://cran.r-project.org/web/packages/Ac3net/")
    (synopsis "Inferring directional conservative causal core gene networks")
    (description "This package infers directional Conservative causal core
(gene) networks (C3NET).  This is a version of the algorithm C3NET with
directional network.")
    (license license:gpl3+)))

(define-public r-aca
  (package
    (name "r-aca")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACA" version))
       (sha256
        (base32 "1i3hm27nvnkvc39xlh0d1blq8q0q02czmvgi3cazmjx3jvxay0vq"))))
    (properties `((upstream-name . "ACA")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ACA/")
    (synopsis "Abrupt change-point or aberration detection in point series")
    (description
     "This package offers an interactive function for the detection of breakpoints in
series.")
    ;; Any version of the GPL
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-acceptancesampling
  (package
    (name "r-acceptancesampling")
    (version "1.0-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "AcceptanceSampling" version))
       (sha256
        (base32 "18krmmyn8pn11aqd81kbvka68lnd36mnpdh7p3pz9r4m4vjj007x"))))
    (properties
     `((upstream-name . "AcceptanceSampling")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/AcceptanceSampling/")
    (synopsis "Creation and evaluation of acceptance sampling plans")
    (description
     "This @code{r-acceptancesampling} provides functionality for creating and evaluating
acceptance sampling plans.  Acceptance sampling is a methodology commonly used
in quality control and improvement.  International standards of acceptance
sampling provide sampling plans for specific circumstances.  The aim of this
package is to provide an easy-to-use interface to visualize single, double or
multiple sampling plans.  In addition, methods have been provided to enable the
user to assess sampling plans against pre-specified levels of performance, as
measured by the probability of acceptance for a given level of quality in the
lot.")
    (license license:gpl3+)))

(define-public r-acclma
  (package
    (name "r-acclma")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ACCLMA" version))
       (sha256
        (base32 "1na27sp18fq12gp6vxgqw1ffsz2yi1d8xvrxbrzx5g1kqxrayy0v"))))
    (properties `((upstream-name . "ACCLMA")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ACCLMA/")
    (synopsis "ACC & LMA graph plotting")
    (description
     "This package contains a function that imports data from a @acronym{CSV,
Comma-Separated Values} file, or uses manually entered data from the format (x,
y, weight) and plots the appropriate @acronym{ACC, Absolute Concentration
Curve} vs @acronym{LOI, Line of Independence} graph and
@acronym{LMA, @acronym{LOI} Minus @acronym{ACC}} graph.  The main
function is @code{plotLMA} (source file, header) that takes a data set and plots the
appropriate @acronym{LMA} and @acronym{ACC} graphs.  If no source file (a
string) was passed, a manual data entry window is opened.  The header parameter
indicates by TRUE/FALSE (false by default) if the source @acronym{CSV} file has
a header row or not.  The dataset should contain only one independent variable
(x) and one dependent variable (y) and can contain a weight for each
observation.")
    (license license:gpl2)))

(define-public r-aspi
  (package
    (name "r-aspi")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "aspi" version))
       (sha256
        (base32 "0rhvxw243vvdv3hxa6pi343gcjc2cbxq1jzqirl9k1l4i3897l87"))))
    (build-system r-build-system)
    (home-page
     "https://cran.r-project.org/web/packages/aspi/")
    (synopsis
     "Analysis of symmetry of parasitic infections")
    (description
     "This package provides tools for the analysis and visualization of bilateral
      asymmetry in parasitic infections.")
    (license license:gpl3+)))

(define-public r-sandwich
  (package
    (name "r-sandwich")
    (version "2.5-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sandwich" version))
       (sha256
        (base32
         "168kq5kk34xbhfsxsanard9zriyp6cw0s09ralzb57kk42pl9hbc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/sandwich/")
    (synopsis "Robust Covariance Matrix Estimators")
    (description
     "This package provides model-robust standard error estimators for
cross-sectional, time series, clustered, panel, and longitudinal data.")
    ;; Either version of the license.
    (license (list license:gpl2 license:gpl3))))

(define-public r-th-data
  (package
    (name "r-th-data")
    (version "1.0-9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TH.data" version))
       (sha256
        (base32
         "03xfvww0krw0fn76qmmvrj7dx4shin57qafwhkrggfg25hbqlcfq"))))
    (properties `((upstream-name . "TH.data")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-survival" ,r-survival)))
    (home-page "https://cran.r-project.org/web/packages/TH.data/")
    (synopsis "Shared data sets")
    (description
     "This package contains supporting data sets that are used in other
packages maintained by Torsten Hothorn.")
    (license license:gpl3)))

(define-public r-multcomp
  (package
    (name "r-multcomp")
    (version "1.4-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "multcomp" version))
       (sha256
        (base32
         "0fm78g4zjc6ank316qfw977864shmy890znn4fahwc8jjdhpc252"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-codetools" ,r-codetools)
       ("r-mvtnorm" ,r-mvtnorm)
       ("r-sandwich" ,r-sandwich)
       ("r-survival" ,r-survival)
       ("r-th-data" ,r-th-data)))
    (home-page "https://cran.r-project.org/web/packages/multcomp/")
    (synopsis "Simultaneous inference in general parametric models")
    (description
     "Simultaneous tests and confidence intervals for general linear
hypotheses in parametric models, including linear, generalized linear, linear
mixed effects, and survival models.  The package includes demos reproducing
analyzes presented in the book \"Multiple Comparisons Using R\" (Bretz,
Hothorn, Westfall, 2010, CRC Press).")
    (license license:gpl2)))

(define-public r-emmeans
  (package
    (name "r-emmeans")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "emmeans" version))
       (sha256
        (base32
         "0kdyy4qp332c4yyvp1cnh48h6ks6ffir5rjcv0py0vm3m8c3hh61"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-estimability" ,r-estimability)
       ("r-mvtnorm" ,r-mvtnorm)
       ("r-plyr" ,r-plyr)
       ("r-xtable" ,r-xtable)))
    (home-page "https://github.com/rvlenth/emmeans")
    (synopsis "Estimated marginal means, aka least-squares means")
    (description
     "This package provides tools to obtain @dfn{estimated marginal
means} (EMMs) for many linear, generalized linear, and mixed models.  It can
be used to compute contrasts or linear functions of EMMs, trends, and
comparisons of slopes.")
    ;; Either version of the license.
    (license (list license:gpl2 license:gpl3))))

(define-public r-pwr
  (package
    (name "r-pwr")
    (version "1.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pwr" version))
       (sha256
        (base32
         "0r5g781lr677vp3zyhgmi7r68c87l8gd05l1s3ffnxgn5wf043sm"))))
    (build-system r-build-system)
    (native-inputs
     `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/heliosdrm/pwr")
    (synopsis "Basic functions for power analysis")
    (description
     "This package provides power analysis functions along the lines of
Cohen (1988).")
    (license license:gpl3+)))

(define-public r-coin
  (package
    (name "r-coin")
    (version "1.2-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "coin" version))
       (sha256
        (base32
         "1fq58793bymzig1syjg2lvn6hsxfwkhh00jfrchh3c0y7rfhc66m"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-modeltools" ,r-modeltools)
       ("r-multcomp" ,r-multcomp)
       ("r-mvtnorm" ,r-mvtnorm)
       ("r-survival" ,r-survival)))
    (home-page "http://coin.r-forge.r-project.org")
    (synopsis "Conditional inference procedures in a permutation test framework")
    (description
     "This package provides conditional inference procedures for the general
independence problem including two-sample, K-sample (non-parametric ANOVA),
correlation, censored, ordered and multivariate problems.")
    (license license:gpl2)))

(define-public r-bayesplot
  (package
    (name "r-bayesplot")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bayesplot" version))
       (sha256
        (base32
         "0in9cq2ybpa7njrwqx4l6nc8i01cjswsvzwlyiw465pi74aapr57"))))
    (build-system r-build-system)
    (inputs
     `(("pandoc" ,ghc-pandoc)
       ("pandoc-citeproc" ,ghc-pandoc-citeproc)))
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggridges" ,r-ggridges)
       ("r-reshape2" ,r-reshape2)
       ("r-rlang" ,r-rlang)))
    (home-page "http://mc-stan.org/bayesplot")
    (synopsis "Plotting for Bayesian models")
    (description
     "This package provides plotting functions for posterior analysis, model
checking, and MCMC diagnostics.  The package is designed not only to provide
convenient functionality for users, but also a common set of functions that
can be easily used by developers working on a variety of R packages for
Bayesian modeling.")
    (license license:gpl3+)))

(define-public r-tmb
  (package
    (name "r-tmb")
    (version "1.7.15")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TMB" version))
       (sha256
        (base32
         "1r2d8c5iazihba42sn33yarv0dcfiy989sx64zcf14zr8k6cgjzs"))))
    (properties `((upstream-name . "TMB")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-matrix" ,r-matrix)
       ("r-rcppeigen" ,r-rcppeigen)))
    (home-page "http://tmb-project.org")
    (synopsis "Template model builder: a general random effect tool")
    (description
     "With this tool, a user should be able to quickly implement complex
random effect models through simple C++ templates.  The package combines
@code{CppAD} (C++ automatic differentiation), @code{Eigen} (templated
matrix-vector library) and @code{CHOLMOD} (sparse matrix routines available
from R) to obtain an efficient implementation of the applied Laplace
approximation with exact derivatives.  Key features are: Automatic sparseness
detection, parallelism through BLAS and parallel user templates.")
    (license license:gpl2)))

(define-public r-sjstats
  (package
    (name "r-sjstats")
    (version "0.17.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjstats" version))
       (sha256
        (base32
         "0c7g35vn7r9rylhp0gj1yfslg7jybwrhpqpp7vdcd90xfccih24r"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bayesplot" ,r-bayesplot)
       ("r-broom" ,r-broom)
       ("r-coin" ,r-coin)
       ("r-crayon" ,r-crayon)
       ("r-dplyr" ,r-dplyr)
       ("r-emmeans" ,r-emmeans)
       ("r-glmmtmb" ,r-glmmtmb)
       ("r-lme4" ,r-lme4)
       ("r-magrittr" ,r-magrittr)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-modelr" ,r-modelr)
       ("r-nlme" ,r-nlme)
       ("r-purrr" ,r-purrr)
       ("r-pwr" ,r-pwr)
       ("r-rlang" ,r-rlang)
       ("r-sjlabelled" ,r-sjlabelled)
       ("r-sjmisc" ,r-sjmisc)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/strengejacke/sjstats")
    (synopsis "Functions for common statistical computations")
    (description
     "This package provides a collection of convenient functions for common
statistical computations, which are not directly provided by R's @code{base}
or @code{stats} packages.  This package aims at providing, first, shortcuts
for statistical measures, which otherwise could only be calculated with
additional effort.  Second, these shortcut functions are generic, and can be
applied not only to vectors, but also to other objects as well.  The focus of
most functions lies on summary statistics or fit measures for regression
models, including generalized linear models, mixed effects models and Bayesian
models.")
    (license license:gpl3)))

(define-public r-glmmtmb
  (package
    (name "r-glmmtmb")
    (version "0.2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "glmmTMB" version))
       (sha256
        (base32
         "1clpkjlmsjmn3m1z5jqv8cgw6bvpqsy4nx6k947r0jya017ny5y5"))))
    (properties `((upstream-name . "glmmTMB")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lme4" ,r-lme4)
       ("r-matrix" ,r-matrix)
       ("r-nlme" ,r-nlme)
       ("r-rcppeigen" ,r-rcppeigen)
       ("r-tmb" ,r-tmb)))
    (native-inputs
     `(("r-knitr" ,r-knitr)))
    (home-page "https://github.com/glmmTMB")
    (synopsis "Generalized linear mixed models")
    (description
     "Fit linear and generalized linear mixed models with various extensions,
including zero-inflation.  The models are fitted using maximum likelihood
estimation via the Template Model Builder.  Random effects are assumed to be
Gaussian on the scale of the linear predictor and are integrated out using the
Laplace approximation.  Gradients are calculated using automatic
differentiation.")
    (license license:agpl3+)))

(define-public r-ggeffects
  (package
    (name "r-ggeffects")
    (version "0.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ggeffects" version))
       (sha256
        (base32
         "070c3fxmzajq2fy816s5pfqdyjlnzkabj97z7fcsva4h5rnqi9d6"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-crayon" ,r-crayon)
       ("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-lme4" ,r-lme4)
       ("r-magrittr" ,r-magrittr)
       ("r-mass" ,r-mass)
       ("r-prediction" ,r-prediction)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-scales" ,r-scales)
       ("r-sjlabelled" ,r-sjlabelled)
       ("r-sjmisc" ,r-sjmisc)
       ("r-sjstats" ,r-sjstats)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://github.com/strengejacke/ggeffects")
    (synopsis "Create tidy data frames of marginal effects for ggplot")
    (description
     "This package provides tools to compute marginal effects from statistical
models and return the result as tidy data frames.  These data frames are ready
to use with the @code{ggplot2} package.  Marginal effects can be calculated
for many different models.  Interaction terms, splines and polynomial terms
are also supported.  The two main functions are @code{ggpredict()} and
@code{ggeffect()}.  There is a generic @code{plot()} method to plot the
results using @code{ggplot2}.")
    (license license:gpl3)))

(define-public r-sjplot
  (package
    (name "r-sjplot")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sjPlot" version))
       (sha256
        (base32
         "13qvw2s3r96qfi8kfsn76m050ccnmckl31a9qv94xws8da99v2fk"))))
    (properties `((upstream-name . "sjPlot")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-broom" ,r-broom)
       ("r-dplyr" ,r-dplyr)
       ("r-forcats" ,r-forcats)
       ("r-ggeffects" ,r-ggeffects)
       ("r-ggplot2" ,r-ggplot2)
       ("r-glmmtmb" ,r-glmmtmb)
       ("r-knitr" ,r-knitr)
       ("r-lme4" ,r-lme4)
       ("r-magrittr" ,r-magrittr)
       ("r-mass" ,r-mass)
       ("r-modelr" ,r-modelr)
       ("r-nlme" ,r-nlme)
       ("r-psych" ,r-psych)
       ("r-purrr" ,r-purrr)
       ("r-rlang" ,r-rlang)
       ("r-scales" ,r-scales)
       ("r-sjlabelled" ,r-sjlabelled)
       ("r-sjmisc" ,r-sjmisc)
       ("r-sjstats" ,r-sjstats)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://strengejacke.github.io/sjPlot/")
    (synopsis "Data visualization for statistics in social science")
    (description
     "This package represents a collection of plotting and table output
functions for data visualization.  Results of various statistical
analyses (that are commonly used in social sciences) can be visualized using
this package, including simple and cross tabulated frequencies, histograms,
box plots, (generalized) linear models, mixed effects models, principal
component analysis and correlation matrices, cluster analyses, scatter plots,
stacked scales, effects plots of regression models (including interaction
terms) and much more.  This package supports labelled data.")
    (license license:gpl3)))

(define-public r-ini
  (package
    (name "r-ini")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ini" version))
       (sha256
        (base32
         "04yqij344dwm0xqgara8xia42mlmij3i8711qbb5534w05a1l6bv"))))
    (build-system r-build-system)
    (home-page "https://github.com/dvdscripter/ini")
    (synopsis "Read and write configuration files")
    (description
     "This package provides tools to parse simple @code{.ini} configuration
files to an structured list.  Users can manipulate this resulting list with
@code{lapply()} functions.  This same structured list can be used to write
back to file after modifications.")
    (license license:gpl3)))

(define-public r-gh
  (package
    (name "r-gh")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gh" version))
       (sha256
        (base32
         "1llinfajb0g7006jd2w1hpskxpmkjhnqarcjb71r1qvsccb2ph7k"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-httr" ,r-httr)
       ("r-ini" ,r-ini)
       ("r-jsonlite" ,r-jsonlite)))
    (home-page "https://github.com/r-lib/gh#readme")
    (synopsis "Access the GitHub API via R")
    (description
     "This package provides a minimal R client to access the GitHub API.")
    (license license:expat)))

(define-public r-fs
  (package
    (name "r-fs")
    (version "1.2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fs" version))
       (sha256
        (base32
         "0kqqaqqml8x3r1mdld40iwns0ylj2f52qsdh1vcn39f7w7c2ka8j"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "http://fs.r-lib.org")
    (synopsis "Cross-platform file system operations based on libuv")
    (description
     "This package provides a cross-platform interface to file system
operations, built on top of the libuv C library.")
    (license license:gpl3)))

(define-public r-clisymbols
  (package
    (name "r-clisymbols")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "clisymbols" version))
       (sha256
        (base32
         "1q7gi2zmykhzas9v8fdnbpdq7pzdcpbhim1yxvd2062l777g4j86"))))
    (build-system r-build-system)
    (home-page "https://github.com/gaborcsardi/clisymbols")
    (synopsis "Unicode symbols at the R prompt")
    (description
     "This package provides a small subset of Unicode symbols, that are useful
when building command line applications.  They fall back to alternatives on
terminals that do not support Unicode.")
    (license license:expat)))

(define-public r-usethis
  (package
    (name "r-usethis")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "usethis" version))
       (sha256
        (base32
         "1gadckx3sxz9gxvpkprj9x7zcgg2nz5m4q0vi76ya9li1v03rwwn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-clipr" ,r-clipr)
       ("r-clisymbols" ,r-clisymbols)
       ("r-crayon" ,r-crayon)
       ("r-curl" ,r-curl)
       ("r-desc" ,r-desc)
       ("r-fs" ,r-fs)
       ("r-gh" ,r-gh)
       ("r-git2r" ,r-git2r)
       ("r-glue" ,r-glue)
       ("r-rlang" ,r-rlang)
       ("r-rprojroot" ,r-rprojroot)
       ("r-rstudioapi" ,r-rstudioapi)
       ("r-whisker" ,r-whisker)))
    (home-page "https://github.com/r-lib/usethis")
    (synopsis "Automate R package and project setup")
    (description
     "This package helps you to automate R package and project setup tasks
that are otherwise performed manually.  This includes setting up unit testing,
test coverage, continuous integration, Git, GitHub integration, licenses,
Rcpp, RStudio projects, and more.")
    (license license:gpl3)))

(define-public r-sessioninfo
  (package
    (name "r-sessioninfo")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sessioninfo" version))
       (sha256
        (base32
         "0j5f3l58fynxx3v0w62vqpii7miabszgljpja36xx9s8hikh8sqn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-cli" ,r-cli)
       ("r-withr" ,r-withr)))
    (home-page "https://github.com/r-lib/sessioninfo#readme")
    (synopsis "R session information")
    (description
     "This package provides tools to query and print information about the
current R session.  It is similar to @code{utils::sessionInfo()}, but includes
more information about packages, and where they were installed from.")
    (license license:gpl2)))

(define-public r-remotes
  (package
    (name "r-remotes")
    (version "2.0.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "remotes" version))
       (sha256
        (base32
         "0rsjxmhwpr51ilsdjfqn06mj8yr2d7nckcn3arv1ljn23qfkpcxa"))))
    (build-system r-build-system)
    (home-page "https://github.com/r-lib/remotes#readme")
    (synopsis "R package installation from remote repositories")
    (description
     "Download and install R packages stored in GitHub, BitBucket, or plain
subversion or git repositories.  This package is a lightweight replacement of
the @code{install_*} functions in the @code{devtools} package.  Indeed most of
the code was copied over from @code{devtools}.")
    (license license:gpl2+)))

(define-public r-xopen
  (package
    (name "r-xopen")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "xopen" version))
       (sha256
        (base32
         "1vrvgdika1d63dwygynbv2wmd87ll8dji5dy89hj576n8hw601z2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-processx" ,r-processx)))
    (home-page "https://github.com/r-lib/xopen#readme")
    (synopsis "Open system files, URLs, anything")
    (description
     "This package provides a cross-platform solution to open files,
directories or URLs with their associated programs.")
    (license license:expat)))

(define-public r-rcmdcheck
  (package
    (name "r-rcmdcheck")
    (version "1.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rcmdcheck" version))
       (sha256
        (base32
         "0ys1nd7690mhwzslyzg8fq1wxr28nz8g6av5iykkrshb8lkxg7ly"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-callr" ,r-callr)
       ("r-cli" ,r-cli)
       ("r-crayon" ,r-crayon)
       ("r-desc" ,r-desc)
       ("r-digest" ,r-digest)
       ("r-pkgbuild" ,r-pkgbuild)
       ("r-prettyunits" ,r-prettyunits)
       ("r-r6" ,r-r6)
       ("r-rprojroot" ,r-rprojroot)
       ("r-sessioninfo" ,r-sessioninfo)
       ("r-withr" ,r-withr)
       ("r-xopen" ,r-xopen)))
    (home-page "https://github.com/r-Lib/rcmdcheck#readme")
    (synopsis "Run R CMD check from R and capture results")
    (description
     "Run @code{R CMD check} from R programmatically, and capture the results
of the individual checks.")
    (license license:expat)))

(define-public r-rapportools
  (package
    (name "r-rapportools")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rapportools" version))
       (sha256
        (base32
         "1sgv4sc737i12arh5dc3263kjsz3dzg06qihfmrqyax94mv2d01b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-pander" ,r-pander)
       ("r-plyr" ,r-plyr)
       ("r-reshape" ,r-reshape)))
    (home-page "https://cran.r-project.org/web/packages/rapportools/")
    (synopsis "Miscellaneous helper functions with sane defaults for reporting")
    (description
     "This package provides helper functions that act as wrappers to more
advanced statistical methods with the advantage of having sane defaults for
quick reporting.")
    (license license:agpl3+)))

(define-public r-pander
  (package
    (name "r-pander")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pander" version))
       (sha256
        (base32
         "1bd9sdghlsppmff18k5fg3i0visq9f4wc82rlhwq5m82bmgdgnyi"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-digest" ,r-digest)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://rapporter.github.io/pander")
    (synopsis "Render R objects into Pandoc's markdown")
    (description
     "The main aim of the pander R package is to provide a minimal and easy
tool for rendering R objects into Pandoc's markdown.  The package is also
capable of exporting/converting complex Pandoc documents (reports) in various
ways.")
    ;; This package is licensed under either the AGPLv3+ or the very rarely
    ;; used OSL 3.0.
    (license license:agpl3+)))

(define-public r-summarytools
  (package
    (name "r-summarytools")
    (version "0.8.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "summarytools" version))
       (sha256
        (base32
         "0z836m6ib9bznwcawn6xf8gck05ydxwi3bx4jbrbyqql4kci8zwb"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-htmltools" ,r-htmltools)
       ("r-lubridate" ,r-lubridate)
       ("r-matrixstats" ,r-matrixstats)
       ("r-pander" ,r-pander)
       ("r-pryr" ,r-pryr)
       ("r-rapportools" ,r-rapportools)
       ("r-rcurl" ,r-rcurl)))
    (home-page "https://github.com/dcomtois/summarytools")
    (synopsis "Tools to quickly and neatly summarize data")
    (description
     "This package provides tools for data frame summaries, cross-tabulations,
weight-enabled frequency tables and common univariate statistics in concise
tables available in a variety of formats (plain ASCII, Markdown and HTML).  A
good point-of-entry for exploring data, both for experienced and new R
users.")
    (license license:gpl2)))

(define-public r-lsei
  (package
    (name "r-lsei")
    (version "1.2-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lsei" version))
       (sha256
        (base32
         "1xl06fb3is744pxlh42wx5hn1h0ab1k31wnmsmh0524kxzcyp0a7"))))
    (build-system r-build-system)
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://www.stat.auckland.ac.nz/~yongwang")
    (synopsis "Solve regression problems under equality/inequality constraints")
    (description
     "It contains functions that solve least squares linear regression
problems under linear equality/inequality constraints.  Functions for solving
quadratic programming problems are also available, which transform such
problems into least squares ones first.")
    (license license:gpl2+)))

(define-public r-npsurv
  (package
    (name "r-npsurv")
    (version "0.4-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "npsurv" version))
       (sha256
        (base32
         "1wq4c9yfha5azjhrn40iiqkshmvh611sa90jp3lh82n4bl9zfk20"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-lsei" ,r-lsei)))
    (home-page "https://www.stat.auckland.ac.nz/~yongwang")
    (synopsis "Nonparametric survival analysis")
    (description
     "This package contains functions for non-parametric survival analysis of
exact and interval-censored observations.")
    (license license:gpl2+)))

(define-public r-clusteval
  (package
    (name "r-clusteval")
    (version "0.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "clusteval" version))
       (sha256
        (base32
         "1ld0bdl4fy8dsfzm3k7a37cyxc6pfc9qs31x4pxd3z5rslghz7rj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mvtnorm" ,r-mvtnorm)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/clusteval/")
    (synopsis "Evaluation of clustering algorithms")
    (description
     "This R package provides a suite of tools to evaluate clustering
algorithms, clusterings, and individual clusters.")
    (license license:expat)))

(define-public r-tweedie
  (package
    (name "r-tweedie")
    (version "2.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tweedie" version))
       (sha256
        (base32
         "10fv998qjxsyx0h94fi0xbh6xbf24nwgh254n9zfnmix9vk2cqls"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/tweedie/")
    (synopsis "Evaluation of Tweedie exponential family models")
    (description
     "Maximum likelihood computations for Tweedie families, including the
series expansion (Dunn and Smyth, 2005; <doi10.1007/s11222-005-4070-y>) and
the Fourier inversion (Dunn and Smyth, 2008; <doi:10.1007/s11222-007-9039-6>),
and related methods.")
    (license license:gpl2+)))

(define-public r-rcppgsl
  (package
    (name "r-rcppgsl")
    (version "0.3.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RcppGSL" version))
       (sha256
        (base32
         "16pdapq31729db53agnb48jkvdm97167n3bigy5zazc3q3isis1m"))))
    (properties `((upstream-name . "RcppGSL")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)
       ("gsl" ,gsl)))
    (native-inputs
     `(("r-knitr" ,r-knitr))) ; for vignettes
    (home-page "https://cran.r-project.org/web/packages/RcppGSL/")
    (synopsis "Rcpp integration for GSL vectors and matrices")
    (description
     "The GNU Scientific Library (or GSL) is a collection of numerical
routines for scientific computing.  It is particularly useful for C and C++
programs as it provides a standard C interface to a wide range of mathematical
routines.  There are over 1000 functions in total with an extensive test
suite.  The RcppGSL package provides an easy-to-use interface between GSL data
structures and R using concepts from Rcpp which is itself a package that eases
the interfaces between R and C++.")
    (license license:gpl2+)))

(define-public r-mvabund
  (package
    (name "r-mvabund")
    (version "3.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "mvabund" version))
       (sha256
        (base32
         "1z8bj9zbc8h7w1xki9sc2p2rq6lv8gbcmiy9819z54d7lx1i9cnj"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-rcpp" ,r-rcpp)
       ("r-rcppgsl" ,r-rcppgsl)
       ("r-statmod" ,r-statmod)
       ("r-tweedie" ,r-tweedie)))
    (home-page "https://cran.r-project.org/web/packages/mvabund/")
    (synopsis "Statistical methods for analysing multivariate abundance data")
    (description
     "This package provides a set of tools for displaying, modeling and
analysing multivariate abundance data in community ecology.")
    (license license:lgpl2.1+)))

(define-public r-afex
  (package
    (name "r-afex")
    (version "0.22-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "afex" version))
       (sha256
        (base32
         "065wbxljl77zqvc2c4gpfpfyc6mbnnrf24q399q9bxmrz3sapj8n"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-lme4" ,r-lme4)
       ("r-lmertest" ,r-lmertest)
       ("r-pbkrtest" ,r-pbkrtest)
       ("r-reshape2" ,r-reshape2)))
    (home-page "https://afex.singmann.science/")
    (synopsis "Analysis of factorial experiments")
    (description
     "This package provides convenience functions for analyzing factorial
experiments using ANOVA or mixed models.")
    (license license:gpl2+)))

(define-public r-lmertest
  (package
    (name "r-lmertest")
    (version "3.0-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lmerTest" version))
       (sha256
        (base32
         "0pia69sc8bn37mkiprdf91iilziqb865f94k6x6c26i33fg7rq4m"))))
    (properties `((upstream-name . "lmerTest")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-lme4" ,r-lme4)
       ("r-mass" ,r-mass)
       ("r-numderiv" ,r-numderiv)))
    (home-page "https://github.com/runehaubo/lmerTestR")
    (synopsis "Tests in linear mixed effects models")
    (description
     "This package provides p-values in type I, II or III anova and summary
tables for @code{lmer} model fits via Satterthwaite's degrees of freedom
method.  A Kenward-Roger method is also available via the @code{pbkrtest}
package.  Model selection methods include step, drop1 and anova-like tables
for random effects (ranova).  Methods for Least-Square means (LS-means) and
tests of linear contrasts of fixed effects are also available.")
    (license license:gpl2+)))

(define-public r-r2glmm
  (package
    (name "r-r2glmm")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "r2glmm" version))
       (sha256
        (base32
         "0iim92blpa59vgz97c2pi05yhbjjmaffdbkbmk5kplfb2vmazgiy"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-afex" ,r-afex)
       ("r-data-table" ,r-data-table)
       ("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-lmertest" ,r-lmertest)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-mgcv" ,r-mgcv)
       ("r-pbkrtest" ,r-pbkrtest)))
    (home-page "https://github.com/bcjaeger/r2glmm")
    (synopsis "Compute R squared for mixed (multilevel) models")
    (description
     "This package computes model and semi partial R squared with confidence
limits for the linear and generalized linear mixed model (LMM and GLMM).  The
R squared measure from L. J. Edwards et al. (2008) is extended to the GLMM
using @dfn{penalized quasi-likelihood} (PQL) estimation (see Jaeger et
al. (2016)).")
    (license license:gpl2)))

(define-public r-weights
  (package
    (name "r-weights")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "weights" version))
       (sha256
        (base32
         "0186bfpkhxngrshac6bpg37alp6slwhwd43inrm8hqg0vhpfgc4c"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-gdata" ,r-gdata)
       ("r-hmisc" ,r-hmisc)
       ("r-mice" ,r-mice)))
    (home-page
     "https://cran.r-project.org/web/packages/weights/")
    (synopsis "Weighting and weighted statistics")
    (description "This package Provides a variety of functions for producing
simple weighted statistics, such as weighted Pearson's correlations, partial
correlations, Chi-Squared statistics, histograms, and t-tests.  Also now
includes some software for quickly recoding survey data and plotting point
estimates from interaction terms in regressions (and multiply imputed
regressions).  NOTE: Weighted partial correlation calculations pulled to
address a bug.")
  (license license:gpl2+)))

(define-public r-rcppannoy
  (package
    (name "r-rcppannoy")
    (version "0.0.11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RcppAnnoy" version))
       (sha256
        (base32
         "1ik50ancfgcvh03n4jsqwjk8lf056rbgd70q4l4didmvh5kcyjd1"))))
    (properties `((upstream-name . "RcppAnnoy")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcpp" ,r-rcpp)))
    (native-inputs
     `(("r-knitr" ,r-knitr))) ; for vignettes
    (home-page "https://cran.r-project.org/web/packages/RcppAnnoy/")
    (synopsis "Rcpp bindings for Annoy, a library for Approximate Nearest Neighbors")
    (description
     "Annoy is a small C++ library for Approximate Nearest Neighbors written
for efficient memory usage as well an ability to load from and save to disk.
This package provides an R interface.")
    ;; Annoy is released under ASL 2.0, but this wrapper is released under
    ;; GPLv2+.
    (license (list license:gpl2+ license:asl2.0))))

(define-public r-ncdf4
  (package
    (name "r-ncdf4")
    (version "1.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ncdf4" version))
       (sha256
        (base32
         "0lwjjis0b83c4l3xvqai4ckzrskd6mychck1iwxcxgjvh0d77mgd"))))
    (build-system r-build-system)
    (inputs
     `(("netcdf" ,netcdf)
       ("zlib" ,zlib)))
    (home-page "https://cran.r-project.org/web/packages/ncdf4/index.html")
    (synopsis "R interface to Unidata netCDF format data files")
    (description
     "This package provides a high-level R interface to data files written
using Unidata's netCDF library (version 4 or earlier), which are binary data
files that are portable across platforms and include metadata information in
addition to the data sets.  Using this package, netCDF files can be opened and
data sets read in easily.  It is also easy to create new netCDF dimensions,
variables, and files, in either version 3 or 4 format, and manipulate existing
netCDF files.")
    (license license:gpl3+)))

(define-public r-biocmanager
  (package
    (name "r-biocmanager")
    (version "1.30.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "BiocManager" version))
       (sha256
        (base32
         "0kxs76pixk1d2lpvkyrq6nnvv1rqf55ph5f7igkadyyqirf3y2ah"))))
    (properties `((upstream-name . "BiocManager")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/BiocManager/")
    (synopsis "Access the Bioconductor project package repository")
    (description
     "This package provides a convenient tool to install and update
Bioconductor packages.")
    (license license:artistic2.0)))

(define-public r-rgl
  (package
    (name "r-rgl")
    (version "0.99.16")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rgl" version))
       (sha256
        (base32
         "0q8sg8fr0140ilssqhscaxkjc29w1rpp6f4k50amw3zzs9g58ak9"))))
    (build-system r-build-system)
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (inputs
     `(("freetype" ,freetype)
       ("libpng" ,libpng)
       ("glu" ,glu)
       ("libx11" ,libx11)
       ("ghc-pandoc" ,ghc-pandoc)
       ("zlib" ,zlib)))
    (propagated-inputs
     `(("r-crosstalk" ,r-crosstalk)
       ("r-htmltools" ,r-htmltools)
       ("r-htmlwidgets" ,r-htmlwidgets)
       ("r-jsonlite" ,r-jsonlite)
       ("r-knitr" ,r-knitr)
       ("r-magrittr" ,r-magrittr)
       ("r-manipulatewidget" ,r-manipulatewidget)
       ("r-shiny" ,r-shiny)))
    (home-page "https://r-forge.r-project.org/projects/rgl/")
    (synopsis "3D visualization using OpenGL")
    (description
     "This package provides medium to high level functions for 3D interactive graphics,
including functions modelled on base graphics (@code{plot3d()}, etc.) as well
as functions for constructing representations of geometric
objects (@code{cube3d()}, etc.).  Output may be on screen using OpenGL, or to
various standard 3D file formats including WebGL, PLY, OBJ, STL as well as 2D
image formats, including PNG, Postscript, SVG, PGF.")
    ;; Any version of the GPL.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-multicool
  (package
    (name "r-multicool")
    (version "0.1-10")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "multicool" version))
       (sha256
        (base32
         "1ybg9piya9psqg42w9i3zsnavbxhkfklfwl7cb420i5nkq6wpc2v"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/multicool/")
    (synopsis "Permutations of multisets in cool-lex order")
    (description
     "This package provides a set of tools to permute multisets without loops
or hash tables and to generate integer partitions.  Cool-lex order is similar
to colexicographical order.")
    (license license:gpl2)))

(define-public r-misc3d
  (package
    (name "r-misc3d")
    (version "0.8-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "misc3d" version))
       (sha256
        (base32
         "0qjzpw3h09qi2gfz52b7nhzd95p7yyxsd03fldc9wzzn6wi3vpkm"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/misc3d/")
    (synopsis "Miscellaneous 3D Plots")
    (description
     "This package provides a collection of miscellaneous 3d plots, including
isosurfaces.")
    ;; Any version of the GPL.
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-ks
  (package
    (name "r-ks")
    (version "1.11.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ks" version))
       (sha256
        (base32
         "0z749c3xzpf6n0g7xcfplrhap1di8k7kcfr7vigh95ywnigyhs8d"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fnn" ,r-fnn)
       ("r-kernlab" ,r-kernlab)
       ("r-kernsmooth" ,r-kernsmooth)
       ("r-matrix" ,r-matrix)
       ("r-mclust" ,r-mclust)
       ("r-mgcv" ,r-mgcv)
       ("r-misc3d" ,r-misc3d)
       ("r-multicool" ,r-multicool)
       ("r-mvtnorm" ,r-mvtnorm)))
    (home-page "http://www.mvstat.net/tduong/")
    (synopsis "Kernel smoothing")
    (description
     "This package provides kernel smoothers for univariate and multivariate
data, including density functions, density derivatives, cumulative
distributions, modal clustering, discriminant analysis, and two-sample
hypothesis testing.")
    ;; Either version of the GPL.
    (license (list license:gpl2 license:gpl3))))

(define-public r-feature
  (package
    (name "r-feature")
    (version "1.2.13")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "feature" version))
       (sha256
        (base32
         "07hkw0bv38naj2hdsx4xxrm2dngi6w3rbvgr7s50bjic8hlgy1ra"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ks" ,r-ks)
       ("r-misc3d" ,r-misc3d)
       ("r-rgl" ,r-rgl)))
    (home-page "http://www.mvstat.net/tduong/")
    (synopsis "Inferential feature significance for kernel density estimation")
    (description
     "The feature package contains functions to display and compute kernel
density estimates, significant gradient and significant curvature regions.
Significant gradient and/or curvature regions often correspond to significant
features (e.g. local modes).")
    ;; Either version of the GPL.
    (license (list license:gpl2 license:gpl3))))

(define-public r-arm
  (package
    (name "r-arm")
    (version "1.10-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "arm" version))
       (sha256
        (base32
         "0vvp90jygajd6ydky57z66wqjq9msfbl88irj5jbsray574mh4bg"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-coda" ,r-coda)
       ("r-lme4" ,r-lme4)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-nlme" ,r-nlme)))
    (home-page "https://cran.r-project.org/web/packages/arm/")
    (synopsis "Data analysis using regression and multilevel/hierarchical models")
    (description
     "This package provides functions to accompany A. Gelman and J. Hill,
Data Analysis Using Regression and Multilevel/Hierarchical Models, Cambridge
University Press, 2007.")
    (license license:gpl3+)))

(define-public r-circular
  (package
    (name "r-circular")
    (version "0.4-93")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "circular" version))
       (sha256
        (base32
         "0hki85rs8wc5950pjaw28q54rly2napfbcrx3pchlfap6wwy5kkn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-boot" ,r-boot)
       ("r-mvtnorm" ,r-mvtnorm)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/circular/")
    (synopsis "Circular statistics")
    (description
     "This package provides tools for circular statistics, from \"Topics in
circular Statistics\" (2001) S. Rao Jammalamadaka and A. SenGupta, World
Scientific.")
    (license license:gpl2+)))

(define-public r-activity
  (package
    (name "r-activity")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "activity" version))
       (sha256
        (base32
         "1lqajgxfps2h6amz1791vp3f52rs9ghmanq1nqfxqd2jmk3idkrx"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-circular" ,r-circular)
       ("r-overlap" ,r-overlap)
       ("r-pbapply" ,r-pbapply)))
    (home-page "https://cran.r-project.org/web/packages/activity/")
    (synopsis "Animal activity statistics")
    (description
     "This package provides functions to fit kernel density functions to
animal activity time data; plot activity distributions; quantify overall
levels of activity; statistically compare activity metrics through
bootstrapping; and evaluate variation in linear variables with time (or other
circular variables).")
    (license license:gpl3)))

(define-public r-ouch
  (package
    (name "r-ouch")
    (version "2.11-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ouch" version))
       (sha256
        (base32
         "0xkwwi62vdahlcg3k32zb1nfwsx87zdssk79mvcxgfsw9bw4gahx"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-subplex" ,r-subplex)))
    (home-page "http://kingaa.github.io/ouch/")
    (synopsis "Ornstein-Uhlenbeck models for phylogenetic comparative hypotheses")
    (description
     "This package provides tools to fit and compare Ornstein-Uhlenbeck models
for evolution along a phylogenetic tree.")
    (license license:gpl2+)))

(define-public r-fmsb
  (package
    (name "r-fmsb")
    (version "0.6.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fmsb" version))
       (sha256
        (base32
         "1n29bnyp20pvpk2lsa9fblsj5w7amp14snc74pk5w3yr5y6rj0s5"))))
    (build-system r-build-system)
    (home-page "http://minato.sip21c.org/msb/")
    (synopsis "Functions for medical statistics book with demographic data")
    (description
     "This package provides several utility functions for the book entitled
\"Practices of Medical and Health Data Analysis using R\" (Pearson Education
Japan, 2007) with Japanese demographic data and some demographic analysis
related functions.")
    (license license:gpl2+)))

(define-public r-stabledist
  (package
    (name "r-stabledist")
    (version "0.7-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "stabledist" version))
       (sha256
        (base32
         "0scar396wiq6wkbkvwp4qrxqc1m075y56p37i6iry5rw796p1i86"))))
    (build-system r-build-system)
    (home-page "http://www.rmetrics.org")
    (synopsis "Stable distribution functions")
    (description
     "This package provides density, probability and quantile functions, and
random number generation for (skew) stable distributions, using the
parametrizations of Nolan.")
    (license license:gpl2+)))

(define-public r-gsl
  (package
    (name "r-gsl")
    (version "1.9-10.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gsl" version))
       (sha256
        (base32
         "00isw2iha5af4s7rr8svqka9mkl9l26l8h2rnk4r7fkhh7fc97sg"))))
    (build-system r-build-system)
    (inputs
     `(("gsl" ,gsl)))
    (home-page "https://cran.r-project.org/web/packages/gsl")
    (synopsis "Wrapper for the GNU Scientific Library")
    (description
     "This package provides an R wrapper for the special functions and quasi
random number generators of the GNU Scientific Library.")
    (license license:gpl2+)))

(define-public r-adgoftest
  (package
    (name "r-adgoftest")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ADGofTest" version))
       (sha256
        (base32
         "0ik817qzqp6kfbckjp1z7srlma0w6z2zcwykh0jdiv7nahwk3ncw"))))
    (properties `((upstream-name . "ADGofTest")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ADGofTest")
    (synopsis "Anderson-Darling GoF test")
    (description
     "This package provides an implementation of the Anderson-Darling GoF test
with p-value calculation based on Marsaglia's 2004 paper \"Evaluating the
Anderson-Darling Distribution\".")
    ;; Any version of the GPL.
    (license license:gpl3+)))

(define-public r-softimpute
  (package
    (name "r-softimpute")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "softImpute" version))
       (sha256
        (base32
         "07cxbzkl08q58m1455i139952rmryjlic4s2f2hscl5zxxmfdxcq"))))
    (properties `((upstream-name . "softImpute")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-matrix" ,r-matrix)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/softImpute")
    (synopsis "Matrix completion via iterative soft-thresholded SVD")
    (description
     "This package provides iterative methods for matrix completion that use
nuclear-norm regularization.  The package includes procedures for centering
and scaling rows, columns or both, and for computing low-rank @dfn{single
value decompositions} (SVDs) on large sparse centered matrices (i.e. principal
components).")
    (license license:gpl2)))

(define-public r-fftwtools
  (package
    (name "r-fftwtools")
    (version "0.9-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fftwtools" version))
       (sha256
        (base32
         "1nqvpzda281rxi1cmwajxxsn3sc3gz7scv8bvs5jm34kf36whha6"))))
    (build-system r-build-system)
    (inputs `(("fftw" ,fftw)))
    (home-page "https://github.com/krahim/fftwtools")
    (synopsis "Wrapper for FFTW3")
    (description
     "This package provides a wrapper for several FFTW functions.  It provides
access to the two-dimensional FFT, the multivariate FFT, and the
one-dimensional real to complex FFT using the FFTW3 library.  The package
includes the functions @code{fftw()} and @code{mvfftw()} which are designed to
mimic the functionality of the R functions @code{fft()} and @code{mvfft()}.
The FFT functions have a parameter that allows them to not return the
redundant complex conjugate when the input is real data.")
    (license license:gpl2+)))

(define-public r-tiff
  (package
    (name "r-tiff")
    (version "0.1-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tiff" version))
       (sha256
        (base32
         "0asf2bws3x3yd3g3ixvk0f86b0mdf882pl8xrqlxrkbgjalyc54m"))))
    (build-system r-build-system)
    (inputs
     `(("libtiff" ,libtiff)
       ("libjpeg" ,libjpeg)
       ("zlib" ,zlib)))
    (home-page "http://www.rforge.net/tiff/")
    (synopsis "Read and write TIFF images")
    (description
     "This package provides an easy and simple way to read, write and display
bitmap images stored in the TIFF format.  It can read and write both files and
in-memory raw vectors.")
    ;; Either of these two license versions.
    (license (list license:gpl2 license:gpl3))))

(define-public r-waveslim
  (package
    (name "r-waveslim")
    (version "1.7.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "waveslim" version))
       (sha256
        (base32
         "0lqslkihgrd7rbihqhhk57m9vkbnfsznkvk8430cvbcsn7vridii"))))
    (build-system r-build-system)
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "http://waveslim.blogspot.com")
    (synopsis "Basic wavelet routines for signal processing")
    (description
     "This package provides basic wavelet routines for time series (1D),
image (2D) and array (3D) analysis.  The code provided here is based on
wavelet methodology developed in Percival and Walden (2000); Gencay, Selcuk
and Whitcher (2001); the dual-tree complex wavelet transform (DTCWT) from
Kingsbury (1999, 2001) as implemented by Selesnick; and Hilbert wavelet
pairs (Selesnick 2001, 2002).")
    (license license:bsd-3)))

(define-public r-wordcloud
  (package
    (name "r-wordcloud")
    (version "2.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "wordcloud" version))
       (sha256
        (base32
         "0j96yyvm6bcrrpbdx4w26piqx44a0vbsr3px9cb4zk8a8da6jwak"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/wordcloud")
    (synopsis "Word clouds")
    (description
     "This package provides functionality to create pretty word clouds,
visualize differences and similarity between documents, and avoid
over-plotting in scatter plots with text.")
    (license license:lgpl2.1)))

(define-public r-colorramps
  (package
    (name "r-colorramps")
    (version "2.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "colorRamps" version))
       (sha256
        (base32
         "0shbjh83x1axv4drm5r3dwgbyv70idih8z4wlzjs4hiac2qfl41z"))))
    (properties `((upstream-name . "colorRamps")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/colorRamps")
    (synopsis "Build color tables")
    (description "This package provides features to build gradient color
maps.")
    ;; Any version of the GPL
    (license license:gpl3+)))

(define-public r-tidytree
  (package
    (name "r-tidytree")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tidytree" version))
       (sha256
        (base32
         "1sx69wvlp7k761cmglrzq2jxkm2iq27x6bhhdcisj62wryj96wb2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ape" ,r-ape)
       ("r-dplyr" ,r-dplyr)
       ("r-lazyeval" ,r-lazyeval)
       ("r-magrittr" ,r-magrittr)
       ("r-rlang" ,r-rlang)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/GuangchuangYu/tidytree")
    (synopsis "Tidy tool for phylogenetic tree data manipulation")
    (description
     "Phylogenetic trees generally contain multiple components including nodes,
edges, branches and associated data.  This package provides an approach to
convert tree objects to tidy data frames.  It also provides tidy interfaces to
manipulate tree data.")
    (license license:artistic2.0)))

(define-public r-rvcheck
  (package
    (name "r-rvcheck")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rvcheck" version))
       (sha256
        (base32
         "1i2g6gyiqyd1pn6y0h6vmlcmg1qb5pv7rym8mkw8jnyc3in9hn8b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rlang" ,r-rlang)))
    (home-page "https://cran.r-project.org/web/packages/rvcheck")
    (synopsis "R package version check")
    (description
     "This package provides tools to check the latest release version of R and
R packages (on CRAN, Bioconductor or Github).")
    (license license:artistic2.0)))

(define-public r-docopt
  (package
    (name "r-docopt")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "docopt" version))
       (sha256
        (base32
         "06zknnd0c5s2y0hbddzdlr3m63ib783izpck6pgz7sjbab5pd068"))))
    (build-system r-build-system)
    (home-page "https://github.com/docopt/docopt.R")
    (synopsis "Command-line interface specification language")
    (description
     "This package enables you to define a command-line interface by just
giving it a description in the specific format.")
    (license license:expat)))

(define-public r-sparsesvd
  (package
    (name "r-sparsesvd")
    (version "0.1-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "sparsesvd" version))
       (sha256
        (base32
         "1yf373552wvdnd65r7hfcqa3v29dqn7jd4cn431mqd2acnqjrsam"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-matrix" ,r-matrix)))
    (home-page "http://tedlab.mit.edu/~dr/SVDLIBC/")
    (synopsis "Sparse truncated singular value decomposition")
    (description
     "This package provides a Wrapper around the SVDLIBC library
for (truncated) singular value decomposition of a sparse matrix.  Currently,
only sparse real matrices in Matrix package format are supported.")
    ;; SVDLIBC is released under BSD-2.  The R interface is released under
    ;; BSD-3.
    (license (list license:bsd-3 license:bsd-2))))

(define-public r-densityclust
  (package
    (name "r-densityclust")
    (version "0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "densityClust" version))
       (sha256
        (base32
         "1zry0vafajzmr37aylglxfvwplhdygbkb9cvzvh8cy0xgnjrnx13"))))
    (properties `((upstream-name . "densityClust")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fnn" ,r-fnn)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggrepel" ,r-ggrepel)
       ("r-gridextra" ,r-gridextra)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-rcpp" ,r-rcpp)
       ("r-rtsne" ,r-rtsne)))
    (home-page "https://cran.r-project.org/web/packages/densityClust")
    (synopsis "Clustering by fast search and find of density peaks")
    (description
     "This package provides an improved implementation (based on k-nearest
neighbors) of the density peak clustering algorithm, originally described by
Alex Rodriguez and Alessandro Laio (Science, 2014 vol. 344).  It can handle
large datasets (> 100,000 samples) very efficiently.")
    (license license:gpl2+)))

(define-public r-combinat
  (package
    (name "r-combinat")
    (version "0.0-8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "combinat" version))
       (sha256
        (base32
         "1h9hr88gigihc4na7lb5i7rn4az1xa7sb34zvnznaj6pdrmwy4qm"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/combinat")
    (synopsis "Combinatorics utilities")
    (description "This package provides assorted routines for combinatorics.")
    (license license:gpl2)))

(define-public r-qlcmatrix
  (package
    (name "r-qlcmatrix")
    (version "0.9.7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "qlcMatrix" version))
       (sha256
        (base32
         "0iqkcvvy8rxlk0s83sjq57dd6fadb18p5z31lzy0gnzv1hsy1x8y"))))
    (properties `((upstream-name . "qlcMatrix")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-docopt" ,r-docopt)
       ("r-matrix" ,r-matrix)
       ("r-slam" ,r-slam)
       ("r-sparsesvd" ,r-sparsesvd)))
    (home-page "https://cran.r-project.org/web/packages/qlcMatrix")
    (synopsis "Sparse matrix functions for quantitative language comparison")
    (description
     "This package provides an extension of the functionality of the Matrix
package for using sparse matrices.  Some of the functions are very general,
while other are highly specific for the special data format used for
@dfn{quantitative language comparison} (QLC).")
    (license license:gpl3)))

(define-public r-ddrtree
  (package
    (name "r-ddrtree")
    (version "0.1.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "DDRTree" version))
       (sha256
        (base32
         "16s5fjw7kwlxhrkzdny62sx32fvmg3rxjc3wrh6krd31jh1fqlfk"))))
    (properties `((upstream-name . "DDRTree")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-irlba" ,r-irlba)
       ("r-rcpp" ,r-rcpp)
       ("r-rcppeigen" ,r-rcppeigen)))
    (home-page "https://cran.r-project.org/web/packages/DDRTree")
    (synopsis "Learning principal graphs with DDRTree")
    (description
     "This package provides an implementation of the framework of
@dfn{reversed graph embedding} (RGE) which projects data into a reduced
dimensional space while constructs a principal tree which passes through the
middle of the data simultaneously.  DDRTree shows superiority to
alternatives (Wishbone, DPT) for inferring the ordering as well as the
intrinsic structure of single cell genomics data.  In general, it could be
used to reconstruct the temporal progression as well as the bifurcation
structure of any data type.")
    (license license:asl2.0)))

(define-public r-corpcor
  (package
    (name "r-corpcor")
    (version "1.6.9")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "corpcor" version))
       (sha256
        (base32
         "1hi3i9d3841snppq1ks5pd8cliq1b4rm4dpsczmfqvwksg8snkrf"))))
    (build-system r-build-system)
    (home-page "http://strimmerlab.org/software/corpcor/")
    (synopsis "Efficient estimation of covariance and (partial) correlation")
    (description
     "This package implements a James-Stein-type shrinkage estimator for the
covariance matrix, with separate shrinkage for variances and correlations.
Furthermore, functions are available for fast singular value decomposition,
for computing the pseudoinverse, and for checking the rank and positive
definiteness of a matrix.")
    (license license:gpl3+)))

(define-public r-rspectra
  (package
    (name "r-rspectra")
    (version "0.13-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RSpectra" version))
       (sha256
        (base32
         "1sw80chwyyjzf5px278l6xmp94yhwrlj5xh8d3wlw3dnvdkycca7"))))
    (properties `((upstream-name . "RSpectra")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)
       ("r-rcppeigen" ,r-rcppeigen)))
    (home-page "https://github.com/yixuan/RSpectra")
    (synopsis "Solvers for large-scale Eigenvalue and SVD problems")
    (description
     "This package provides an R interface to the Spectra library for
large-scale eigenvalue and SVD problems.  It is typically used to compute a
few eigenvalues/vectors of an n by n matrix, e.g., the k largest eigenvalues,
which is usually more efficient than @code{eigen()} if k << n.")
    ;; MPL 2 or later.
    (license license:mpl2.0)))

(define-public r-vbsr
  (package
    (name "r-vbsr")
    (version "0.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "vbsr" version))
       (sha256
        (base32
         "1avskbxxyinjjdga4rnghcfvd4sypv4m39ysfaij5avvmi89bx3b"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/vbsr")
    (synopsis "Variational Bayes spike regression regularized linear models")
    (description
     "This package provides an efficient algorithm for solving ultra-sparse
regularized regression models using a variational Bayes algorithm with a spike
prior.  The algorithm is solved on a path, with coordinate updates, and is
capable of generating very sparse models.  Very general model
diagnostics for controlling type-1 errors are also provided.")
    (license license:gpl2)))

(define-public r-flare
  (package
    (name "r-flare")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "flare" version))
       (sha256
        (base32
         "0ygif9a7a99qwv0b488wymmmncp6f5ww9yz13s4qs6p8yf37x1r1"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-igraph" ,r-igraph)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)))
    (home-page "https://cran.r-project.org/web/packages/flare")
    (synopsis "Family of Lasso regression implementations")
    (description
     "This packages provides implementations of a family of Lasso variants
including Dantzig Selector, LAD Lasso, SQRT Lasso, Lq Lasso for estimating
high dimensional sparse linear models.")
    (license license:gpl2)))

(define-public r-lassopv
  (package
    (name "r-lassopv")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "lassopv" version))
       (sha256
        (base32
         "0yawnjw063jypk3riy9xab9cmliv6c9dnabi18670khd3gzb2r9z"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-lars" ,r-lars)))
    (home-page "https://github.com/lingfeiwang/lassopv")
    (synopsis "Non-parametric p-value estimation for predictors in Lasso")
    (description
     "This package enables you to estimate the p-values for predictors x
against target variable y in Lasso regression, using the regularization
strength when each predictor enters the active set of regularization path for
the first time as the statistic.")
    (license license:gpl3)))

(define-public r-splitstackshape
  (package
    (name "r-splitstackshape")
    (version "1.4.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "splitstackshape" version))
       (sha256
        (base32
         "03w6h64ga4zqilffdway4l38l5cbman4yrspkzhbigds12aqz25r"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-data-table" ,r-data-table)))
    (home-page "https://github.com/mrdwab/splitstackshape")
    (synopsis "Stack and reshape datasets after splitting concatenated values")
    (description
     "Online data collection tools like Google Forms often export
multiple-response questions with data concatenated in cells.  The
@code{concat.split} (cSplit) family of functions provided by this package
splits such data into separate cells.  This package also includes functions to
stack groups of columns and to reshape wide data, even when the data are
\"unbalanced\"---something which @code{reshape} (from base R) does not handle,
and which @code{melt} and @code{dcast} from @code{reshape2} do not easily
handle.")
    (license license:gpl3)))

(define-public r-tfmpvalue
  (package
    (name "r-tfmpvalue")
    (version "0.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "TFMPvalue" version))
       (sha256
        (base32
         "0h9qkl15k8v17v3g9bdnfwvh2s04ywjgg5y0xn2077dmywlja1bd"))))
    (properties `((upstream-name . "TFMPvalue")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/ge11232002/TFMPvalue")
    (synopsis "P-value computation for position weight matrices")
    (description
     "In putative @dfn{Transcription Factor Binding Sites} (TFBSs)
identification from sequence/alignments, we are interested in the significance
of certain match scores.  TFMPvalue provides the accurate calculation of a
p-value with a score threshold for position weight matrices, or the score with
a given p-value.  It is an interface to code originally made available by
Helene Touzet and Jean-Stephane Varre, 2007, Algorithms Mol Biol:2, 15.
Touzet and Varre (2007).")
    (license license:gpl2)))

(define-public r-rnifti
  (package
    (name "r-rnifti")
    (version "0.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "RNifti" version))
       (sha256
        (base32
         "07sfzps4yg5zdhbxh6i4rbjvbjvvf2d8i9jcf64ywbmi557sw1zv"))))
    (properties `((upstream-name . "RNifti")))
    (build-system r-build-system)
    (propagated-inputs `(("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/jonclayden/RNifti")
    (synopsis "Fast R and C++ access to NIfTI images")
    (description
     "This package provides very fast read and write access to images stored
in the NIfTI-1 and ANALYZE-7.5 formats, with seamless synchronisation between
compiled C and interpreted R code.  It also provides a C/C++ API that can be
used by other packages.")
    (license license:gpl2)))

(define-public r-shades
  (package
    (name "r-shades")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "shades" version))
       (sha256
        (base32
         "0qbg7b37ifgil7ka4vhk15wjf65rwha233yppqd9wlf3gys8784n"))))
    (build-system r-build-system)
    (home-page "https://github.com/jonclayden/shades")
    (synopsis "Simple color manipulation")
    (description
     "This package provides functions for easily manipulating colors,
creating color scales and calculating color distances.")
    (license license:bsd-3)))

(define-public r-ore
  (package
    (name "r-ore")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ore" version))
       (sha256
        (base32
         "1l1ziljgm5gwjhvjq42wi5vcwbxlaj5dl9w8bhz0wh8vx4ajj07m"))))
    (build-system r-build-system)
    (home-page "https://github.com/jonclayden/ore")
    (synopsis "R interface to the Onigmo regular expression library")
    (description
     "This package provides an alternative to R's built-in functionality for
handling regular expressions, based on the Onigmo library.  It offers
first-class compiled regex objects, partial matching and function-based
substitutions, amongst other features.")
    (license license:bsd-3)))

(define-public r-reportr
  (package
    (name "r-reportr")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "reportr" version))
       (sha256
        (base32
         "0zynplxqvbmf23cm2rsz3wz2jx6mv55z94mn1k44ny3lx625cnpw"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-ore" ,r-ore)))
    (home-page "https://github.com/jonclayden/reportr")
    (synopsis "General message and error reporting system")
    (description
     "This package provides a system for reporting messages, which offers
certain useful features over the standard R system, such as the incorporation
of output consolidation, message filtering, assertions, expression
substitution, automatic generation of stack traces for debugging, and
conditional reporting based on the current \"output level\".")
    (license license:gpl2)))

(define-public r-tractor-base
  (package
    (name "r-tractor-base")
    (version "3.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "tractor.base" version))
       (sha256
        (base32
         "0i62dwra0yh565ryz75byfgqv22bqwz7138zs48w46yj2h8q9hyj"))))
    (properties `((upstream-name . "tractor.base")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ore" ,r-ore)
       ("r-reportr" ,r-reportr)
       ("r-rnifti" ,r-rnifti)
       ("r-shades" ,r-shades)))
    (home-page "http://www.tractor-mri.org.uk")
    (synopsis "Read, manipulate and visualize magnetic resonance images")
    (description
     "This package provides functions for working with magnetic resonance
images.  It supports reading and writing of popular file formats (DICOM,
Analyze, NIfTI-1, NIfTI-2, MGH); interactive and non-interactive
visualization; flexible image manipulation; metadata and sparse image
handling.")
    (license license:gpl2)))

(define-public r-grimport
  (package
    (name "r-grimport")
    (version "0.9-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "grImport" version))
       (sha256
        (base32
         "1qhyw5wiyfqw1wcpvcgdwc1vgaz7j7dbc7qa5h85qgml7hb68mjv"))))
    (properties `((upstream-name . "grImport")))
    (build-system r-build-system)
    (inputs
     `(("ghostscript" ,ghostscript)))
    (propagated-inputs
     `(("r-xml" ,r-xml)))
    (home-page "https://cran.r-project.org/web/packages/grImport")
    (synopsis "Convert, import, and draw PostScript pictures")
    (description
     "This package provides functions for converting, importing, and drawing
PostScript pictures in R plots.")
    (license license:gpl2+)))

(define-public r-kohonen
  (package
    (name "r-kohonen")
    (version "3.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "kohonen" version))
       (sha256
        (base32
         "1zbfqa1qdlry8w6xhypkiknc5gn98v1ijhlsfka8zjg8ajhqgn1q"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-mass" ,r-mass)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://cran.r-project.org/web/packages/kohonen")
    (synopsis "Supervised and unsupervised self-organising maps")
    (description
     "This package provides functions to train @dfn{self-organising
maps} (SOMs).  Also interrogation of the maps and prediction using trained
maps are supported.  The name of the package refers to Teuvo Kohonen, the
inventor of the SOM.")
    (license license:gpl2+)))

(define-public r-nnls
  (package
    (name "r-nnls")
    (version "1.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "nnls" version))
       (sha256
        (base32
         "07vcrrxvswrvfiha6f3ikn640yg0m2b4yd9lkmim1g0jmsmpfp8f"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/nnls")
    (synopsis "Lawson-Hanson algorithm for non-negative least squares")
    (description
     "This package provides an R interface to the Lawson-Hanson implementation
of an algorithm for @dfn{non-negative least squares} (NNLS).  It also allows
the combination of non-negative and non-positive constraints.")
    (license license:gpl2+)))

(define-public r-iso
  (package
    (name "r-iso")
    (version "0.0-17")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Iso" version))
       (sha256
        (base32
         "0lljc99sdzdqj6d56qbsggibr6pkdwkh821bj70ianikyvmdc1y0"))))
    (properties `((upstream-name . "Iso")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "http://www.stat.auckland.ac.nz/~rolf/")
    (synopsis "Functions to perform isotonic regression")
    (description
     "This package provides support for linear order and unimodal
order (univariate) isotonic regression and bivariate isotonic regression with
linear order on both variables.")
    (license license:gpl2+)))

(define-public r-chemometricswithr
  (package
    (name "r-chemometricswithr")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ChemometricsWithR" version))
       (sha256
        (base32
         "00z09bplm5qvd31y7m4b4knsrl0n27j9635m1gdak6lg4db4nxrd"))))
    (properties
     `((upstream-name . "ChemometricsWithR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-devtools" ,r-devtools)
       ("r-kohonen" ,r-kohonen)
       ("r-mass" ,r-mass)
       ("r-pls" ,r-pls)))
    (home-page "https://github.com/rwehrens/CWR")
    (synopsis "Chemometrics with R")
    (description
     "This package provides functions and scripts used in the book
\"Chemometrics with R - Multivariate Data Analysis in the Natural Sciences and
Life Sciences\" by Ron Wehrens, Springer (2011).")
    (license license:gpl2+)))

(define-public r-als
  (package
    (name "r-als")
    (version "0.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ALS" version))
       (sha256
        (base32
         "1swrn39vy50fazkpf97r7c542gkj6mlvy8gmcxllg7mf2mqx546a"))))
    (properties `((upstream-name . "ALS")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-iso" ,r-iso)
       ("r-nnls" ,r-nnls)))
    (home-page "https://cran.r-project.org/web/packages/ALS")
    (synopsis "Multivariate curve resolution alternating least squares")
    (description
     "Alternating least squares is often used to resolve components
contributing to data with a bilinear structure; the basic technique may be
extended to alternating constrained least squares.  This package provides an
implementation of @dfn{multivariate curve resolution alternating least
squares} (MCR-ALS).

Commonly applied constraints include unimodality, non-negativity, and
normalization of components.  Several data matrices may be decomposed
simultaneously by assuming that one of the two matrices in the bilinear
decomposition is shared between datasets.")
    (license license:gpl2+)))

(define-public r-strucchange
  (package
    (name "r-strucchange")
    (version "1.5-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "strucchange" version))
       (sha256
        (base32
         "0cdgvl6kphm2i59bmnppn1y3kv65ml111bk7yzpcx7vv8wh2w3kl"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-sandwich" ,r-sandwich)
       ("r-zoo" ,r-zoo)))
    (home-page "https://cran.r-project.org/web/packages/strucchange")
    (synopsis "Testing, monitoring, and dating structural changes")
    (description
     "This package provides tools for testing, monitoring and dating
structural changes in (linear) regression models.  It features tests/methods
from the generalized fluctuation test framework as well as from the F
test (Chow test) framework.  This includes methods to fit, plot and test
fluctuation processes (e.g., CUSUM, MOSUM, recursive/moving estimates) and F
statistics, respectively.  It is possible to monitor incoming data online
using fluctuation processes.  Finally, the breakpoints in regression models
with structural changes can be estimated together with confidence intervals.
Emphasis is always given to methods for visualizing the data.")
    ;; Either of these two GPL versions
    (license (list license:gpl2 license:gpl3))))

(define-public r-pixmap
  (package
    (name "r-pixmap")
    (version "0.4-11")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "pixmap" version))
       (sha256
        (base32
         "04klxp6jndw1bp6z40v20fbmdmdpfca2g0czmmmgbkark9s1183g"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/pixmap")
    (synopsis "Tools for bitmap images")
    (description
     "This package provides functions for importing, exporting, plotting and
other manipulations of bitmapped images.")
    (license license:gpl2)))

(define-public r-rapidjsonr
  (package
    (name "r-rapidjsonr")
    (version "1.1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rapidjsonr" version))
       (sha256
        (base32
         "0h4phjjhykbb45rg5b1xn48vqxdcvcngbm0416ds8in7j469wbwd"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rapidjsonr")
    (synopsis "JSON parser")
    (description
     "This package provides JSON parsing capability through the Rapidjson
library.")
    (license license:expat)))

(define-public r-ontologyindex
  (package
    (name "r-ontologyindex")
    (version "2.4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "ontologyIndex" version))
       (sha256
        (base32
         "168m4jdwbzv8lpimx9063306691hnfdjmdhb5y8195d9vcq049jr"))))
    (properties `((upstream-name . "ontologyIndex")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/ontologyIndex")
    (synopsis "Functions for processing ontologies in R")
    (description
     "This package provides functions for reading ontologies into R as lists
and manipulating sets of ontological terms.")
    (license license:gpl2+)))

(define-public r-bigrquery
  (package
    (name "r-bigrquery")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bigrquery" version))
       (sha256
        (base32
         "0z7wsqxla1pg2454l35kkfaz2s9hppwvpz1pds286ddldbbmyzis"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertthat" ,r-assertthat)
       ("r-curl" ,r-curl)
       ("r-dbi" ,r-dbi)
       ("r-glue" ,r-glue)
       ("r-httr" ,r-httr)
       ("r-jsonlite" ,r-jsonlite)
       ("r-prettyunits" ,r-prettyunits)
       ("r-progress" ,r-progress)
       ("r-rapidjsonr" ,r-rapidjsonr)
       ("r-rcpp" ,r-rcpp)
       ("r-tibble" ,r-tibble)))
    (home-page "https://github.com/rstats-db/bigrquery")
    (synopsis "R interface to Google's BigQuery API")
    (description
     "This package provides an R interface to Google's BigQuery database.")
    (license license:gpl3)))

(define-public r-gmp
  (package
    (name "r-gmp")
    (version "0.5-13.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gmp" version))
       (sha256
        (base32
         "1xd6jjra4niqv1kps91y348lwgvy73p2faxaia4gfzdnrpw7wsxf"))))
    (build-system r-build-system)
    (arguments
     '(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'set-CC
           (lambda _ (setenv "CC" "gcc") #t)))))
    (inputs `(("gmp" ,gmp)))
    (home-page "https://cran.r-project.org/web/packages/gmp")
    (synopsis "Multiple precision arithmetic")
    (description
     "This package supports multiple precision arithmetic (big integers and
rationals, prime number tests, matrix computation), \"arithmetic without
limitations\" using the GNU Multiple Precision library.")
    ;; Any version of the GPL.
    (license license:gpl3+)))

(define-public r-rmpfr
  (package
    (name "r-rmpfr")
    (version "0.7-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "Rmpfr" version))
       (sha256
        (base32
         "0172px5ryi7i0gyyin9z2bzif8vnj292gk0s1w5p3c12g9hj2c4v"))))
    (properties `((upstream-name . "Rmpfr")))
    (build-system r-build-system)
    (inputs
     `(("mpfr" ,mpfr)))
    (propagated-inputs
     `(("r-gmp" ,r-gmp)))
    (home-page "http://rmpfr.r-forge.r-project.org/")
    (synopsis "R bindings to the MPFR library")
    (description
     "This package supports arithmetic (via S4 classes and methods) for
arbitrary precision floating point numbers, including transcendental
functions.  To this end, the package interfaces with the @dfn{Multiple
Precision Floating-Point Reliable} (MPFR) library.")
    (license license:gpl2+)))

(define-public r-assertive-base
  (package
    (name "r-assertive-base")
    (version "0.0-7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.base" version))
       (sha256
        (base32
         "1xs3ysvj0z57c58jw57pckq2rynia6ks4rmjmc02alczhk54wbgh"))))
    (properties
     `((upstream-name . "assertive.base")))
    (build-system r-build-system)
    (home-page "https://bitbucket.org/richierocks/assertive.base")
    (synopsis "Core of the assertive package")
    (description
     "This package provides a minimal set of predicates and assertions used by
the assertive package.  This is mainly for use by other package developers who
want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-properties
  (package
    (name "r-assertive-properties")
    (version "0.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.properties" version))
       (sha256
        (base32
         "0sqs54acs9qk9kvm32rxzfbzxz1l8mjahpfnw7r30z2brgz661jw"))))
    (properties
     `((upstream-name . "assertive.properties")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.properties")
    (synopsis "Assertions to check properties of variables")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of variables, such as length, names and attributes.  This is
mainly for use by other package developers who want to include run-time
testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-numbers
  (package
    (name "r-assertive-numbers")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.numbers" version))
       (sha256
        (base32
         "0jc3ss64j4m7bjydhagwwmka5n7c72vpw4kfcch0m5jvkq5qrqds"))))
    (properties
     `((upstream-name . "assertive.numbers")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.numbers")
    (synopsis "Assertions to check properties of numbers")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of numbers.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-sets
  (package
    (name "r-assertive-sets")
    (version "0.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.sets" version))
       (sha256
        (base32
         "1cqvh2syvh5b6d85h601zjmsdbbf3h8q98ids4dfl4frdshpasc7"))))
    (properties
     `((upstream-name . "assertive.sets")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.sets")
    (synopsis "Assertions to check properties of sets")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of sets.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-matrices
  (package
    (name "r-assertive-matrices")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.matrices" version))
       (sha256
        (base32
         "16sykzcndv6y2d43x6v9n7m95kv76364h39kh10w4z0xw6ksfqil"))))
    (properties
     `((upstream-name . "assertive.matrices")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.matrices")
    (synopsis "Assertions to check properties of matrices")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of matrices.  This is mainly for use by other package
developers who want to include run-time testing features in their own
packages.")
    (license license:gpl3+)))

(define-public r-assertive-models
  (package
    (name "r-assertive-models")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.models" version))
       (sha256
        (base32
         "0bn4j4v5qvb2d672cgri61p8d9v258pmz35y3lvm6b9mdxwdi9mr"))))
    (properties
     `((upstream-name . "assertive.models")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.models")
    (synopsis "Assertions to check properties of models")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of models.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-reflection
  (package
    (name "r-assertive-reflection")
    (version "0.0-4")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.reflection" version))
       (sha256
        (base32
         "19zmsbn00crfqm0kwd9ys5gv87xs3gi6wmlikrz9xiwzm7hp4dhj"))))
    (properties
     `((upstream-name . "assertive.reflection")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)))
    (home-page "https://bitbucket.org/richierocks/assertive.reflection")
    (synopsis "Assertions for checking the state of R")
    (description
     "This package provides a set of predicates and assertions for checking
the state and capabilities of R, the operating system it is running on, and
the IDE being used.  This is mainly for use by other package developers who
want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-types
  (package
    (name "r-assertive-types")
    (version "0.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.types" version))
       (sha256
        (base32
         "0zxq1jfrzgw95ll7alvm0xnk7aihjdksngq4ya2whyvfjbmv4vdb"))))
    (properties
     `((upstream-name . "assertive.types")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-properties" ,r-assertive-properties)
       ("r-codetools" ,r-codetools)))
    (home-page "https://bitbucket.org/richierocks/assertive.types")
    (synopsis "Assertions to check types of variables")
    (description
     "This package provides a set of predicates and assertions for checking
the types of variables.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-files
  (package
    (name "r-assertive-files")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.files" version))
       (sha256
        (base32
         "02pfz8j5vwcj5kl6zca46894li7lxwnlrr29j922f14ay6kdssmy"))))
    (properties
     `((upstream-name . "assertive.files")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-numbers" ,r-assertive-numbers)))
    (home-page "https://bitbucket.org/richierocks/assertive.files")
    (synopsis "Assertions to check properties of files")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of files and connections.  This is mainly for use by other
package developers who want to include run-time testing features in their own
packages.")
    (license license:gpl3+)))

(define-public r-assertive-code
  (package
    (name "r-assertive-code")
    (version "0.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.code" version))
       (sha256
        (base32
         "1qhbp668zfvhqs8avkhg9amp4zyazz6dsy4fc6kpdmw3sv8yi07g"))))
    (properties
     `((upstream-name . "assertive.code")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-properties" ,r-assertive-properties)
       ("r-assertive-types" ,r-assertive-types)))
    (home-page "https://bitbucket.org/richierocks/assertive.code")
    (synopsis "Assertions to check properties of code")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of code.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-datetimes
  (package
    (name "r-assertive-datetimes")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.datetimes" version))
       (sha256
        (base32
         "00a98fx8p3pr3ckayh8wmxmm4rz01s67wah9697m92yci6pv3m78"))))
    (properties
     `((upstream-name . "assertive.datetimes")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-types" ,r-assertive-types)))
    (home-page "https://bitbucket.org/richierocks/assertive.datetimes")
    (synopsis "Assertions to check properties of dates and times")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of dates and times.  This is mainly for use by other package
developers who want to include run-time testing features in their own
packages.")
    (license license:gpl3+)))

(define-public r-assertive-strings
  (package
    (name "r-assertive-strings")
    (version "0.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.strings" version))
       (sha256
        (base32
         "0n6jrk88670g4ym0r8ii40a08a90z1xadj8wcryk8h0nl04dchfm"))))
    (properties
     `((upstream-name . "assertive.strings")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-types" ,r-assertive-types)
       ("r-stringi" ,r-stringi)))
    (home-page "https://bitbucket.org/richierocks/assertive.strings")
    (synopsis "Assertions to check properties of strings")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of strings.  This is mainly for use by other package developers
who want to include run-time testing features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-data-us
  (package
    (name "r-assertive-data-us")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.data.us" version))
       (sha256
        (base32
         "1bgspn0sccmp9z7s7djvdvprgxlyc5vrxznp4zfjb79kwvgn83hq"))))
    (properties
     `((upstream-name . "assertive.data.us")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-strings" ,r-assertive-strings)))
    (home-page "https://bitbucket.org/richierocks/assertive.data.us")
    (synopsis "Assertions to check properties of strings")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of US-specific complex data types.  This is mainly for use by
other package developers who want to include run-time testing features in
their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-data-uk
  (package
    (name "r-assertive-data-uk")
    (version "0.0-2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.data.uk" version))
       (sha256
        (base32
         "1fzjvhwp7mwkqqix29khvs6zcrc82n6j4czvzzb473vyjyvdlj5b"))))
    (properties
     `((upstream-name . "assertive.data.uk")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-strings" ,r-assertive-strings)))
    (home-page "https://bitbucket.org/richierocks/assertive.data.uk")
    (synopsis "Assertions to check properties of strings")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of UK-specific complex data types.  This is mainly for use by
other package developers who want to include run-time testing features in
their own packages.")
    (license license:gpl3+)))

(define-public r-assertive-data
  (package
    (name "r-assertive-data")
    (version "0.0-3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive.data" version))
       (sha256
        (base32
         "00cvg2g36mdl8plrzx40m63qd55742mddqrchwy9n3c7mm4gn02s"))))
    (properties
     `((upstream-name . "assertive.data")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-strings" ,r-assertive-strings)))
    (home-page "https://bitbucket.org/richierocks/assertive.data")
    (synopsis "Assertions to check properties of data")
    (description
     "This package provides a set of predicates and assertions for checking
the properties of (country independent) complex data types.  This is mainly
for use by other package developers who want to include run-time testing
features in their own packages.")
    (license license:gpl3+)))

(define-public r-assertive
  (package
    (name "r-assertive")
    (version "0.3-5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "assertive" version))
       (sha256
        (base32
         "0blbbhlxcb5ffdxqxi62xs33ljiawh6s22a0pyvbbh79jf46rzr3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-assertive-base" ,r-assertive-base)
       ("r-assertive-code" ,r-assertive-code)
       ("r-assertive-data" ,r-assertive-data)
       ("r-assertive-data-uk" ,r-assertive-data-uk)
       ("r-assertive-data-us" ,r-assertive-data-us)
       ("r-assertive-datetimes" ,r-assertive-datetimes)
       ("r-assertive-files" ,r-assertive-files)
       ("r-assertive-matrices" ,r-assertive-matrices)
       ("r-assertive-models" ,r-assertive-models)
       ("r-assertive-numbers" ,r-assertive-numbers)
       ("r-assertive-properties" ,r-assertive-properties)
       ("r-assertive-reflection" ,r-assertive-reflection)
       ("r-assertive-sets" ,r-assertive-sets)
       ("r-assertive-strings" ,r-assertive-strings)
       ("r-assertive-types" ,r-assertive-types)
       ("r-knitr" ,r-knitr)))
    (home-page "https://bitbucket.org/richierocks/assertive")
    (synopsis "Readable check functions to ensure code integrity")
    (description
     "This package provides lots of predicates (@code{is_*} functions) to
check the state of your variables, and assertions (@code{assert_*} functions)
to throw errors if they aren't in the right form.")
    (license license:gpl3+)))

(define-public r-dotcall64
  (package
    (name "r-dotcall64")
    (version "1.0-0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "dotCall64" version))
       (sha256
        (base32
         "1b8p7m3w0m7bp977c6jz74xkd611cxg11j49yza59k5fp338scb9"))))
    (properties `((upstream-name . "dotCall64")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://git.math.uzh.ch/reinhard.furrer/dotCall64")
    (synopsis "Enhanced foreign function interface supporting long vectors")
    (description
     "This package provides @code{.C64()}, an enhanced version of @code{.C()}
and @code{.Fortran()} from the R foreign function interface.  @code{.C64()}
supports long vectors, arguments of type 64-bit integer, and provides a
mechanism to avoid unnecessary copies of read-only and write-only arguments.
This makes it a convenient and fast interface to C/C++ and Fortran code.")
    (license license:gpl2+)))

(define-public r-spam
  (package
    (name "r-spam")
    (version "2.2-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "spam" version))
       (sha256
        (base32
         "04bfwwna013hrbl4k6w1cdiz5bkc83jlasivriyn5l9gkj2qskr2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dotcall64" ,r-dotcall64)))
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://www.math.uzh.ch/pages/spam/")
    (synopsis "Sparse matrix algebra")
    (description
     "This package provides a set of functions for sparse matrix algebra.
Differences with other sparse matrix packages are:

@enumerate
@item it only supports (essentially) one sparse matrix format;
@item it is based on transparent and simple structure(s);
@item it is tailored for MCMC calculations within G(M)RF;
@item and it is fast and scalable (with the extension package @code{spam64}).
@end enumerate\n")
    ;; Either of these licenses
    (license (list license:bsd-3 license:lgpl2.0))))

(define-public r-fields
  (package
    (name "r-fields")
    (version "9.6")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "fields" version))
       (sha256
        (base32
         "1v7z48a8jmdcil28rj8c3455k6rssr5v9qi6dyhhpbb193bj8121"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-maps" ,r-maps)
       ("r-spam" ,r-spam)))
    (native-inputs
     `(("gfortran" ,gfortran)))
    (home-page "http://www.image.ucar.edu/fields")
    (synopsis "Tools for spatial data")
    (description
     "This is a package for curve, surface and function fitting with an
emphasis on splines, spatial data and spatial statistics.  The major methods
include cubic, and thin plate splines, Kriging, and compactly supported
covariance functions for large data sets.")
    (license license:gpl2+)))

(define-public r-spatialextremes
  (package
    (name "r-spatialextremes")
    (version "2.0-7")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "SpatialExtremes" version))
       (sha256
        (base32
         "1y0h1pcfqp9ynxsr3yrfbihlwm25ypyb88jmm5k2g7xvm8h9g050"))))
    (properties
     `((upstream-name . "SpatialExtremes")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-fields" ,r-fields)
       ("r-maps" ,r-maps)))
    (home-page "http://spatialextremes.r-forge.r-project.org/")
    (synopsis "Modelling spatial extremes")
    (description
     "This package provides tools for the statistical modelling of spatial
extremes using max-stable processes, copula or Bayesian hierarchical models.
More precisely, this package allows (conditional) simulations from various
parametric max-stable models, analysis of the extremal spatial dependence, the
fitting of such processes using composite likelihoods or least square (simple
max-stable processes only), model checking and selection and prediction.")
    (license license:gpl2+)))

(define-public r-drc
  (package
    (name "r-drc")
    (version "3.0-1")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "drc" version))
       (sha256
        (base32
         "0c8xn8ripzq270hy8d16fcnx02l02alddznd7fqwk3jyi6113h1y"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-car" ,r-car)
       ("r-gtools" ,r-gtools)
       ("r-mass" ,r-mass)
       ("r-multcomp" ,r-multcomp)
       ("r-plotrix" ,r-plotrix)
       ("r-scales" ,r-scales)))
    (home-page "https://cran.r-project.org/web/packages/drc")
    (synopsis "Analysis of dose-response curves")
    (description
     "This package provides a suite of flexible and versatile model fitting
and after-fitting functions for the analysis of dose-response data.")
    (license license:gpl2+)))

(define-public r-rmeta
  (package
    (name "r-rmeta")
    (version "3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "rmeta" version))
       (sha256
        (base32
         "0vkbnxp579v8zmcv1isdbzj5swpr6fq17zwparxcvzswjc2x9ydr"))))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/rmeta")
    (synopsis "Tools for meta-analysis")
    (description
     "This package provides functions for simple fixed and random effects
meta-analysis for two-sample comparisons and cumulative meta-analyses.  It
draws standard summary plots, funnel plots, and computes summaries and tests
for association and heterogeneity.")
    (license license:gpl2)))

(define-public r-bootstrap
  (package
    (name "r-bootstrap")
    (version "2017.2")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "bootstrap" version))
       (sha256
        (base32
         "08lmsy7k8wsgv89yc904c6fidcymr1ma2ry4fl0p69p21v4iiwa4"))))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://cran.r-project.org/web/packages/bootstrap")
    (synopsis "Functions for the book \"An Introduction to the Bootstrap\"")
    (description
     "This package provides software and data for the book \"An Introduction
to the Bootstrap\" by B. Efron and R. Tibshirani, 1993, Chapman and Hall.
This package is primarily provided for projects already based on it, and for
support of the book.  New projects should preferentially use the recommended
package \"boot\".")
    (license license:bsd-3)))

(define-public r-survivalroc
  (package
    (name "r-survivalroc")
    (version "1.0.3")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "survivalROC" version))
       (sha256
        (base32
         "0wnd65ff5w679hxa1zrpfrx9qg47q21pjxppsga6m3h4iq1yfj8l"))))
    (properties `((upstream-name . "survivalROC")))
    (build-system r-build-system)
    (home-page "https://cran.r-project.org/web/packages/survivalROC")
    (synopsis "Time-dependent ROC curve estimation from censored survival data")
    (description
     "Compute time-dependent ROC curve from censored survival data using
Kaplan-Meier (KM) or Nearest Neighbor Estimation (NNE) method of Heagerty,
Lumley & Pepe (Biometrics, Vol 56 No 2, 2000, PP 337-344)")
    (license license:gpl2+)))

(define-public r-longitudinal
  (package
    (name "r-longitudinal")
    (version "1.1.12")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "longitudinal" version))
       (sha256
        (base32
         "1d83ws28nxi3kw5lgd5n5y7865djq7ky72fw3ddi1fkkhg1r9y6l"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-corpcor" ,r-corpcor)))
    (home-page "http://strimmerlab.org/software/longitudinal/")
    (synopsis "Analysis of multiple time course data")
    (description
     "This package contains general data structures and functions for
longitudinal data with multiple variables, repeated measurements, and
irregularly spaced time points.  It also implements a shrinkage estimator of
dynamical correlation and dynamical covariance.")
    (license license:gpl3+)))
