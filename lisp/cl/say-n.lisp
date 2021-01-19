#!/usr/bin/env sh
#|
exec clisp -q -q $0 $0 ${1+"$@"}
|#

;;;; Say a number aloud.
;;;;
;;;; Andrew Pennebaker
;;;; 16 Nov 2010

(defun say (str)
  (shell (format nil "say ~a" str)))

(defun say-n (n)
  (say (format nil "~r" n)))
