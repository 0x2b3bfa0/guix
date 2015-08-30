;;; guix-utils.el --- General utility functions  -*- lexical-binding: t -*-

;; Copyright © 2014, 2015 Alex Kost <alezost@gmail.com>

;; This file is part of GNU Guix.

;; GNU Guix is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Guix is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This file provides auxiliary general functions for guix.el package.

;;; Code:

(require 'cl-lib)

(defvar guix-true-string "Yes")
(defvar guix-false-string "–")
(defvar guix-list-separator ", ")

(defvar guix-time-format "%F %T"
  "String used to format time values.
For possible formats, see `format-time-string'.")

(defun guix-get-string (val &optional face)
  "Convert VAL into a string and return it.

VAL can be an expression of any type.
If VAL is t/nil, it is replaced with
`guix-true-string'/`guix-false-string'.
If VAL is list, its elements are concatenated using
`guix-list-separator'.

If FACE is non-nil, propertize returned string with this FACE."
  (let ((str (cond
              ((stringp val) val)
              ((null val) guix-false-string)
              ((eq t val) guix-true-string)
              ((numberp val) (number-to-string val))
              ((listp val) (mapconcat #'guix-get-string
                                      val guix-list-separator))
              (t (prin1-to-string val)))))
    (if (and val face)
        (propertize str 'font-lock-face face)
      str)))

(defun guix-get-time-string (seconds)
  "Return formatted time string from SECONDS.
Use `guix-time-format'."
  (format-time-string guix-time-format (seconds-to-time seconds)))

(defun guix-get-one-line (str)
  "Return one-line string from a multi-line STR."
  (replace-regexp-in-string "\n" " " str))

(defun guix-format-insert (val &optional face format)
  "Convert VAL into a string and insert it at point.
If FACE is non-nil, propertize VAL with FACE.
If FORMAT is non-nil, format VAL with FORMAT."
  (let ((str (guix-get-string val face)))
    (insert (if format
                (format format str)
              str))))

(defun guix-mapinsert (function sequence separator)
  "Like `mapconcat' but for inserting text.
Apply FUNCTION to each element of SEQUENCE, and insert SEPARATOR
at point between each FUNCTION call."
  (when sequence
    (funcall function (car sequence))
    (mapc (lambda (obj)
            (insert separator)
            (funcall function obj))
          (cdr sequence))))

(defun guix-insert-button (label &optional type &rest properties)
  "Make button of TYPE with LABEL and insert it at point.
See `insert-text-button' for the meaning of PROPERTIES."
  (if (null label)
      (guix-format-insert nil)
    (apply #'insert-text-button label
           :type (or type 'button)
           properties)))

(defun guix-split-insert (val &optional face col separator)
  "Convert VAL into a string, split it and insert at point.

If FACE is non-nil, propertize returned string with this FACE.

If COL is non-nil and result string is a one-line string longer
than COL, split it into several short lines.

Separate inserted lines with SEPARATOR."
  (if (null val)
      (guix-format-insert nil)
    (let ((strings (guix-split-string (guix-get-string val) col)))
      (guix-mapinsert (lambda (str) (guix-format-insert str face))
                      strings
                      (or separator "")))))

(defun guix-split-string (str &optional col)
  "Split string STR by lines and return list of result strings.
If COL is non-nil and STR is a one-line string longer than COL,
split it into several short lines."
  (let ((strings (split-string str "\n *")))
    (if (and col
             (null (cdr strings))       ; if not multi-line
             (> (length str) col))
        (split-string (guix-get-filled-string str col) "\n")
      strings)))

(defun guix-get-filled-string (str col)
  "Return string by filling STR to column COL."
  (with-temp-buffer
    (insert str)
    (let ((fill-column col))
      (fill-region (point-min) (point-max)))
    (buffer-string)))

(defun guix-completing-read-multiple (prompt table &optional predicate
                                      require-match initial-input
                                      hist def inherit-input-method)
  "Same as `completing-read-multiple' but remove duplicates in result."
  (cl-remove-duplicates
   (completing-read-multiple prompt table predicate
                             require-match initial-input
                             hist def inherit-input-method)
   :test #'string=))

(declare-function org-read-date "org" t)

(defun guix-read-date (prompt)
  "Prompt for a date or time using `org-read-date'.
Return time value."
  (require 'org)
  (org-read-date nil t nil prompt))

(defun guix-get-key-val (alist &rest keys)
  "Return value from ALIST by KEYS.
ALIST is alist of alists of alists ... which can be consecutively
accessed with KEYS."
  (let ((val alist))
    (dolist (key keys val)
      (setq val (cdr (assq key val))))))

(defun guix-find-file (file)
  "Find FILE if it exists."
  (if (file-exists-p file)
      (find-file file)
    (message "File '%s' does not exist." file)))

(defmacro guix-while-search (regexp &rest body)
  "Evaluate BODY after each search for REGEXP in the current buffer."
  (declare (indent 1) (debug t))
  `(save-excursion
     (goto-char (point-min))
     (while (re-search-forward ,regexp nil t)
       ,@body)))


;;; Diff

(defvar guix-diff-switches "-u"
  "A string or list of strings specifying switches to be passed to diff.")

(defun guix-diff (old new &optional switches no-async)
  "Same as `diff', but use `guix-diff-switches' as default."
  (diff old new (or switches guix-diff-switches) no-async))


;;; Memoizing

(defun guix-memoize (function)
  "Return a memoized version of FUNCTION."
  (let ((cache (make-hash-table :test 'equal)))
    (lambda (&rest args)
      (let ((result (gethash args cache 'not-found)))
        (if (eq result 'not-found)
            (let ((result (apply function args)))
              (puthash args result cache)
              result)
          result)))))

(defmacro guix-memoized-defun (name arglist docstring &rest body)
  "Define a memoized function NAME.
See `defun' for the meaning of arguments."
  (declare (doc-string 3) (indent 2))
  `(defalias ',name
     (guix-memoize (lambda ,arglist ,@body))
     ;; Add '(name args ...)' string with real arglist to the docstring,
     ;; because *Help* will display '(name &rest ARGS)' for a defined
     ;; function (since `guix-memoize' returns a lambda with '(&rest
     ;; args)').
     ,(format "(%S %s)\n\n%s"
              name
              (mapconcat #'symbol-name arglist " ")
              docstring)))

(provide 'guix-utils)

;;; guix-utils.el ends here
