#!/bin/sh
#|
exec clisp -q -q $0 $0 ${1+"$@"}
exit
|#

;;; Number guessing game based on Vivek Shangari's Lisp: Tears of Joy, Part 1
;;; http://www.linuxforu.com/2011/06/lisp-tears-of-joy-part-1/
;;;
;;; Andrew Pennebaker
;;;
;;; Load
;;;
;;; $ clisp
;;; > (load "guess")
;;; > (start-game)
;;;
;;; Instructions
;;;
;;; 1. Think of an integer in [1, 100]
;;; 2. The computer will try to guess the number.
;;; 3. After each guess, enter (bigger) or (smaller).
;;; 4. When the computer guesses the correct number,
;;;    restart with (start-game) or quit with (quit).

(defparameter *upper-bound* 100)
(defparameter *lower-bound* 1)
(defparameter *guess* '())

(defun guess ()
  (setq *guess* (truncate (+ *upper-bound* *lower-bound*) 2))
  (format t "~a" *guess*))

(defun bigger ()
  (setq *lower-bound* (+ *guess* 1))
  (guess))

(defun smaller ()
  (setq *upper-bound* (- *guess* 1))
  (guess))

(defun start-game ()
  (setq *upper-bound* 100)
  (setq *lower-bound* 1)
  (guess))