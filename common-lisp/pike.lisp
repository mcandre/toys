#!/bin/sh
#|
exec clisp -q -q $0 $0 ${1+"$@"}
exit
|#

;;;; Captain Pike Speech
;;;;
;;;; Andrew Pennebaker
;;;; 16 Nov 2010

(defun say (str)
       (shell (format nil "say ~a" str)))

(defun beep (b)
       (if b (say "Beep.") (say "Beep. Beep.")))