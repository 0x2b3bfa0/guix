;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2018 Ludovic Courtès <ludo@gnu.org>
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

(define-module (guix describe)
  #:use-module (guix memoization)
  #:use-module (guix profiles)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:export (current-profile
            current-profile-entries
            package-path-entries))

;;; Commentary:
;;;
;;; This module provides supporting code to allow a Guix instance to find, at
;;; run time, which profile it's in (profiles created by 'guix pull').  That
;;; allows it to read meta-information about itself (e.g., repository URL and
;;; commit ID) and to find other channels available in the same profile.  It's
;;; a bit like ELPA's pkg-info.el.
;;;
;;; Code:

(define current-profile
  (mlambda ()
    "Return the profile (created by 'guix pull') the calling process lives in,
or #f if this is not applicable."
    (match (command-line)
      ((program . _)
       (and (string-suffix? "/bin/guix" program)
            ;; Note: We want to do _lexical dot-dot resolution_.  Using ".."
            ;; for real would instead take us into the /gnu/store directory
            ;; that ~/.config/guix/current/bin points to, whereas we want to
            ;; obtain ~/.config/guix/current.
            (let ((candidate (dirname (dirname program))))
              (and (file-exists? (string-append candidate "/manifest"))
                   candidate)))))))

(define current-profile-entries
  (mlambda ()
    "Return the list of entries in the 'guix pull' profile the calling process
lives in, or #f if this is not applicable."
    (match (current-profile)
      (#f '())
      (profile
       (let ((manifest (profile-manifest profile)))
         (manifest-entries manifest))))))

(define package-path-entries
  (mlambda ()
    "Return a list of package path entries to be added to the package search
path.  These entries are taken from the 'guix pull' profile the calling
process lives in, when applicable."
    ;; Filter out Guix itself.
    (filter-map (lambda (entry)
                  (and (not (string=? (manifest-entry-name entry)
                                      "guix"))
                       (string-append (manifest-entry-item entry)
                                      "/share/guile/site/"
                                      (effective-version))))
                (current-profile-entries))))
