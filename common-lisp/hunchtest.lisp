#!/bin/bash
#|
exec ccl -e "(load \"$0\")"
exit
|#

;;; Andrew Pennebaker
;;; Tests Hunchentoot, Quicklisp, and Bordeaux Threads

;;; Works best with Lispbox
;;; http://common-lisp.net/project/lispbox/

;;; Hide stupid Quicklisp warnings
(handler-bind ((warning #'muffle-warning))
  ;;; Load Quicklisp.
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Hide stupid warnings from dependencies
(handler-bind ((warning #'muffle-warning))
  ;;; Load dependencies.
  (asdf:oos 'asdf:load-op 'hunchentoot :verbose nil))

(setq acceptor (make-instance 'hunchentoot:acceptor :port 4242))
(hunchentoot:start acceptor)
(loop)