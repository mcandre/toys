#!/bin/sh
#|
exec ccl -e "(load \"$0\")"
exit
|#

;;; Andrew Pennebaker
;;; Tests Hunchentoot, Quicklisp, and Bordeaux Threads

;;; Works best with Lispbox
;;; http://common-lisp.net/project/lispbox/

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load Quicklisp.
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load dependencies.
  (ql:quickload 'hunchentoot))

(setq acceptor (make-instance 'hunchentoot:acceptor :port 4242))
(hunchentoot:start acceptor)
(loop)