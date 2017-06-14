(defparameter *db* nil)

(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defun add-record (cd) (push cd *db*))

(defun dump-cd (cd)
  (format t "~{~a:~10t~a~%~}~%" cd))

(defun dump-db ()
  (dolist (cd *db*) (dump-cd cd)))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]: ")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
     (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(defun save-db (filename)
  (with-open-file (out filename :direction :output :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setq *db* (read in)))))

(defun select (selector) (remove-if-not selector *db*))

(defun update (selector &key title artist rating (ripped nil ripped-p))
  (setq *db*
    (mapcar
      #'(lambda (cd)
        (when (funcall selector cd)
          (if title (setf (getf cd :title) title))
          (if artist (setf (getf cd :artist) artist))
          (if rating (setf (getf cd :rating) rating))
          (if ripped-p (setf (getf cd :ripped) ripped)))
          cd)
      *db*)))

(defun delete-rows (selector)
  (setq *db* (remove-if selector *db*)))

(defun make-comparison-expr (field value)
  `(equal (getf cd ,field) ,value))

(defun make-comparison-expr-list (fields)
  (loop while fields
       collecting (make-comparison-expr (pop fields) (pop fields))))

(defmacro where (&rest clauses)
  `#'(lambda (cd)
    (and ,@(make-comparison-expr-list clauses))))
