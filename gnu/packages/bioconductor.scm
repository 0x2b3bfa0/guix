;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016, 2017, 2018, 2019 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2016, 2017, 2018 Roel Janssen <roel@gnu.org>
;;; Copyright © 2017, 2018 Tobias Geerinckx-Rice <me@tobias.gr>
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

(define-module (gnu packages bioconductor)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system r)
  #:use-module (gnu packages)
  #:use-module (gnu packages bioinformatics)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages graph)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages statistics)
  #:use-module (gnu packages web))


;;; Annotations

(define-public r-bsgenome-celegans-ucsc-ce6
  (package
    (name "r-bsgenome-celegans-ucsc-ce6")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Celegans.UCSC.ce6_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0mqzb353xv2c3m3vkb315dkmnxkgczp7ndnknyhpgjlybyf715v9"))))
    (properties
     `((upstream-name . "BSgenome.Celegans.UCSC.ce6")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Celegans.UCSC.ce6/")
    (synopsis "Full genome sequences for Worm")
    (description
     "This package provides full genome sequences for Caenorhabditis
elegans (Worm) as provided by UCSC (ce6, May 2008) and stored in Biostrings
objects.")
    (license license:artistic2.0)))

(define-public r-bsgenome-celegans-ucsc-ce10
  (package
    (name "r-bsgenome-celegans-ucsc-ce10")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Celegans.UCSC.ce10_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1zaym97jk4npxk14ifvwz2rvhm4zx9xgs33r9vvx9rlynp0gydrk"))))
    (properties
     `((upstream-name . "BSgenome.Celegans.UCSC.ce10")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Celegans.UCSC.ce10/")
    (synopsis "Full genome sequences for Worm")
    (description
     "This package provides full genome sequences for Caenorhabditis
elegans (Worm) as provided by UCSC (ce10, Oct 2010) and stored in Biostrings
objects.")
    (license license:artistic2.0)))

(define-public r-bsgenome-dmelanogaster-ucsc-dm6
  (package
    (name "r-bsgenome-dmelanogaster-ucsc-dm6")
    (version "1.4.1")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Dmelanogaster.UCSC.dm6_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1bhj0rdgf7lspw4xby9y9mf7v7jxxz8001bc8vw8kf04rjsx6060"))))
    (properties
     `((upstream-name . "BSgenome.Dmelanogaster.UCSC.dm6")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Dmelanogaster.UCSC.dm6/")
    (synopsis "Full genome sequences for Fly")
    (description
     "This package provides full genome sequences for Drosophila
melanogaster (Fly) as provided by UCSC (dm6) and stored in Biostrings
objects.")
    (license license:artistic2.0)))

(define-public r-bsgenome-dmelanogaster-ucsc-dm3
  (package
    (name "r-bsgenome-dmelanogaster-ucsc-dm3")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Dmelanogaster.UCSC.dm3_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "19bm3lkhhkag3gnwp419211fh0cnr0x6fa0r1lr0ycwrikxdxsv8"))))
    (properties
     `((upstream-name . "BSgenome.Dmelanogaster.UCSC.dm3")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Dmelanogaster.UCSC.dm3/")
    (synopsis "Full genome sequences for Fly")
    (description
     "This package provides full genome sequences for Drosophila
melanogaster (Fly) as provided by UCSC (dm3, April 2006) and stored in
Biostrings objects.")
    (license license:artistic2.0)))

(define-public r-bsgenome-dmelanogaster-ucsc-dm3-masked
  (package
    (name "r-bsgenome-dmelanogaster-ucsc-dm3-masked")
    (version "1.3.99")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "http://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Dmelanogaster.UCSC.dm3.masked_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1756csb09f1br9rj1l3f08qyh4hlymdbd0cfn8x3fq39dn45m5ap"))))
    (properties
     `((upstream-name . "BSgenome.Dmelanogaster.UCSC.dm3.masked")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)
       ("r-bsgenome-dmelanogaster-ucsc-dm3"
        ,r-bsgenome-dmelanogaster-ucsc-dm3)))
    (home-page "https://www.bioconductor.org/packages/BSgenome.Dmelanogaster.UCSC.dm3.masked/")
    (synopsis "Full masked genome sequences for Fly")
    (description
     "This package provides full masked genome sequences for Drosophila
melanogaster (Fly) as provided by UCSC (dm3, April 2006) and stored in
Biostrings objects.  The sequences are the same as in
BSgenome.Dmelanogaster.UCSC.dm3, except that each of them has the 4 following
masks on top: (1) the mask of assembly gaps (AGAPS mask), (2) the mask of
intra-contig ambiguities (AMB mask), (3) the mask of repeats from
RepeatMasker (RM mask), and (4) the mask of repeats from Tandem Repeats
Finder (TRF mask).  Only the AGAPS and AMB masks are \"active\" by default.")
    (license license:artistic2.0)))

(define-public r-bsgenome-hsapiens-1000genomes-hs37d5
  (package
    (name "r-bsgenome-hsapiens-1000genomes-hs37d5")
    (version "0.99.1")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Hsapiens.1000genomes.hs37d5_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1cg0g5fqmsvwyw2p9hp2yy4ilk21jkbbrnpgqvb5c36ihjwvc7sr"))))
    (properties
     `((upstream-name . "BSgenome.Hsapiens.1000genomes.hs37d5")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Hsapiens.1000genomes.hs37d5/")
    (synopsis "Full genome sequences for Homo sapiens")
    (description
     "This package provides full genome sequences for Homo sapiens from
1000genomes phase2 reference genome sequence (hs37d5), based on NCBI GRCh37.")
    (license license:artistic2.0)))

(define-public r-bsgenome-hsapiens-ucsc-hg19-masked
  (package
    (name "r-bsgenome-hsapiens-ucsc-hg19-masked")
    (version "1.3.99")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "http://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Hsapiens.UCSC.hg19.masked_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0452pyah0kv1vsrsjbrqw4k2rm8lc2vc771dzib45gnnfz86qxrr"))))
    (properties
     `((upstream-name . "BSgenome.Hsapiens.UCSC.hg19.masked")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)
       ("r-bsgenome-hsapiens-ucsc-hg19"
        ,r-bsgenome-hsapiens-ucsc-hg19)))
    (home-page "https://bioconductor.org/packages/BSgenome.Hsapiens.UCSC.hg19.masked/")
    (synopsis "Full masked genome sequences for Homo sapiens")
    (description
     "This package provides full genome sequences for Homo sapiens (Human) as
provided by UCSC (hg19, Feb. 2009) and stored in Biostrings objects.  The
sequences are the same as in BSgenome.Hsapiens.UCSC.hg19, except that each of
them has the 4 following masks on top: (1) the mask of assembly gaps (AGAPS
mask), (2) the mask of intra-contig ambiguities (AMB mask), (3) the mask of
repeats from RepeatMasker (RM mask), and (4) the mask of repeats from Tandem
Repeats Finder (TRF mask).  Only the AGAPS and AMB masks are \"active\" by
default.")
    (license license:artistic2.0)))

(define-public r-bsgenome-mmusculus-ucsc-mm9
  (package
    (name "r-bsgenome-mmusculus-ucsc-mm9")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Mmusculus.UCSC.mm9_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1birqw30g2azimxpnjfzmkphan7x131yy8b9h85lfz5fjdg7841i"))))
    (properties
     `((upstream-name . "BSgenome.Mmusculus.UCSC.mm9")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Mmusculus.UCSC.mm9/")
    (synopsis "Full genome sequences for Mouse")
    (description
     "This package provides full genome sequences for Mus musculus (Mouse) as
provided by UCSC (mm9, July 2007) and stored in Biostrings objects.")
    (license license:artistic2.0)))

(define-public r-bsgenome-mmusculus-ucsc-mm9-masked
  (package
    (name "r-bsgenome-mmusculus-ucsc-mm9-masked")
    (version "1.3.99")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "http://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Mmusculus.UCSC.mm9.masked_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "00bpbm3havqcxr4g63zhllsbpd9q6svgihks7qp7x73nm4gvq7fn"))))
    (properties
     `((upstream-name . "BSgenome.Mmusculus.UCSC.mm9.masked")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)
       ("r-bsgenome-mmusculus-ucsc-mm9"
        ,r-bsgenome-mmusculus-ucsc-mm9)))
    (home-page "http://bioconductor.org/packages/BSgenome.Mmusculus.UCSC.mm9.masked/")
    (synopsis "Full masked genome sequences for Mouse")
    (description
     "This package provides full genome sequences for Mus musculus (Mouse) as
provided by UCSC (mm9, Jul. 2007) and stored in Biostrings objects.  The
sequences are the same as in BSgenome.Mmusculus.UCSC.mm9, except that each of
them has the 4 following masks on top: (1) the mask of assembly gaps (AGAPS
mask), (2) the mask of intra-contig ambiguities (AMB mask), (3) the mask of
repeats from RepeatMasker (RM mask), and (4) the mask of repeats from Tandem
Repeats Finder (TRF mask).  Only the AGAPS and AMB masks are \"active\" by
default."  )
    (license license:artistic2.0)))

(define-public r-bsgenome-mmusculus-ucsc-mm10
  (package
    (name "r-bsgenome-mmusculus-ucsc-mm10")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Mmusculus.UCSC.mm10_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "12s0nm2na9brjad4rn9l7d3db2aj8qa1xvz0y1k7gk08wayb6bkf"))))
    (properties
     `((upstream-name . "BSgenome.Mmusculus.UCSC.mm10")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Mmusculus.UCSC.mm10/")
    (synopsis "Full genome sequences for Mouse")
    (description
     "This package provides full genome sequences for Mus
musculus (Mouse) as provided by UCSC (mm10, December 2011) and stored
in Biostrings objects.")
    (license license:artistic2.0)))

(define-public r-org-ce-eg-db
  (package
    (name "r-org-ce-eg-db")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "org.Ce.eg.db_" version ".tar.gz"))
              (sha256
               (base32
                "1w5br1ss4ha8wv4v2saj7cmbjc2jw0dyj2f2y269l078z31wcnaz"))))
    (properties
     `((upstream-name . "org.Ce.eg.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/org.Ce.eg.db/")
    (synopsis "Genome wide annotation for Worm")
    (description
     "This package provides mappings from Entrez gene identifiers to various
annotations for the genome of the model worm Caenorhabditis elegans.")
    (license license:artistic2.0)))

(define-public r-org-dm-eg-db
  (package
    (name "r-org-dm-eg-db")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "org.Dm.eg.db_" version ".tar.gz"))
              (sha256
               (base32
                "1pqjrzlyg72bjpy8zsxvaglc7jsv176bnyi87xdajmkvsgxpm7b3"))))
    (properties
     `((upstream-name . "org.Dm.eg.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/org.Dm.eg.db/")
    (synopsis "Genome wide annotation for Fly")
    (description
     "This package provides mappings from Entrez gene identifiers to various
annotations for the genome of the model fruit fly Drosophila melanogaster.")
    (license license:artistic2.0)))

(define-public r-org-dr-eg-db
  (package
    (name "r-org-dr-eg-db")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "org.Dr.eg.db_" version ".tar.gz"))
              (sha256
               (base32
                "1xs5wsbcpy0iwbjyiv7fax57djqc529ai5fk1qfsdcvlja3cpglx"))))
    (properties
     `((upstream-name . "org.Dr.eg.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/org.Dr.eg.db/")
    (synopsis "Annotation for Zebrafish")
    (description
     "This package provides genome wide annotations for Zebrafish, primarily
based on mapping using Entrez Gene identifiers.")
    (license license:artistic2.0)))

(define-public r-org-hs-eg-db
  (package
    (name "r-org-hs-eg-db")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "org.Hs.eg.db_" version ".tar.gz"))
              (sha256
               (base32
                "1qxz9l80yg3qdqszs6dsscp7lrpfi1bgd0pxh9j7q34vprzwhdim"))))
    (properties
     `((upstream-name . "org.Hs.eg.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/org.Hs.eg.db/")
    (synopsis "Genome wide annotation for Human")
    (description
     "This package contains genome-wide annotations for Human, primarily based
on mapping using Entrez Gene identifiers.")
    (license license:artistic2.0)))

(define-public r-org-mm-eg-db
  (package
    (name "r-org-mm-eg-db")
    (version "3.7.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "org.Mm.eg.db_" version ".tar.gz"))
              (sha256
               (base32
                "1i3nvrd3wjigf1rmgxq1p5xxc3p8v02h5gwi62s30rkrsyjjfjxx"))))
    (properties
     `((upstream-name . "org.Mm.eg.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/org.Mm.eg.db/")
    (synopsis "Genome wide annotation for Mouse")
    (description
     "This package provides mappings from Entrez gene identifiers to various
annotations for the genome of the model mouse Mus musculus.")
    (license license:artistic2.0)))

(define-public r-bsgenome-hsapiens-ucsc-hg19
  (package
    (name "r-bsgenome-hsapiens-ucsc-hg19")
    (version "1.4.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "BSgenome.Hsapiens.UCSC.hg19_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1y0nqpk8cw5a34sd9hmin3z4v7iqm6hf6l22cl81vlbxqbjibxc8"))))
    (properties
     `((upstream-name . "BSgenome.Hsapiens.UCSC.hg19")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)))
    (home-page
     "https://www.bioconductor.org/packages/BSgenome.Hsapiens.UCSC.hg19/")
    (synopsis "Full genome sequences for Homo sapiens")
    (description
     "This package provides full genome sequences for Homo sapiens as provided
by UCSC (hg19, February 2009) and stored in Biostrings objects.")
    (license license:artistic2.0)))

(define-public r-genelendatabase
  (package
    (name "r-genelendatabase")
    (version "1.18.0")
    (source
     (origin
       (method url-fetch)
       ;; We cannot use bioconductor-uri here because this tarball is
       ;; located under "data/experiment/" instead of "bioc/".
       (uri (string-append "https://bioconductor.org/packages/"
                           "release/data/experiment/src/contrib"
                           "/geneLenDataBase_" version ".tar.gz"))
       (sha256
        (base32
         "03gm4pvsfascx7kjg0jycpf4f572mja68wwmwigs390vbmawyb4a"))))
    (properties
     `((upstream-name . "geneLenDataBase")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rtracklayer" ,r-rtracklayer)
       ("r-genomicfeatures" ,r-genomicfeatures)))
    (home-page "https://bioconductor.org/packages/geneLenDataBase/")
    (synopsis "Lengths of mRNA transcripts for a number of genomes")
    (description
     "This package provides the lengths of mRNA transcripts for a number of
genomes and gene ID formats, largely based on the UCSC table browser.")
    (license license:lgpl2.0+)))

(define-public r-txdb-hsapiens-ucsc-hg19-knowngene
  (package
    (name "r-txdb-hsapiens-ucsc-hg19-knowngene")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib"
                                  "/TxDb.Hsapiens.UCSC.hg19.knownGene_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "1sajhcqqwazgz2lqbik7rd935i7kpnh08zxbp2ra10j72yqy4g86"))))
    (properties
     `((upstream-name . "TxDb.Hsapiens.UCSC.hg19.knownGene")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-genomicfeatures" ,r-genomicfeatures)))
    (home-page
     "https://bioconductor.org/packages/TxDb.Hsapiens.UCSC.hg19.knownGene/")
    (synopsis "Annotation package for human genome in TxDb format")
    (description
     "This package provides an annotation database of Homo sapiens genome
data.  It is derived from the UCSC hg19 genome and based on the \"knownGene\"
track.  The database is exposed as a @code{TxDb} object.")
    (license license:artistic2.0)))

(define-public r-txdb-mmusculus-ucsc-mm9-knowngene
  (package
    (name "r-txdb-mmusculus-ucsc-mm9-knowngene")
    (version "3.2.2")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib"
                                  "/TxDb.Mmusculus.UCSC.mm9.knownGene_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "16bjxy00363hf91ik2mqlqls86i07gia72qh92xc3l1ncch61mx2"))))
    (properties
     `((upstream-name . "TxDb.Mmusculus.UCSC.mm9.knownGene")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-genomicfeatures" ,r-genomicfeatures)
       ("r-annotationdbi" ,r-annotationdbi)))
    (home-page
     "https://bioconductor.org/packages/TxDb.Mmusculus.UCSC.mm9.knownGene/")
    (synopsis "Annotation package for mouse genome in TxDb format")
    (description
     "This package provides an annotation database of Mouse genome data.  It
is derived from the UCSC mm9 genome and based on the \"knownGene\" track.  The
database is exposed as a @code{TxDb} object.")
    (license license:artistic2.0)))

(define-public r-txdb-mmusculus-ucsc-mm10-knowngene
  (package
    (name "r-txdb-mmusculus-ucsc-mm10-knowngene")
    (version "3.4.4")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "TxDb.Mmusculus.UCSC.mm10.knownGene_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "01lgxc1fx5nhlpbwjd5zqghkkbmh6axd98ikx4b0spv0jdg6gf39"))))
    (properties
     `((upstream-name . "TxDb.Mmusculus.UCSC.mm10.knownGene")))
    (build-system r-build-system)
    ;; As this package provides little more than a very large data file it
    ;; doesn't make sense to build substitutes.
    (arguments `(#:substitutable? #f))
    (propagated-inputs
     `(("r-bsgenome" ,r-bsgenome)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-annotationdbi" ,r-annotationdbi)))
    (home-page
     "https://bioconductor.org/packages/TxDb.Mmusculus.UCSC.mm10.knownGene/")
    (synopsis "Annotation package for TxDb knownGene object(s) for Mouse")
    (description
     "This package loads a TxDb object, which is an R interface to
prefabricated databases contained in this package.  This package provides
the TxDb object of Mouse data as provided by UCSC (mm10, December 2011)
based on the knownGene track.")
    (license license:artistic2.0)))

(define-public r-fdb-infiniummethylation-hg19
  (package
    (name "r-fdb-infiniummethylation-hg19")
    (version "2.2.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "FDb.InfiniumMethylation.hg19_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0gq90fvph6kgrpjb89nvzq6hl1k24swn19rgjh5g98l86mja6nk0"))))
    (properties
     `((upstream-name . "FDb.InfiniumMethylation.hg19")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biostrings" ,r-biostrings)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-org-hs-eg-db" ,r-org-hs-eg-db)
       ("r-txdb-hsapiens-ucsc-hg19-knowngene" ,r-txdb-hsapiens-ucsc-hg19-knowngene)))
    (home-page "https://bioconductor.org/packages/FDb.InfiniumMethylation.hg19/")
    (synopsis "Compiled HumanMethylation27 and HumanMethylation450 annotations")
    (description
     "This is an annotation package for Illumina Infinium DNA methylation
probes.  It contains the compiled HumanMethylation27 and HumanMethylation450
annotations.")
    (license license:artistic2.0)))

(define-public r-illuminahumanmethylationepicmanifest
  (package
    (name "r-illuminahumanmethylationepicmanifest")
    (version "0.3.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "IlluminaHumanMethylationEPICmanifest_"
                                  version ".tar.gz"))
              (sha256
               (base32
                "0alhjda5g186z8b1nsmnpfswrlj7prdz8mkwx60wkkl6hkcnk6p3"))))
    (properties
     `((upstream-name . "IlluminaHumanMethylationEPICmanifest")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-minfi" ,r-minfi)))
    (home-page "https://bioconductor.org/packages/IlluminaHumanMethylationEPICmanifest/")
    (synopsis "Manifest for Illumina's EPIC methylation arrays")
    (description
     "This is a manifest package for Illumina's EPIC methylation arrays.")
    (license license:artistic2.0)))

(define-public r-do-db
  (package
    (name "r-do-db")
    (version "2.9")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/annotation/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/annotation/src/contrib/"
                                  "DO.db_" version ".tar.gz"))
              (sha256
               (base32
                "10bqqa124l61ivzy4mdd3z3ar9a6537qbxw23pc4y9w8a6dwnavn"))))
    (properties
     `((upstream-name . "DO.db")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://www.bioconductor.org/packages/DO.db/")
    (synopsis "Annotation maps describing the entire Disease Ontology")
    (description
     "This package provides a set of annotation maps describing the entire
Disease Ontology.")
    (license license:artistic2.0)))


;;; Experiment data

(define-public r-hsmmsinglecell
  (package
    (name "r-hsmmsinglecell")
    (version "1.2.0")
    (source (origin
              (method url-fetch)
              ;; We cannot use bioconductor-uri here because this tarball is
              ;; located under "data/experiment/" instead of "bioc/".
              (uri (string-append "https://www.bioconductor.org/packages/"
                                  "release/data/experiment/src/contrib/"
                                  "HSMMSingleCell_" version ".tar.gz"))
              (sha256
               (base32
                "1vxnr8gr6md85g39csy7g2sqqajiqgyvznys2qa9yixd2b01yph9"))))
    (properties
     `((upstream-name . "HSMMSingleCell")))
    (build-system r-build-system)
    (home-page "https://www.bioconductor.org/packages/HSMMSingleCell/")
    (synopsis "Single-cell RNA-Seq for differentiating human skeletal muscle myoblasts (HSMM)")
    (description
     "Skeletal myoblasts undergo a well-characterized sequence of
morphological and transcriptional changes during differentiation.  In this
experiment, primary @dfn{human skeletal muscle myoblasts} (HSMM) were expanded
under high mitogen conditions (GM) and then differentiated by switching to
low-mitogen media (DM).  RNA-Seq libraries were sequenced from each of several
hundred cells taken over a time-course of serum-induced differentiation.
Between 49 and 77 cells were captured at each of four time points (0, 24, 48,
72 hours) following serum switch using the Fluidigm C1 microfluidic system.
RNA from each cell was isolated and used to construct mRNA-Seq libraries,
which were then sequenced to a depth of ~4 million reads per library,
resulting in a complete gene expression profile for each cell.")
    (license license:artistic2.0)))


;;; Packages

(define-public r-biocgenerics
  (package
    (name "r-biocgenerics")
    (version "0.28.0")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "BiocGenerics" version))
              (sha256
               (base32
                "0cvpsrhg7sn7lpqgxvqrsagv6j7xj5rafq5xdjfd8zc4gxrs5rb8"))))
    (properties
     `((upstream-name . "BiocGenerics")))
    (build-system r-build-system)
    (home-page "https://bioconductor.org/packages/BiocGenerics")
    (synopsis "S4 generic functions for Bioconductor")
    (description
     "This package provides S4 generic functions needed by many Bioconductor
packages.")
    (license license:artistic2.0)))

(define-public r-annotate
  (package
    (name "r-annotate")
    (version "1.60.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "annotate" version))
       (sha256
        (base32
         "0pk6ayr3vyqxk850ljkbyil4i382ngfqcbxlv0qrp62yfqgzcjwp"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-dbi" ,r-dbi)
       ("r-rcurl" ,r-rcurl)
       ("r-xml" ,r-xml)
       ("r-xtable" ,r-xtable)))
    (home-page
     "https://bioconductor.org/packages/annotate")
    (synopsis "Annotation for microarrays")
    (description "This package provides R environments for the annotation of
microarrays.")
    (license license:artistic2.0)))

(define-public r-hpar
  (package
    (name "r-hpar")
    (version "1.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "hpar" version))
       (sha256
        (base32
         "1pm3k8apgynmdzv2d0chca3b636kcai3b1x861fyv1m3xs6msgxn"))))
    (build-system r-build-system)
    (home-page "https://bioconductor.org/packages/hpar/")
    (synopsis "Human Protein Atlas in R")
    (description "This package provides a simple interface to and data from
the Human Protein Atlas project.")
    (license license:artistic2.0)))

(define-public r-regioner
  (package
    (name "r-regioner")
    (version "1.14.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "regioneR" version))
       (sha256
        (base32
         "19la74swgzxp90z2nr3pzsgkxd7wp70zl6i2ipv3plg841f6k5zd"))))
    (properties `((upstream-name . "regioneR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biostrings" ,r-biostrings)
       ("r-bsgenome" ,r-bsgenome)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-memoise" ,r-memoise)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://bioconductor.org/packages/regioneR/")
    (synopsis "Association analysis of genomic regions")
    (description "This package offers a statistical framework based on
customizable permutation tests to assess the association between genomic
region sets and other genomic features.")
    (license license:artistic2.0)))

(define-public r-geneplotter
  (package
    (name "r-geneplotter")
    (version "1.60.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "geneplotter" version))
       (sha256
        (base32
         "10khr0pznxf3m0f5gzck9ymljrwcv3vamfmpskd51yjh36lhllqz"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotate" ,r-annotate)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-lattice" ,r-lattice)
       ("r-rcolorbrewer" ,r-rcolorbrewer)))
    (home-page "https://bioconductor.org/packages/geneplotter")
    (synopsis "Graphics functions for genomic data")
    (description
     "This package provides functions for plotting genomic data.")
    (license license:artistic2.0)))

(define-public r-qvalue
  (package
    (name "r-qvalue")
    (version "2.14.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "qvalue" version))
       (sha256
        (base32
         "0kxavzm1j2mk26qicmjm90nxx4w5h3dxighzks7wzihay3k8cysc"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-reshape2" ,r-reshape2)))
    (home-page "http://github.com/jdstorey/qvalue")
    (synopsis "Q-value estimation for false discovery rate control")
    (description
     "This package takes a list of p-values resulting from the simultaneous
testing of many hypotheses and estimates their q-values and local @dfn{false
discovery rate} (FDR) values.  The q-value of a test measures the proportion
of false positives incurred when that particular test is called significant.
The local FDR measures the posterior probability the null hypothesis is true
given the test's p-value.  Various plots are automatically generated, allowing
one to make sensible significance cut-offs.  The software can be applied to
problems in genomics, brain imaging, astrophysics, and data mining.")
    ;; Any version of the LGPL.
    (license license:lgpl3+)))

(define-public r-diffbind
  (package
    (name "r-diffbind")
    (version "2.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DiffBind" version))
       (sha256
        (base32
         "0j8pal40lr1gv8sss96hhkj7l1qn9sy4q4l2kqd4rfwl7qrcnfw5"))))
    (properties `((upstream-name . "DiffBind")))
    (build-system r-build-system)
    (inputs
     `(("zlib" ,zlib)))
    (propagated-inputs
     `(("r-amap" ,r-amap)
       ("r-biocparallel" ,r-biocparallel)
       ("r-deseq2" ,r-deseq2)
       ("r-dplyr" ,r-dplyr)
       ("r-edger" ,r-edger)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-genomicranges" ,r-genomicranges)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggrepel" ,r-ggrepel)
       ("r-gplots" ,r-gplots)
       ("r-iranges" ,r-iranges)
       ("r-lattice" ,r-lattice)
       ("r-limma" ,r-limma)
       ("r-locfit" ,r-locfit)
       ("r-rcolorbrewer" , r-rcolorbrewer)
       ("r-rcpp" ,r-rcpp)
       ("r-rsamtools" ,r-rsamtools)
       ("r-s4vectors" ,r-s4vectors)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-systempiper" ,r-systempiper)
       ("r-zlibbioc" ,r-zlibbioc)))
    (home-page "http://bioconductor.org/packages/DiffBind")
    (synopsis "Differential binding analysis of ChIP-Seq peak data")
    (description
     "This package computes differentially bound sites from multiple
ChIP-seq experiments using affinity (quantitative) data.  Also enables
occupancy (overlap) analysis and plotting functions.")
    (license license:artistic2.0)))

(define-public r-ripseeker
  (package
    (name "r-ripseeker")
    (version "1.22.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "RIPSeeker" version))
       (sha256
        (base32
         "1x2n1iyik4s67bxq0fl6fpf602k51g4pxjpjpxkgx1a5fsk61f2i"))))
    (properties `((upstream-name . "RIPSeeker")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-s4vectors" ,r-s4vectors)
       ("r-iranges" ,r-iranges)
       ("r-genomicranges" ,r-genomicranges)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-rsamtools" ,r-rsamtools)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-rtracklayer" ,r-rtracklayer)))
    (home-page "http://bioconductor.org/packages/RIPSeeker")
    (synopsis
     "Identifying protein-associated transcripts from RIP-seq experiments")
    (description
     "This package infers and discriminates RIP peaks from RIP-seq alignments
using two-state HMM with negative binomial emission probability.  While
RIPSeeker is specifically tailored for RIP-seq data analysis, it also provides
a suite of bioinformatics tools integrated within this self-contained software
package comprehensively addressing issues ranging from post-alignments
processing to visualization and annotation.")
    (license license:gpl2)))

(define-public r-multtest
  (package
    (name "r-multtest")
    (version "2.38.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "multtest" version))
       (sha256
        (base32
         "0lq62jw81hz9k840969n5byj57pwd0jqga3hqvhb6abb3g10yz7k"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-survival" ,r-survival)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biobase" ,r-biobase)
       ("r-mass" ,r-mass)))
    (home-page "http://bioconductor.org/packages/multtest")
    (synopsis "Resampling-based multiple hypothesis testing")
    (description
     "This package can do non-parametric bootstrap and permutation
resampling-based multiple testing procedures (including empirical Bayes
methods) for controlling the family-wise error rate (FWER), generalized
family-wise error rate (gFWER), tail probability of the proportion of
false positives (TPPFP), and false discovery rate (FDR).  Several choices
of bootstrap-based null distribution are implemented (centered, centered
and scaled, quantile-transformed).  Single-step and step-wise methods are
available.  Tests based on a variety of T- and F-statistics (including
T-statistics based on regression parameters from linear and survival models
as well as those based on correlation parameters) are included.  When probing
hypotheses with T-statistics, users may also select a potentially faster null
distribution which is multivariate normal with mean zero and variance
covariance matrix derived from the vector influence function.  Results are
reported in terms of adjusted P-values, confidence regions and test statistic
cutoffs.  The procedures are directly applicable to identifying differentially
expressed genes in DNA microarray experiments.")
    (license license:lgpl3)))

(define-public r-graph
  (package
    (name "r-graph")
    (version "1.60.0")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "graph" version))
              (sha256
               (base32
                "1kgnsm6f0vmb9qbkmmrnvxbwqc0gar17dq5gv1v10hrksw6mh64i"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)))
    (home-page "https://bioconductor.org/packages/graph")
    (synopsis "Handle graph data structures in R")
    (description
     "This package implements some simple graph handling capabilities for R.")
    (license license:artistic2.0)))

(define-public r-codedepends
  (package
    (name "r-codedepends")
    (version "0.6.5")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "CodeDepends" version))
       (sha256
        (base32
         "0l7kiv3awx50glf5cs841b4zzsff1ml90f0zr868ygvwsr4ps1hq"))))
    (properties `((upstream-name . "CodeDepends")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-codetools" ,r-codetools)
       ("r-graph" ,r-graph)
       ("r-xml" ,r-xml)))
    (home-page "http://cran.r-project.org/web/packages/CodeDepends")
    (synopsis "Analysis of R code for reproducible research and code comprehension")
    (description
     "This package provides tools for analyzing R expressions or blocks of
code and determining the dependencies between them.  It focuses on R scripts,
but can be used on the bodies of functions.  There are many facilities
including the ability to summarize or get a high-level view of code,
determining dependencies between variables, code improvement suggestions.")
    ;; Any version of the GPL
    (license (list license:gpl2+ license:gpl3+))))

(define-public r-chippeakanno
  (package
    (name "r-chippeakanno")
    (version "3.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ChIPpeakAnno" version))
       (sha256
        (base32
         "1x98d8iwrxjwdz1s5cnvi6flynw9gdkmara9gwf205qxgmy7j3a3"))))
    (properties `((upstream-name . "ChIPpeakAnno")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-biocmanager" ,r-biocmanager)
       ("r-biostrings" ,r-biostrings)
       ("r-delayedarray" ,r-delayedarray)
       ("r-go-db" ,r-go-db)
       ("r-biomart" ,r-biomart)
       ("r-bsgenome" ,r-bsgenome)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-iranges" ,r-iranges)
       ("r-matrixstats" ,r-matrixstats)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-limma" ,r-limma)
       ("r-multtest" ,r-multtest)
       ("r-rbgl" ,r-rbgl)
       ("r-graph" ,r-graph)
       ("r-regioner" ,r-regioner)
       ("r-dbi" ,r-dbi)
       ("r-ensembldb" ,r-ensembldb)
       ("r-biobase" ,r-biobase)
       ("r-s4vectors" ,r-s4vectors)
       ("r-seqinr" ,r-seqinr)
       ("r-idr" ,r-idr)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-rsamtools" ,r-rsamtools)
       ("r-venndiagram" ,r-venndiagram)))
    (home-page "http://bioconductor.org/packages/ChIPpeakAnno")
    (synopsis "Peaks annotation from ChIP-seq and ChIP-chip experiments")
    (description
     "The package includes functions to retrieve the sequences around the peak,
obtain enriched Gene Ontology (GO) terms, find the nearest gene, exon, miRNA or
custom features such as most conserved elements and other transcription factor
binding sites supplied by users.  Starting 2.0.5, new functions have been added
for finding the peaks with bi-directional promoters with summary statistics
(peaksNearBDP), for summarizing the occurrence of motifs in peaks
(summarizePatternInPeaks) and for adding other IDs to annotated peaks or
enrichedGO (addGeneIDs).")
    (license license:gpl2+)))

(define-public r-marray
  (package
    (name "r-marray")
    (version "1.60.0")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "marray" version))
              (sha256
               (base32 "1sh7l3c28x6zhdv99c9x05ii2yxmh9alkazp98kdi4fdb23rlzky"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-limma" ,r-limma)))
    (home-page "http://bioconductor.org/packages/marray")
    (synopsis "Exploratory analysis for two-color spotted microarray data")
    (description "This package contains class definitions for two-color spotted
microarray data.  It also includes fuctions for data input, diagnostic plots,
normalization and quality checking.")
    (license license:lgpl2.0+)))

(define-public r-cghbase
  (package
   (name "r-cghbase")
   (version "1.42.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "CGHbase" version))
            (sha256
             (base32 "0ghxp49xdi09p3f2qwrdrq2p4qjafj4z1rr08ycgbf11gb22h1sc"))))
   (properties `((upstream-name . "CGHbase")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-marray" ,r-marray)))
   (home-page "http://bioconductor.org/packages/CGHbase")
   (synopsis "Base functions and classes for arrayCGH data analysis")
   (description "This package contains functions and classes that are needed by
the @code{arrayCGH} packages.")
   (license license:gpl2+)))

(define-public r-cghcall
  (package
   (name "r-cghcall")
   (version "2.44.0")
   (source (origin
            (method url-fetch)
            (uri (bioconductor-uri "CGHcall" version))
            (sha256
             (base32 "1k65kaiqvjyllzbpa2367n6f6kkmsy463kpflzs66hqhx2fshsmi"))))
   (properties `((upstream-name . "CGHcall")))
   (build-system r-build-system)
   (propagated-inputs
    `(("r-biobase" ,r-biobase)
      ("r-cghbase" ,r-cghbase)
      ("r-impute" ,r-impute)
      ("r-dnacopy" ,r-dnacopy)
      ("r-snowfall" ,r-snowfall)))
   (home-page "http://bioconductor.org/packages/CGHcall")
   (synopsis "Base functions and classes for arrayCGH data analysis")
   (description "This package contains functions and classes that are needed by
@code{arrayCGH} packages.")
   (license license:gpl2+)))

(define-public r-qdnaseq
  (package
    (name "r-qdnaseq")
    (version "1.18.0")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "QDNAseq" version))
              (sha256
               (base32 "04ff9nbckzrlb45mr2j0c3mlh1wcggq5bbl81zklhq203c5x1wc2"))))
    (properties `((upstream-name . "QDNAseq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocparallel" ,r-biocparallel)
       ("r-cghbase" ,r-cghbase)
       ("r-cghcall" ,r-cghcall)
       ("r-dnacopy" ,r-dnacopy)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-matrixstats" ,r-matrixstats)
       ("r-r-utils" ,r-r-utils)
       ("r-rsamtools" ,r-rsamtools)))
    (home-page "http://bioconductor.org/packages/QDNAseq")
    (synopsis "Quantitative DNA sequencing for chromosomal aberrations")
    (description "The genome is divided into non-overlapping fixed-sized bins,
number of sequence reads in each counted, adjusted with a simultaneous
two-dimensional loess correction for sequence mappability and GC content, and
filtered to remove spurious regions in the genome.  Downstream steps of
segmentation and calling are also implemented via packages DNAcopy and CGHcall,
respectively.")
    (license license:gpl2+)))

(define-public r-bayseq
  (package
    (name "r-bayseq")
    (version "2.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "baySeq" version))
       (sha256
        (base32
         "0f6yckihm5cwh3dycv2g54hf7nddhcqya4yrqwbir96y5k1d1km5"))))
    (properties `((upstream-name . "baySeq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-edger" ,r-edger)
       ("r-genomicranges" ,r-genomicranges)))
    (home-page "https://bioconductor.org/packages/baySeq/")
    (synopsis "Bayesian analysis of differential expression patterns in count data")
    (description
     "This package identifies differential expression in high-throughput count
data, such as that derived from next-generation sequencing machines,
calculating estimated posterior likelihoods of differential expression (or
more complex hypotheses) via empirical Bayesian methods.")
    (license license:gpl3)))

(define-public r-chipcomp
  (package
    (name "r-chipcomp")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ChIPComp" version))
       (sha256
        (base32
         "1sypdsvwzssraanlhddhzpf9p0xs3qlflc0hp7yfbp0aplsifx85"))))
    (properties `((upstream-name . "ChIPComp")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-bsgenome-hsapiens-ucsc-hg19" ,r-bsgenome-hsapiens-ucsc-hg19)
       ("r-bsgenome-mmusculus-ucsc-mm9" ,r-bsgenome-mmusculus-ucsc-mm9)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-limma" ,r-limma)
       ("r-rsamtools" ,r-rsamtools)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://bioconductor.org/packages/ChIPComp")
    (synopsis "Quantitative comparison of multiple ChIP-seq datasets")
    (description
     "ChIPComp implements a statistical method for quantitative comparison of
multiple ChIP-seq datasets.  It detects differentially bound sharp binding
sites across multiple conditions considering matching control in ChIP-seq
datasets.")
    ;; Any version of the GPL.
    (license license:gpl3+)))

(define-public r-riboprofiling
  (package
    (name "r-riboprofiling")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "RiboProfiling" version))
       (sha256
        (base32
         "1njvkd1khmf3rbp3dkz5z63wp79z4wmk4kzd3p3amky3w5by070z"))))
    (properties `((upstream-name . "RiboProfiling")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-biostrings" ,r-biostrings)
       ("r-data-table" ,r-data-table)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-ggbio" ,r-ggbio)
       ("r-ggplot2" ,r-ggplot2)
       ("r-iranges" ,r-iranges)
       ("r-plyr" ,r-plyr)
       ("r-reshape2" ,r-reshape2)
       ("r-rsamtools" ,r-rsamtools)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)
       ("r-sqldf" ,r-sqldf)))
    (home-page "https://bioconductor.org/packages/RiboProfiling/")
    (synopsis "Ribosome profiling data analysis")
    (description "Starting with a BAM file, this package provides the
necessary functions for quality assessment, read start position recalibration,
the counting of genomic sequence reads on CDS, 3'UTR, and 5'UTR, and plotting
of count data: pairs, log fold-change, codon frequency and coverage
assessment, principal component analysis on codon coverage.")
    (license license:gpl3)))

(define-public r-riboseqr
  (package
    (name "r-riboseqr")
    (version "1.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "riboSeqR" version))
       (sha256
        (base32
         "1nacsbsz77fw4a10nqj2ncsf25q3aaa0gd5w1q0ray2prx7qmlqb"))))
    (properties `((upstream-name . "riboSeqR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-bayseq" ,r-bayseq)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-rsamtools" ,r-rsamtools)
       ("r-seqlogo" ,r-seqlogo)))
    (home-page "https://bioconductor.org/packages/riboSeqR/")
    (synopsis "Analysis of sequencing data from ribosome profiling experiments")
    (description
     "This package provides plotting functions, frameshift detection and
parsing of genetic sequencing data from ribosome profiling experiments.")
    (license license:gpl3)))

(define-public r-interactionset
  (package
    (name "r-interactionset")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "InteractionSet" version))
       (sha256
        (base32
         "0wirfhmpmkmnmhbqslw4bzvi2msqyqpjy1rrwr5qbd9k5rhx3bzb"))))
    (properties
     `((upstream-name . "InteractionSet")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)
       ("r-s4vectors" ,r-s4vectors)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://bioconductor.org/packages/InteractionSet")
    (synopsis "Base classes for storing genomic interaction data")
    (description
     "This packages provides the @code{GInteractions},
@code{InteractionSet} and @code{ContactMatrix} objects and associated methods
for storing and manipulating genomic interaction data from Hi-C and ChIA-PET
experiments.")
    (license license:gpl3)))

(define-public r-genomicinteractions
  (package
    (name "r-genomicinteractions")
    (version "1.16.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "GenomicInteractions" version))
       (sha256
        (base32
         "0zy5isp2lqpjm0n0n1gly5bs4izn22yciibyqrnlrr60rmn5s67q"))))
    (properties
     `((upstream-name . "GenomicInteractions")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-data-table" ,r-data-table)
       ("r-dplyr" ,r-dplyr)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-gviz" ,r-gviz)
       ("r-igraph" ,r-igraph)
       ("r-interactionset" ,r-interactionset)
       ("r-iranges" ,r-iranges)
       ("r-rsamtools" ,r-rsamtools)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)
       ("r-stringr" ,r-stringr)))
    (home-page "https://github.com/ComputationalRegulatoryGenomicsICL/GenomicInteractions/")
    (synopsis "R package for handling genomic interaction data")
    (description
     "This R package provides tools for handling genomic interaction data,
such as ChIA-PET/Hi-C, annotating genomic features with interaction
information and producing various plots and statistics.")
    (license license:gpl3)))

(define-public r-ctc
  (package
    (name "r-ctc")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ctc" version))
       (sha256
        (base32
         "0yp7c0abk48jx1wf8n1gawh7dm15idahqc8va24v8cm0bzxgnmh2"))))
    (build-system r-build-system)
    (propagated-inputs `(("r-amap" ,r-amap)))
    (home-page "https://bioconductor.org/packages/ctc/")
    (synopsis "Cluster and tree conversion")
    (description
     "This package provides tools for exporting and importing classification
trees and clusters to other programs.")
    (license license:gpl2)))

(define-public r-goseq
  (package
    (name "r-goseq")
    (version "1.34.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "goseq" version))
       (sha256
        (base32
         "1j87j98cajcjqabv6rb6zmcqxsqxxhbb3w60w1iink4rhsh8m3mn"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-biasedurn" ,r-biasedurn)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-genelendatabase" ,r-genelendatabase)
       ("r-go-db" ,r-go-db)
       ("r-mgcv" ,r-mgcv)))
    (home-page "https://bioconductor.org/packages/goseq/")
    (synopsis "Gene Ontology analyser for RNA-seq and other length biased data")
    (description
     "This package provides tools to detect Gene Ontology and/or other user
defined categories which are over/under represented in RNA-seq data.")
    (license license:lgpl2.0+)))

(define-public r-glimma
  (package
    (name "r-glimma")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "Glimma" version))
       (sha256
        (base32
         "1ihrww55sa7ipi1rpp0rmn081sbqdwdmm5mz30zfrjr1xxqcdbcv"))))
    (properties `((upstream-name . "Glimma")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-edger" ,r-edger)
       ("r-jsonlite" ,r-jsonlite)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://github.com/Shians/Glimma")
    (synopsis "Interactive HTML graphics")
    (description
     "This package generates interactive visualisations for analysis of
RNA-sequencing data using output from limma, edgeR or DESeq2 packages in an
HTML page.  The interactions are built on top of the popular static
representations of analysis results in order to provide additional
information.")
    (license license:lgpl3)))

(define-public r-rots
  (package
    (name "r-rots")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ROTS" version))
       (sha256
        (base32
         "1d5ggkk47xybcaizfy756qimbf2falg9cld46mhqjp3xfbfvzsg6"))))
    (properties `((upstream-name . "ROTS")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://bioconductor.org/packages/ROTS/")
    (synopsis "Reproducibility-Optimized Test Statistic")
    (description
     "This package provides tools for calculating the
@dfn{Reproducibility-Optimized Test Statistic} (ROTS) for differential testing
in omics data.")
    (license license:gpl2+)))

(define-public r-plgem
  (package
    (name "r-plgem")
    (version "1.54.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "plgem" version))
       (sha256
        (base32
         "1330635db3p8xm5y8fwrk1l37r6bgypsq70s3rx954i775zp6szg"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-mass" ,r-mass)))
    (home-page "http://www.genopolis.it")
    (synopsis "Detect differential expression in microarray and proteomics datasets")
    (description
     "The Power Law Global Error Model (PLGEM) has been shown to faithfully
model the variance-versus-mean dependence that exists in a variety of
genome-wide datasets, including microarray and proteomics data.  The use of
PLGEM has been shown to improve the detection of differentially expressed
genes or proteins in these datasets.")
    (license license:gpl2)))

(define-public r-inspect
  (package
    (name "r-inspect")
    (version "1.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "INSPEcT" version))
       (sha256
        (base32
         "07q5msw9rnamx957mbiawnv3p9kr5ahwawzvv9xzla7d3lkk62xp"))))
    (properties `((upstream-name . "INSPEcT")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biocparallel" ,r-biocparallel)
       ("r-deseq2" ,r-deseq2)
       ("r-desolve" ,r-desolve)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-plgem" ,r-plgem)
       ("r-preprocesscore" ,r-preprocesscore)
       ("r-proc" ,r-proc)
       ("r-rootsolve" ,r-rootsolve)
       ("r-rsamtools" ,r-rsamtools)
       ("r-s4vectors" ,r-s4vectors)
       ("r-shiny" ,r-shiny)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-txdb-mmusculus-ucsc-mm9-knowngene"
        ,r-txdb-mmusculus-ucsc-mm9-knowngene)))
    (home-page "https://bioconductor.org/packages/INSPEcT")
    (synopsis "Analysis of 4sU-seq and RNA-seq time-course data")
    (description
     "INSPEcT (INference of Synthesis, Processing and dEgradation rates in
Time-Course experiments) analyses 4sU-seq and RNA-seq time-course data in
order to evaluate synthesis, processing and degradation rates and assess via
modeling the rates that determines changes in mature mRNA levels.")
    (license license:gpl2)))

(define-public r-dnabarcodes
  (package
    (name "r-dnabarcodes")
    (version "1.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DNABarcodes" version))
       (sha256
        (base32
         "0g6j7ish0fk9jcib94wssjgp1m8ldcp42hyyg1ypr945fa3xghx0"))))
    (properties `((upstream-name . "DNABarcodes")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-bh" ,r-bh)
       ("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://bioconductor.org/packages/DNABarcodes")
    (synopsis "Create and analyze DNA barcodes")
    (description
     "This package offers tools to create DNA barcode sets capable of
correcting insertion, deletion, and substitution errors.  Existing barcodes
can be analyzed regarding their minimal, maximal and average distances between
barcodes.  Finally, reads that start with a (possibly mutated) barcode can be
demultiplexed, i.e. assigned to their original reference barcode.")
    (license license:gpl2)))

(define-public r-ruvseq
  (package
    (name "r-ruvseq")
    (version "1.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "RUVSeq" version))
       (sha256
        (base32
         "0qk7q3ab7k133divfkp54zsmvsmb9p8r09pkh2caswrzrn8achzv"))))
    (properties `((upstream-name . "RUVSeq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-edaseq" ,r-edaseq)
       ("r-edger" ,r-edger)
       ("r-mass" ,r-mass)))
    (home-page "https://github.com/drisso/RUVSeq")
    (synopsis "Remove unwanted variation from RNA-Seq data")
    (description
     "This package implements methods to @dfn{remove unwanted variation} (RUV)
of Risso et al. (2014) for the normalization of RNA-Seq read counts between
samples.")
    (license license:artistic2.0)))

(define-public r-biocneighbors
  (package
    (name "r-biocneighbors")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "BiocNeighbors" version))
       (sha256
        (base32
         "1fsb96acidlxwf0h65xv7fnwdi58ckmq00gmwykrlawh88wgn1ll"))))
    (properties `((upstream-name . "BiocNeighbors")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocparallel" ,r-biocparallel)
       ("r-rcpp" ,r-rcpp)
       ("r-rcppannoy" ,r-rcppannoy)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://bioconductor.org/packages/BiocNeighbors")
    (synopsis "Nearest Neighbor Detection for Bioconductor packages")
    (description
     "This package implements exact and approximate methods for nearest
neighbor detection, in a framework that allows them to be easily switched
within Bioconductor packages or workflows.  The exact algorithm is implemented
using pre-clustering with the k-means algorithm.  Functions are also provided
to search for all neighbors within a given distance.  Parallelization is
achieved for all methods using the BiocParallel framework.")
    (license license:gpl3)))

(define-public r-destiny
  (package
    (name "r-destiny")
    (version "2.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "destiny" version))
       (sha256
        (base32
         "1iay17mrhsfmpwl920rh1nip5b6ybva4h6bna0yld04paq5yva67"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-fnn" ,r-fnn)
       ("r-ggthemes" ,r-ggthemes)
       ("r-hmisc" ,r-hmisc)
       ("r-igraph" ,r-igraph)
       ("r-matrix" ,r-matrix)
       ("r-proxy" ,r-proxy)
       ("r-rcpp" ,r-rcpp)
       ("r-rcppeigen" ,r-rcppeigen)
       ("r-scales" ,r-scales)
       ("r-scatterplot3d" ,r-scatterplot3d)
       ("r-smoother" ,r-smoother)
       ("r-summarizedexperiment" ,r-summarizedexperiment)
       ("r-vim" ,r-vim)))
    (home-page "https://bioconductor.org/packages/destiny/")
    (synopsis "Create and plot diffusion maps")
    (description "This package provides tools to create and plot diffusion
maps.")
    ;; Any version of the GPL
    (license license:gpl3+)))

(define-public r-savr
  (package
    (name "r-savr")
    (version "1.20.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "savR" version))
       (sha256
        (base32
         "13bwq2a2pygdkmhrcmvz525wsi5i01j911711zgs6x93wj20b2w7"))))
    (properties `((upstream-name . "savR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-reshape2" ,r-reshape2)
       ("r-scales" ,r-scales)
       ("r-xml" ,r-xml)))
    (home-page "https://github.com/bcalder/savR")
    (synopsis "Parse and analyze Illumina SAV files")
    (description
     "This package provides tools to parse Illumina Sequence Analysis
Viewer (SAV) files, access data, and generate QC plots.")
    (license license:agpl3+)))

(define-public r-chipexoqual
  (package
    (name "r-chipexoqual")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "ChIPexoQual" version))
       (sha256
        (base32
         "1773bpiybn4g9jlv46z29x19q4dpcvn7lairr3lq5pdqbqmz5hnp"))))
    (properties `((upstream-name . "ChIPexoQual")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocparallel" ,r-biocparallel)
       ("r-biovizbase" ,r-biovizbase)
       ("r-broom" ,r-broom)
       ("r-data-table" ,r-data-table)
       ("r-dplyr" ,r-dplyr)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicalignments" ,r-genomicalignments)
       ("r-genomicranges" ,r-genomicranges)
       ("r-ggplot2" ,r-ggplot2)
       ("r-hexbin" ,r-hexbin)
       ("r-iranges" ,r-iranges)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-rmarkdown" ,r-rmarkdown)
       ("r-rsamtools" ,r-rsamtools)
       ("r-s4vectors" ,r-s4vectors)
       ("r-scales" ,r-scales)
       ("r-viridis" ,r-viridis)))
    (home-page "https://github.com/keleslab/ChIPexoQual")
    (synopsis "Quality control pipeline for ChIP-exo/nexus data")
    (description
     "This package provides a quality control pipeline for ChIP-exo/nexus
sequencing data.")
    (license license:gpl2+)))

(define-public r-copynumber
  (package
    (name "r-copynumber")
    (version "1.22.0")
    (source (origin
              (method url-fetch)
              (uri (bioconductor-uri "copynumber" version))
              (sha256
               (base32
                "0ipwj9i5p1bwhg5d80jdjagm02krpj2v0j47qdgw41h8wncdyal3"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-s4vectors" ,r-s4vectors)
       ("r-iranges" ,r-iranges)
       ("r-genomicranges" ,r-genomicranges)
       ("r-biocgenerics" ,r-biocgenerics)))
    (home-page "https://bioconductor.org/packages/copynumber")
    (synopsis "Segmentation of single- and multi-track copy number data")
    (description
     "This package segments single- and multi-track copy number data by a
penalized least squares regression method.")
    (license license:artistic2.0)))

(define-public r-dnacopy
  (package
    (name "r-dnacopy")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DNAcopy" version))
       (sha256
        (base32
         "04cqdqxhva66xwh1s2vffi56b9fcrqd4slcrvqasj5lp2rkjli82"))))
    (properties `((upstream-name . "DNAcopy")))
    (build-system r-build-system)
    (native-inputs `(("gfortran" ,gfortran)))
    (home-page "https://bioconductor.org/packages/DNAcopy")
    (synopsis "DNA copy number data analysis")
    (description
     "This package implements the @dfn{circular binary segmentation} (CBS)
algorithm to segment DNA copy number data and identify genomic regions with
abnormal copy number.")
    (license license:gpl2+)))

;; This is a CRAN package, but it uncharacteristically depends on a
;; Bioconductor package.
(define-public r-htscluster
  (package
    (name "r-htscluster")
    (version "2.0.8")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "HTSCluster" version))
       (sha256
        (base32
         "0wnbfh6hdx8692jilgmv8sys1zm6fqc6mim7vvjhyqlmpm8gm0kg"))))
    (properties `((upstream-name . "HTSCluster")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-capushe" ,r-capushe)
       ("r-edger" ,r-edger)
       ("r-plotrix" ,r-plotrix)))
    (home-page "https://cran.r-project.org/web/packages/HTSCluster")
    (synopsis "Clustering high-throughput transcriptome sequencing (HTS) data")
    (description
     "This package provides a Poisson mixture model is implemented to cluster
genes from high-throughput transcriptome sequencing (RNA-seq) data.  Parameter
estimation is performed using either the EM or CEM algorithm, and the slope
heuristics are used for model selection (i.e., to choose the number of
clusters).")
    (license license:gpl3+)))

(define-public r-deds
  (package
    (name "r-deds")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DEDS" version))
       (sha256
        (base32
         "1zfgaar3bpss49zhs81mwlfzkx5lv92j8a64xd12ig88is24cw2c"))))
    (properties `((upstream-name . "DEDS")))
    (build-system r-build-system)
    (home-page "https://bioconductor.org/packages/DEDS/")
    (synopsis "Differential expression via distance summary for microarray data")
    (description
     "This library contains functions that calculate various statistics of
differential expression for microarray data, including t statistics, fold
change, F statistics, SAM, moderated t and F statistics and B statistics.  It
also implements a new methodology called DEDS (Differential Expression via
Distance Summary), which selects differentially expressed genes by integrating
and summarizing a set of statistics using a weighted distance approach.")
    ;; Any version of the LGPL.
    (license license:lgpl3+)))

;; This is a CRAN package, but since it depends on a Bioconductor package we
;; put it here.
(define-public r-nbpseq
  (package
    (name "r-nbpseq")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "NBPSeq" version))
       (sha256
        (base32
         "0l4ylxhs2k9ww21jjqs67fygk92avdchhx2y1ixzl7yr2yh1y9by"))))
    (properties `((upstream-name . "NBPSeq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-qvalue" ,r-qvalue)))
    (home-page "https://cran.r-project.org/web/packages/NBPSeq")
    (synopsis "Negative binomial models for RNA-Seq data")
    (description
     "This package provides negative binomial models for two-group comparisons
and regression inferences from RNA-sequencing data.")
    (license license:gpl2)))

(define-public r-ebseq
  (package
    (name "r-ebseq")
    (version "1.22.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "EBSeq" version))
       (sha256
        (base32
         "1gzbk1hbwdan0j131ah88yryfvsiq0wqjnb09qbr4qaczpgvbad0"))))
    (properties `((upstream-name . "EBSeq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-blockmodeling" ,r-blockmodeling)
       ("r-gplots" ,r-gplots)
       ("r-testthat" ,r-testthat)))
    (home-page "https://bioconductor.org/packages/EBSeq")
    (synopsis "Differential expression analysis of RNA-seq data")
    (description
     "This package provides tools for differential expression analysis at both
gene and isoform level using RNA-seq data")
    (license license:artistic2.0)))

(define-public r-lpsymphony
  (package
    (name "r-lpsymphony")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "lpsymphony" version))
       (sha256
        (base32
         "0vnsf5x6gvd1k8h89al7r6xbgbxsjbxphr675czzwggz79zbvq7y"))))
    (build-system r-build-system)
    (inputs
     `(("gfortran" ,gfortran)
       ("zlib" ,zlib)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "http://r-forge.r-project.org/projects/rsymphony")
    (synopsis "Symphony integer linear programming solver in R")
    (description
     "This package was derived from Rsymphony.  The package provides an R
interface to SYMPHONY, a linear programming solver written in C++.  The main
difference between this package and Rsymphony is that it includes the solver
source code, while Rsymphony expects to find header and library files on the
users' system.  Thus the intention of @code{lpsymphony} is to provide an easy
to install interface to SYMPHONY.")
    ;; Symphony 5.4 or later is distributed under the terms of the EPL 1.0.
    ;; lpsimphony is released under the same terms.
    (license license:epl1.0)))

(define-public r-ihw
  (package
    (name "r-ihw")
    (version "1.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "IHW" version))
       (sha256
        (base32
         "10wqasl8k2j3y5qvak3xr2xj6symk656xww1y5n2l22nz832j19n"))))
    (properties `((upstream-name . "IHW")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-fdrtool" ,r-fdrtool)
       ("r-lpsymphony" ,r-lpsymphony)
       ("r-slam" ,r-slam)))
    (home-page "https://bioconductor.org/packages/IHW")
    (synopsis "Independent hypothesis weighting")
    (description
     "@dfn{Independent hypothesis weighting} (IHW) is a multiple testing
procedure that increases power compared to the method of Benjamini and
Hochberg by assigning data-driven weights to each hypothesis.  The input to
IHW is a two-column table of p-values and covariates.  The covariate can be
any continuous-valued or categorical variable that is thought to be
informative on the statistical properties of each hypothesis test, while it is
independent of the p-value under the null hypothesis.")
    (license license:artistic2.0)))

(define-public r-icobra
  (package
    (name "r-icobra")
    (version "1.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "iCOBRA" version))
       (sha256
        (base32
         "0i1swrm31g0zffi5pm48bfvdfqpd32d0zdchkbyipz96al46jnld"))))
    (properties `((upstream-name . "iCOBRA")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-dplyr" ,r-dplyr)
       ("r-dt" ,r-dt)
       ("r-ggplot2" ,r-ggplot2)
       ("r-limma" ,r-limma)
       ("r-reshape2" ,r-reshape2)
       ("r-rocr" ,r-rocr)
       ("r-scales" ,r-scales)
       ("r-shiny" ,r-shiny)
       ("r-shinybs" ,r-shinybs)
       ("r-shinydashboard" ,r-shinydashboard)
       ("r-upsetr" ,r-upsetr)))
    (home-page "https://bioconductor.org/packages/iCOBRA")
    (synopsis "Comparison and visualization of ranking and assignment methods")
    (description
     "This package provides functions for calculation and visualization of
performance metrics for evaluation of ranking and binary
classification (assignment) methods.  It also contains a Shiny application for
interactive exploration of results.")
    (license license:gpl2+)))

(define-public r-mast
  (package
    (name "r-mast")
    (version "1.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "MAST" version))
       (sha256
        (base32
         "0rhx655dza0m6yg9jcfz2nmxqahvxx2l91kqgyp7qai0bzz9d9ix"))))
    (properties `((upstream-name . "MAST")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-abind" ,r-abind)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-data-table" ,r-data-table)
       ("r-ggplot2" ,r-ggplot2)
       ("r-plyr" ,r-plyr)
       ("r-progress" ,r-progress)
       ("r-reshape2" ,r-reshape2)
       ("r-s4vectors" ,r-s4vectors)
       ("r-singlecellexperiment" ,r-singlecellexperiment)
       ("r-stringr" ,r-stringr)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://github.com/RGLab/MAST/")
    (synopsis "Model-based analysis of single cell transcriptomics")
    (description
     "This package provides methods and models for handling zero-inflated
single cell assay data.")
    (license license:gpl2+)))

(define-public r-monocle
  (package
    (name "r-monocle")
    (version "2.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "monocle" version))
       (sha256
        (base32
         "0shwkgqs93j2l5h36yyvb1lf724107cfjrmzp5fxfj1lqc0y61lf"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biocviews" ,r-biocviews)
       ("r-cluster" ,r-cluster)
       ("r-combinat" ,r-combinat)
       ("r-ddrtree" ,r-ddrtree)
       ("r-densityclust" ,r-densityclust)
       ("r-dplyr" ,r-dplyr)
       ("r-fastica" ,r-fastica)
       ("r-ggplot2" ,r-ggplot2)
       ("r-hsmmsinglecell" ,r-hsmmsinglecell)
       ("r-igraph" ,r-igraph)
       ("r-irlba" ,r-irlba)
       ("r-limma" ,r-limma)
       ("r-mass" ,r-mass)
       ("r-matrix" ,r-matrix)
       ("r-matrixstats" ,r-matrixstats)
       ("r-pheatmap" ,r-pheatmap)
       ("r-plyr" ,r-plyr)
       ("r-proxy" ,r-proxy)
       ("r-qlcmatrix" ,r-qlcmatrix)
       ("r-rann" ,r-rann)
       ("r-rcpp" ,r-rcpp)
       ("r-reshape2" ,r-reshape2)
       ("r-rtsne" ,r-rtsne)
       ("r-slam" ,r-slam)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-vgam" ,r-vgam)
       ("r-viridis" ,r-viridis)))
    (home-page "https://bioconductor.org/packages/monocle")
    (synopsis "Clustering, differential expression, and trajectory analysis for single-cell RNA-Seq")
    (description
     "Monocle performs differential expression and time-series analysis for
single-cell expression experiments.  It orders individual cells according to
progress through a biological process, without knowing ahead of time which
genes define progress through that process.  Monocle also performs
differential expression analysis, clustering, visualization, and other useful
tasks on single cell expression data.  It is designed to work with RNA-Seq and
qPCR data, but could be used with other types as well.")
    (license license:artistic2.0)))

(define-public r-noiseq
  (package
    (name "r-noiseq")
    (version "2.26.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "NOISeq" version))
       (sha256
        (base32
         "1wyhhi9ydlbjlz427093mdp5ppby77n37w5c2iyxlpsdk2m2nqsn"))))
    (properties `((upstream-name . "NOISeq")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-matrix" ,r-matrix)))
    (home-page "https://bioconductor.org/packages/NOISeq")
    (synopsis "Exploratory analysis and differential expression for RNA-seq data")
    (description
     "This package provides tools to support the analysis of RNA-seq
expression data or other similar kind of data.  It provides exploratory plots
to evaluate saturation, count distribution, expression per chromosome, type of
detected features, features length, etc.  It also supports the analysis of
differential expression between two experimental conditions with no parametric
assumptions.")
    (license license:artistic2.0)))

(define-public r-scdd
  (package
    (name "r-scdd")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "scDD" version))
       (sha256
        (base32
         "0dp2awajd5281dwpbs0wb8ij2pq9l60p0b80xhxrb41m5qybcri8"))))
    (properties `((upstream-name . "scDD")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-arm" ,r-arm)
       ("r-biocparallel" ,r-biocparallel)
       ("r-ebseq" ,r-ebseq)
       ("r-fields" ,r-fields)
       ("r-ggplot2" ,r-ggplot2)
       ("r-mclust" ,r-mclust)
       ("r-outliers" ,r-outliers)
       ("r-s4vectors" ,r-s4vectors)
       ("r-scran" ,r-scran)
       ("r-singlecellexperiment" ,r-singlecellexperiment)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://github.com/kdkorthauer/scDD")
    (synopsis "Mixture modeling of single-cell RNA-seq data")
    (description
     "This package implements a method to analyze single-cell RNA-seq data
utilizing flexible Dirichlet Process mixture models.  Genes with differential
distributions of expression are classified into several interesting patterns
of differences between two conditions.  The package also includes functions
for simulating data with these patterns from negative binomial
distributions.")
    (license license:gpl2)))

(define-public r-scone
  (package
    (name "r-scone")
    (version "1.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "scone" version))
       (sha256
        (base32
         "0l1x4cjnfjbpx6k55sjqx03555daa6v63rq0rg6b7jpz8xxzwa7p"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-aroma-light" ,r-aroma-light)
       ("r-biocparallel" ,r-biocparallel)
       ("r-boot" ,r-boot)
       ("r-class" ,r-class)
       ("r-cluster" ,r-cluster)
       ("r-compositions" ,r-compositions)
       ("r-diptest" ,r-diptest)
       ("r-edger" ,r-edger)
       ("r-fpc" ,r-fpc)
       ("r-gplots" ,r-gplots)
       ("r-hexbin" ,r-hexbin)
       ("r-limma" ,r-limma)
       ("r-matrixstats" ,r-matrixstats)
       ("r-mixtools" ,r-mixtools)
       ("r-rarpack" ,r-rarpack)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-rhdf5" ,r-rhdf5)
       ("r-ruvseq" ,r-ruvseq)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://bioconductor.org/packages/scone")
    (synopsis "Single cell overview of normalized expression data")
    (description
     "SCONE is an R package for comparing and ranking the performance of
different normalization schemes for single-cell RNA-seq and other
high-throughput analyses.")
    (license license:artistic2.0)))

(define-public r-geoquery
  (package
    (name "r-geoquery")
    (version "2.50.5")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "GEOquery" version))
       (sha256
        (base32
         "074dl00c8yi1ihpjkw7vl9vy2hggvipib0jn0hli0wrw7x1h9hg6"))))
    (properties `((upstream-name . "GEOquery")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-dplyr" ,r-dplyr)
       ("r-httr" ,r-httr)
       ("r-limma" ,r-limma)
       ("r-magrittr" ,r-magrittr)
       ("r-readr" ,r-readr)
       ("r-tidyr" ,r-tidyr)
       ("r-xml2" ,r-xml2)))
    (home-page "https://github.com/seandavi/GEOquery/")
    (synopsis "Get data from NCBI Gene Expression Omnibus (GEO)")
    (description
     "The NCBI Gene Expression Omnibus (GEO) is a public repository of
microarray data.  Given the rich and varied nature of this resource, it is
only natural to want to apply BioConductor tools to these data.  GEOquery is
the bridge between GEO and BioConductor.")
    (license license:gpl2)))

(define-public r-illuminaio
  (package
    (name "r-illuminaio")
    (version "0.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "illuminaio" version))
       (sha256
        (base32
         "1rdp9b4xlv91yzba7pd7k50s3nkljfxmdmyz5jl0j8ybhmpl6rns"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-base64" ,r-base64)))
    (home-page "https://github.com/HenrikBengtsson/illuminaio/")
    (synopsis "Parse Illumina microarray output files")
    (description
     "This package provides tools for parsing Illumina's microarray output
files, including IDAT.")
    (license license:gpl2)))

(define-public r-siggenes
  (package
    (name "r-siggenes")
    (version "1.56.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "siggenes" version))
       (sha256
        (base32
         "0cjlb5r04x15xkhk00i3wvpx21kj0k29pn0mj3whwqk31zznnk1b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-multtest" ,r-multtest)))
    (home-page "https://bioconductor.org/packages/siggenes/")
    (synopsis
     "Multiple testing using SAM and Efron's empirical Bayes approaches")
    (description
     "This package provides tools for the identification of differentially
expressed genes and estimation of the @dfn{False Discovery Rate} (FDR) using
both the Significance Analysis of Microarrays (SAM) and the @dfn{Empirical
Bayes Analyses of Microarrays} (EBAM).")
    (license license:lgpl2.0+)))

(define-public r-bumphunter
  (package
    (name "r-bumphunter")
    (version "1.24.5")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "bumphunter" version))
       (sha256
        (base32
         "1f9vk3srffbx8jpza40nd18a4y0p0z8q40mx55dlcnddkwrqi19b"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-dorng" ,r-dorng)
       ("r-foreach" ,r-foreach)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-iterators" ,r-iterators)
       ("r-limma" ,r-limma)
       ("r-locfit" ,r-locfit)
       ("r-matrixstats" ,r-matrixstats)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://github.com/ririzarr/bumphunter")
    (synopsis "Find bumps in genomic data")
    (description
     "This package provides tools for finding bumps in genomic data in order
to identify differentially methylated regions in epigenetic epidemiology
studies.")
    (license license:artistic2.0)))

(define-public r-minfi
  (package
    (name "r-minfi")
    (version "1.28.4")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "minfi" version))
       (sha256
        (base32
         "1sjwwqb0syngvj75saaky9y06hbxsawhhcmfvavzkhicxipafv7r"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-beanplot" ,r-beanplot)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biocparallel" ,r-biocparallel)
       ("r-biostrings" ,r-biostrings)
       ("r-bumphunter" ,r-bumphunter)
       ("r-data-table" ,r-data-table)
       ("r-delayedarray" ,r-delayedarray)
       ("r-delayedmatrixstats" ,r-delayedmatrixstats)
       ("r-genefilter" ,r-genefilter)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-geoquery" ,r-geoquery)
       ("r-hdf5array" ,r-hdf5array)
       ("r-illuminaio" ,r-illuminaio)
       ("r-iranges" ,r-iranges)
       ("r-lattice" ,r-lattice)
       ("r-limma" ,r-limma)
       ("r-mass" ,r-mass)
       ("r-mclust" ,r-mclust)
       ("r-nlme" ,r-nlme)
       ("r-nor1mix" ,r-nor1mix)
       ("r-preprocesscore" ,r-preprocesscore)
       ("r-quadprog" ,r-quadprog)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape" ,r-reshape)
       ("r-s4vectors" ,r-s4vectors)
       ("r-siggenes" ,r-siggenes)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://github.com/hansenlab/minfi")
    (synopsis "Analyze Illumina Infinium DNA methylation arrays")
    (description
     "This package provides tools to analyze and visualize Illumina Infinium
methylation arrays.")
    (license license:artistic2.0)))

(define-public r-methylumi
  (package
    (name "r-methylumi")
    (version "2.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "methylumi" version))
       (sha256
        (base32
         "14p2qi18cprfvb2gxng1vm48c7zwh23h88q9qjgipj9xl5axsgw2"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotate" ,r-annotate)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-fdb-infiniummethylation-hg19" ,r-fdb-infiniummethylation-hg19)
       ("r-genefilter" ,r-genefilter)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-ggplot2" ,r-ggplot2)
       ("r-illuminaio" ,r-illuminaio)
       ("r-iranges" ,r-iranges)
       ("r-lattice" ,r-lattice)
       ("r-matrixstats" ,r-matrixstats)
       ("r-minfi" ,r-minfi)
       ("r-reshape2" ,r-reshape2)
       ("r-s4vectors" ,r-s4vectors)
       ("r-scales" ,r-scales)
       ("r-summarizedexperiment" ,r-summarizedexperiment)))
    (home-page "https://bioconductor.org/packages/methylumi")
    (synopsis "Handle Illumina methylation data")
    (description
     "This package provides classes for holding and manipulating Illumina
methylation data.  Based on eSet, it can contain MIAME information, sample
information, feature information, and multiple matrices of data.  An
\"intelligent\" import function, methylumiR can read the Illumina text files
and create a MethyLumiSet.  methylumIDAT can directly read raw IDAT files from
HumanMethylation27 and HumanMethylation450 microarrays.  Normalization,
background correction, and quality control features for GoldenGate, Infinium,
and Infinium HD arrays are also included.")
    (license license:gpl2)))

(define-public r-lumi
  (package
    (name "r-lumi")
    (version "2.34.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "lumi" version))
       (sha256
        (base32
         "1fpmjpgcy5n0hx9whn9m3jhjmciqq0l59nvy5addbq0a4wnjhx8q"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-affy" ,r-affy)
       ("r-annotate" ,r-annotate)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-dbi" ,r-dbi)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-kernsmooth" ,r-kernsmooth)
       ("r-lattice" ,r-lattice)
       ("r-mass" ,r-mass)
       ("r-methylumi" ,r-methylumi)
       ("r-mgcv" ,r-mgcv)
       ("r-nleqslv" ,r-nleqslv)
       ("r-preprocesscore" ,r-preprocesscore)
       ("r-rsqlite" ,r-rsqlite)))
    (home-page "https://bioconductor.org/packages/lumi")
    (synopsis "BeadArray-specific methods for Illumina methylation and expression microarrays")
    (description
     "The lumi package provides an integrated solution for the Illumina
microarray data analysis.  It includes functions of Illumina
BeadStudio (GenomeStudio) data input, quality control, BeadArray-specific
variance stabilization, normalization and gene annotation at the probe level.
It also includes the functions of processing Illumina methylation microarrays,
especially Illumina Infinium methylation microarrays.")
    (license license:lgpl2.0+)))

(define-public r-linnorm
  (package
    (name "r-linnorm")
    (version "2.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "Linnorm" version))
       (sha256
        (base32
         "1qgk8m5kc409flqxs3vnf228v3z0112q8py9hgfgyiwvi6yzdbp6"))))
    (properties `((upstream-name . "Linnorm")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-amap" ,r-amap)
       ("r-apcluster" ,r-apcluster)
       ("r-ellipse" ,r-ellipse)
       ("r-fastcluster" ,r-fastcluster)
       ("r-fpc" ,r-fpc)
       ("r-ggdendro" ,r-ggdendro)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gmodels" ,r-gmodels)
       ("r-igraph" ,r-igraph)
       ("r-limma" ,r-limma)
       ("r-mass" ,r-mass)
       ("r-mclust" ,r-mclust)
       ("r-rcpp" ,r-rcpp)
       ("r-rcpparmadillo" ,r-rcpparmadillo)
       ("r-rtsne" ,r-rtsne)
       ("r-statmod" ,r-statmod)
       ("r-vegan" ,r-vegan)
       ("r-zoo" ,r-zoo)))
    (home-page "http://www.jjwanglab.org/Linnorm/")
    (synopsis "Linear model and normality based transformation method")
    (description
     "Linnorm is an R package for the analysis of RNA-seq, scRNA-seq, ChIP-seq
count data or any large scale count data.  It transforms such datasets for
parametric tests.  In addition to the transformtion function (@code{Linnorm}),
the following pipelines are implemented:

@enumerate
@item Library size/batch effect normalization (@code{Linnorm.Norm})
@item Cell subpopluation analysis and visualization using t-SNE or PCA K-means
  clustering or hierarchical clustering (@code{Linnorm.tSNE},
  @code{Linnorm.PCA}, @code{Linnorm.HClust})
@item Differential expression analysis or differential peak detection using
  limma (@code{Linnorm.limma})
@item Highly variable gene discovery and visualization (@code{Linnorm.HVar})
@item Gene correlation network analysis and visualization (@code{Linnorm.Cor})
@item Stable gene selection for scRNA-seq data; for users without or who do
  not want to rely on spike-in genes (@code{Linnorm.SGenes})
@item Data imputation (@code{Linnorm.DataImput}).
@end enumerate

Linnorm can work with raw count, CPM, RPKM, FPKM and TPM.  Additionally, the
@code{RnaXSim} function is included for simulating RNA-seq data for the
evaluation of DEG analysis methods.")
    (license license:expat)))

(define-public r-ioniser
  (package
    (name "r-ioniser")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "IONiseR" version))
       (sha256
        (base32
         "01lqisdlsvym8nhgpzn7lpcddk9lv9253dy9v65r2dicb5xqhj00"))))
    (properties `((upstream-name . "IONiseR")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-biocparallel" ,r-biocparallel)
       ("r-biostrings" ,r-biostrings)
       ("r-bit64" ,r-bit64)
       ("r-dplyr" ,r-dplyr)
       ("r-ggplot2" ,r-ggplot2)
       ("r-magrittr" ,r-magrittr)
       ("r-rhdf5" ,r-rhdf5)
       ("r-shortread" ,r-shortread)
       ("r-stringr" ,r-stringr)
       ("r-tibble" ,r-tibble)
       ("r-tidyr" ,r-tidyr)
       ("r-xvector" ,r-xvector)))
    (home-page "https://bioconductor.org/packages/IONiseR/")
    (synopsis "Quality assessment tools for Oxford Nanopore MinION data")
    (description
     "IONiseR provides tools for the quality assessment of Oxford Nanopore
MinION data.  It extracts summary statistics from a set of fast5 files and can
be used either before or after base calling.  In addition to standard
summaries of the read-types produced, it provides a number of plots for
visualising metrics relative to experiment run time or spatially over the
surface of a flowcell.")
    (license license:expat)))

;; This is a CRAN package, but it depends on packages from Bioconductor.
(define-public r-gkmsvm
  (package
    (name "r-gkmsvm")
    (version "0.79.0")
    (source
     (origin
       (method url-fetch)
       (uri (cran-uri "gkmSVM" version))
       (sha256
        (base32
         "04dakbgfvfalz4rm4fvvybp506dn5fbj5g86ybfhrc6wywjllsz3"))))
    (properties `((upstream-name . "gkmSVM")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-biostrings" ,r-biostrings)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-kernlab" ,r-kernlab)
       ("r-rcpp" ,r-rcpp)
       ("r-rocr" ,r-rocr)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)
       ("r-seqinr" ,r-seqinr)))
    (home-page "https://cran.r-project.org/web/packages/gkmSVM")
    (synopsis "Gapped-kmer support vector machine")
    (description
     "This R package provides tools for training gapped-kmer SVM classifiers
for DNA and protein sequences.  This package supports several sequence
kernels, including: gkmSVM, kmer-SVM, mismatch kernel and wildcard kernel.")
    (license license:gpl2+)))

(define-public r-triform
  (package
    (name "r-triform")
    (version "1.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "triform" version))
       (sha256
        (base32
         "12ca24pv1r5vbw3rq345jqg7x3prrbsxk6445zikpzfblwmw0b4s"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocgenerics" ,r-biocgenerics)
       ("r-iranges" ,r-iranges)
       ("r-yaml" ,r-yaml)))
    (home-page "https://bioconductor.org/packages/triform/")
    (synopsis "Find enriched regions in transcription factor ChIP-sequencing data")
    (description
     "The Triform algorithm uses model-free statistics to identify peak-like
distributions of TF ChIP sequencing reads, taking advantage of an improved
peak definition in combination with known profile characteristics.")
    (license license:gpl2)))

(define-public r-varianttools
  (package
    (name "r-varianttools")
    (version "1.24.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "VariantTools" version))
       (sha256
        (base32
         "1ml3pl7xnxvzr6zkypr80xzw6nffswk29gzxycn42473sc4ixn7j"))))
    (properties `((upstream-name . "VariantTools")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-biocparallel" ,r-biocparallel)
       ("r-biostrings" ,r-biostrings)
       ("r-bsgenome" ,r-bsgenome)
       ("r-genomeinfodb" ,r-genomeinfodb)
       ("r-genomicfeatures" ,r-genomicfeatures)
       ("r-genomicranges" ,r-genomicranges)
       ("r-iranges" ,r-iranges)
       ("r-matrix" ,r-matrix)
       ("r-rsamtools" ,r-rsamtools)
       ("r-rtracklayer" ,r-rtracklayer)
       ("r-s4vectors" ,r-s4vectors)
       ("r-variantannotation" ,r-variantannotation)))
    (home-page "https://bioconductor.org/packages/VariantTools/")
    (synopsis "Tools for exploratory analysis of variant calls")
    (description
     "Explore, diagnose, and compare variant calls using filters.  The
VariantTools package supports a workflow for loading data, calling single
sample variants and tumor-specific somatic mutations or other sample-specific
variant types (e.g., RNA editing).  Most of the functions operate on
alignments (BAM files) or datasets of called variants.  The user is expected
to have already aligned the reads with a separate tool, e.g., GSNAP via
gmapR.")
    (license license:artistic2.0)))

(define-public r-heatplus
  (package
    (name "r-heatplus")
    (version "2.28.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "Heatplus" version))
       (sha256
        (base32
         "0drspjzgb23ra2kdvpxhsd8mdifsf97fcf668llyz2hr0r39fc48"))))
    (properties `((upstream-name . "Heatplus")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-rcolorbrewer" ,r-rcolorbrewer)))
    (home-page "https://github.com/alexploner/Heatplus")
    (synopsis "Heatmaps with row and/or column covariates and colored clusters")
    (description
     "This package provides tools to display a rectangular heatmap (intensity
plot) of a data matrix.  By default, both samples (columns) and features (row)
of the matrix are sorted according to a hierarchical clustering, and the
corresponding dendrogram is plotted.  Optionally, panels with additional
information about samples and features can be added to the plot.")
    (license license:gpl2+)))

(define-public r-gosemsim
  (package
    (name "r-gosemsim")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "GOSemSim" version))
       (sha256
        (base32
         "0ckihpy8jmgn2np1avprz76v9z7i5hqm2gj514c6dmmq3csbc7ib"))))
    (properties `((upstream-name . "GOSemSim")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-go-db" ,r-go-db)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://guangchuangyu.github.io/software/GOSemSim")
    (synopsis "GO-terms semantic similarity measures")
    (description
     "The semantic comparisons of @dfn{Gene Ontology} (GO) annotations provide
quantitative ways to compute similarities between genes and gene groups, and
have became important basis for many bioinformatics analysis approaches.
GOSemSim is an R package for semantic similarity computation among GO terms,
sets of GO terms, gene products and gene clusters.")
    (license license:artistic2.0)))

(define-public r-anota
  (package
    (name "r-anota")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "anota" version))
       (sha256
        (base32
         "182fp6dpws516y0igvwn6936higfqvy25haa0xs273f8aczr9cf0"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-multtest" ,r-multtest)
       ("r-qvalue" ,r-qvalue)))
    (home-page "https://bioconductor.org/packages/anota/")
    (synopsis "Analysis of translational activity")
    (description
     "Genome wide studies of translational control is emerging as a tool to
study verious biological conditions.  The output from such analysis is both
the mRNA level (e.g. cytosolic mRNA level) and the levl of mRNA actively
involved in translation (the actively translating mRNA level) for each mRNA.
The standard analysis of such data strives towards identifying differential
translational between two or more sample classes - i.e.  differences in
actively translated mRNA levels that are independent of underlying differences
in cytosolic mRNA levels.  This package allows for such analysis using partial
variances and the random variance model.  As 10s of thousands of mRNAs are
analyzed in parallell the library performs a number of tests to assure that
the data set is suitable for such analysis.")
    (license license:gpl3)))

(define-public r-sigpathway
  (package
    (name "r-sigpathway")
    (version "1.50.0")
    (source
      (origin
        (method url-fetch)
        (uri (bioconductor-uri "sigPathway" version))
        (sha256
          (base32
            "0pygrla2q2151981gshzv51jnj60h1df3vby5gsxqvxn2pdr4bv3"))))
    (properties `((upstream-name . "sigPathway")))
    (build-system r-build-system)
    (home-page "https://www.pnas.org/cgi/doi/10.1073/pnas.0506577102")
    (synopsis "Pathway analysis")
    (description
     "This package is used to conduct pathway analysis by calculating the NT_k
and NE_k statistics in a statistical framework for determining whether a
specified group of genes for a pathway has a coordinated association with a
phenotype of interest.")
    (license license:gpl2)))

(define-public r-fgsea
  (package
    (name "r-fgsea")
    (version "1.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "fgsea" version))
       (sha256
        (base32
         "0cxxvlmg340l5l5fz4abbwppiri0ibg4navvq5k3wg511mz8ma2q"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biocparallel" ,r-biocparallel)
       ("r-data-table" ,r-data-table)
       ("r-fastmatch" ,r-fastmatch)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gridextra" ,r-gridextra)
       ("r-matrix" ,r-matrix)
       ("r-rcpp" ,r-rcpp)))
    (home-page "https://github.com/ctlab/fgsea/")
    (synopsis "Fast gene set enrichment analysis")
    (description
     "The package implements an algorithm for fast gene set enrichment
analysis.  Using the fast algorithm allows to make more permutations and get
more fine grained p-values, which allows to use accurate stantard approaches
to multiple hypothesis correction.")
    (license license:expat)))

(define-public r-dose
  (package
    (name "r-dose")
    (version "3.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "DOSE" version))
       (sha256
        (base32
         "1gh7dhvfc71kawxcfx8xqlir7mwvg5mmz4lqrdrvw5knvi2h3mfa"))))
    (properties `((upstream-name . "DOSE")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-biocparallel" ,r-biocparallel)
       ("r-do-db" ,r-do-db)
       ("r-fgsea" ,r-fgsea)
       ("r-ggplot2" ,r-ggplot2)
       ("r-gosemsim" ,r-gosemsim)
       ("r-qvalue" ,r-qvalue)
       ("r-reshape2" ,r-reshape2)
       ("r-s4vectors" ,r-s4vectors)))
    (home-page "https://guangchuangyu.github.io/software/DOSE/")
    (synopsis "Disease ontology semantic and enrichment analysis")
    (description
     "This package implements five methods proposed by Resnik, Schlicker,
Jiang, Lin and Wang, respectively, for measuring semantic similarities among
@dfn{Disease ontology} (DO) terms and gene products.  Enrichment analyses
including hypergeometric model and gene set enrichment analysis are also
implemented for discovering disease associations of high-throughput biological
data.")
    (license license:artistic2.0)))

(define-public r-enrichplot
  (package
    (name "r-enrichplot")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "enrichplot" version))
       (sha256
        (base32
         "0cxqfpy6py4k3z3lnlkiwx89r4ymfpdc4hm25dfpazqgjflz5is7"))))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-cowplot" ,r-cowplot)
       ("r-dose" ,r-dose)
       ("r-europepmc" ,r-europepmc)
       ("r-ggplot2" ,r-ggplot2)
       ("r-ggplotify" ,r-ggplotify)
       ("r-ggraph" ,r-ggraph)
       ("r-ggridges" ,r-ggridges)
       ("r-gosemsim" ,r-gosemsim)
       ("r-gridextra" ,r-gridextra)
       ("r-igraph" ,r-igraph)
       ("r-purrr" ,r-purrr)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-reshape2" ,r-reshape2)
       ("r-upsetr" ,r-upsetr)))
    (home-page "https://github.com/GuangchuangYu/enrichplot")
    (synopsis "Visualization of functional enrichment result")
    (description
     "The enrichplot package implements several visualization methods for
interpreting functional enrichment results obtained from ORA or GSEA analyses.
All the visualization methods are developed based on ggplot2 graphics.")
    (license license:artistic2.0)))

(define-public r-clusterprofiler
  (package
    (name "r-clusterprofiler")
    (version "3.10.1")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "clusterProfiler" version))
       (sha256
        (base32
         "1v4fh8ll7zk8yhbaa0nq9xvqrb05kyvbpwkqpnjf07s873805rxm"))))
    (properties
     `((upstream-name . "clusterProfiler")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-dose" ,r-dose)
       ("r-enrichplot" ,r-enrichplot)
       ("r-ggplot2" ,r-ggplot2)
       ("r-go-db" ,r-go-db)
       ("r-gosemsim" ,r-gosemsim)
       ("r-magrittr" ,r-magrittr)
       ("r-plyr" ,r-plyr)
       ("r-qvalue" ,r-qvalue)
       ("r-rvcheck" ,r-rvcheck)
       ("r-tidyr" ,r-tidyr)))
    (home-page "https://guangchuangyu.github.io/software/clusterProfiler/")
    (synopsis "Analysis and visualization of functional profiles for gene clusters")
    (description
     "This package implements methods to analyze and visualize functional
profiles (GO and KEGG) of gene and gene clusters.")
    (license license:artistic2.0)))

(define-public r-mlinterfaces
  (package
    (name "r-mlinterfaces")
    (version "1.62.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "MLInterfaces" version))
       (sha256
        (base32
         "12bgplyzfh0hkwmdp5w4cs5zw3ygdhzmiqzm8vhjyni6m9nrxwy8"))))
    (properties `((upstream-name . "MLInterfaces")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotate" ,r-annotate)
       ("r-biobase" ,r-biobase)
       ("r-biocgenerics" ,r-biocgenerics)
       ("r-cluster" ,r-cluster)
       ("r-fpc" ,r-fpc)
       ("r-gbm" ,r-gbm)
       ("r-gdata" ,r-gdata)
       ("r-genefilter" ,r-genefilter)
       ("r-ggvis" ,r-ggvis)
       ("r-hwriter" ,r-hwriter)
       ("r-mass" ,r-mass)
       ("r-mlbench" ,r-mlbench)
       ("r-pls" ,r-pls)
       ("r-rcolorbrewer" ,r-rcolorbrewer)
       ("r-rda" ,r-rda)
       ("r-rpart" ,r-rpart)
       ("r-sfsmisc" ,r-sfsmisc)
       ("r-shiny" ,r-shiny)
       ("r-threejs" ,r-threejs)))
    (home-page "https://bioconductor.org/packages/MLInterfaces/")
    (synopsis "Interfaces to R machine learning procedures")
    (description
     "This package provides uniform interfaces to machine learning code for
data in R and Bioconductor containers.")
    ;; Any version of the LGPL.
    (license license:lgpl2.1+)))

(define-public r-annaffy
  (package
    (name "r-annaffy")
    (version "1.54.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "annaffy" version))
       (sha256
        (base32
         "16c6allp4vlx0g3nffanrm0mkkf8s2n31dccw4bflnx2pr81bmd5"))))
    (build-system r-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'remove-reference-to-non-free-data
           (lambda _
             (substitute* "DESCRIPTION"
               ((", KEGG.db") ""))
             #t)))))
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-dbi" ,r-dbi)
       ("r-go-db" ,r-go-db)))
    (home-page "https://bioconductor.org/packages/annaffy/")
    (synopsis "Annotation tools for Affymetrix biological metadata")
    (description
     "This package provides functions for handling data from Bioconductor
Affymetrix annotation data packages.  It produces compact HTML and text
reports including experimental data and URL links to many online databases.
It allows searching of biological metadata using various criteria.")
    ;; Any version of the LGPL according to the DESCRIPTION file.  A copy of
    ;; the LGPL 2.1 is included.
    (license license:lgpl2.1+)))

(define-public r-a4core
  (package
    (name "r-a4core")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "a4Core" version))
       (sha256
        (base32
         "1d62afxkfp9zbp59ijcn4wd1gdynygw013av41wq8bfm3cx6f9zr"))))
    (properties `((upstream-name . "a4Core")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-biobase" ,r-biobase)
       ("r-glmnet" ,r-glmnet)))
    (home-page "https://bioconductor.org/packages/a4Core")
    (synopsis "Automated Affymetrix array analysis core package")
    (description
     "This is the core package for the automated analysis of Affymetrix
arrays.")
    (license license:gpl3)))

(define-public r-a4classif
  (package
    (name "r-a4classif")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "a4Classif" version))
       (sha256
        (base32
         "02l77a59865ly3bydv74ff2l2wfb0x5s283g1nx6g1qrw3ly982j"))))
    (properties `((upstream-name . "a4Classif")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-a4core" ,r-a4core)
       ("r-a4preproc" ,r-a4preproc)
       ("r-glmnet" ,r-glmnet)
       ("r-mlinterfaces" ,r-mlinterfaces)
       ("r-pamr" ,r-pamr)
       ("r-rocr" ,r-rocr)
       ("r-varselrf" ,r-varselrf)))
    (home-page "https://bioconductor.org/packages/a4Classif/")
    (synopsis "Automated Affymetrix array analysis classification package")
    (description
     "This is the classification package for the automated analysis of
Affymetrix arrays.")
    (license license:gpl3)))

(define-public r-a4preproc
  (package
    (name "r-a4preproc")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "a4Preproc" version))
       (sha256
        (base32
         "1dd3fqcc7nr2zbi46k0mnqkh42mfxk894ixfpqg7i9np2523p5gp"))))
    (properties `((upstream-name . "a4Preproc")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annotationdbi" ,r-annotationdbi)))
    (home-page "https://bioconductor.org/packages/a4Preproc/")
    (synopsis "Automated Affymetrix array analysis preprocessing package")
    (description
     "This is a package for the automated analysis of Affymetrix arrays.  It
is used for preprocessing the arrays.")
    (license license:gpl3)))

(define-public r-a4reporting
  (package
    (name "r-a4reporting")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "a4Reporting" version))
       (sha256
        (base32
         "124774z3bfdjgxx2ad40795h92aam21yfx0rw0n01nk2wf6k7xc4"))))
    (properties `((upstream-name . "a4Reporting")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-annaffy" ,r-annaffy)
       ("r-xtable" ,r-xtable)))
    (home-page "https://bioconductor.org/packages/a4Reporting/")
    (synopsis "Automated Affymetrix array analysis reporting package")
    (description
     "This is a package for the automated analysis of Affymetrix arrays.  It
provides reporting features.")
    (license license:gpl3)))

(define-public r-a4base
  (package
    (name "r-a4base")
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (bioconductor-uri "a4Base" version))
       (sha256
        (base32
         "0k9k3bv99msbwf2y416cz316ssaha2dxvmaddbl7z9037p8mjr70"))))
    (properties `((upstream-name . "a4Base")))
    (build-system r-build-system)
    (propagated-inputs
     `(("r-a4core" ,r-a4core)
       ("r-a4preproc" ,r-a4preproc)
       ("r-annaffy" ,r-annaffy)
       ("r-annotationdbi" ,r-annotationdbi)
       ("r-biobase" ,r-biobase)
       ("r-genefilter" ,r-genefilter)
       ("r-glmnet" ,r-glmnet)
       ("r-gplots" ,r-gplots)
       ("r-limma" ,r-limma)
       ("r-mpm" ,r-mpm)
       ("r-multtest" ,r-multtest)))
    (home-page "https://bioconductor.org/packages/a4Base/")
    (synopsis "Automated Affymetrix array analysis base package")
    (description
     "This package provides basic features for the automated analysis of
Affymetrix arrays.")
    (license license:gpl3)))
