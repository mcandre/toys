;;; Hide stupid Quicklisp warnings
(handler-bind ((warning #'muffle-warning))
  ;;; Load Quicklisp.
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Hide stupid warnings from dependencies
(handler-bind ((warning #'muffle-warning))
  ;;; Load dependencies.
  (asdf:oos 'asdf:load-op 'bordeaux-threads :verbose nil))

(bt:make-thread (lambda () (format t "Hello Thread!")) :name "thready")