#!/bin/sh
#|
exec clisp -q -q $0 $0 ${1+"$@"}
|#

;;;; Removes newlines at the beginning of PRE tags in Sigil-edited ePub files.
;;;; See http://code.google.com/p/sigil/issues/detail?id=655
;;;;
;;;; Example:
;;;;
;;;; ./sigil-clean.lisp PCL.epub PCL-new.epub
;;;;
;;;; Andrew Pennebaker
;;;; andrew.pennebaker@gmail.com
;;;;
;;;; Requirements:
;;;;  - Quicklisp
;;;;  - zip
;;;;  - cl-ppcre

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load Quicklisp.
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init))))

;;; Hide stupid warnings
(let* ((*standard-output* (make-broadcast-stream)) (*error-output* *standard-output*))
  ;;; Load dependencies.
  (ql:quickload 'zip)
  (ql:quickload 'cl-ppcre))

(defparameter *temp-filename* "bytes.temp")

; Writes bytes to a zip file using an intermediary temp file.
(defun zip-write-bytes (oz name bytes)
  (with-open-file (temp-stream *temp-filename* :direction :output :element-type '(unsigned-byte 8) :if-exists :rename-and-delete)
    (write-sequence bytes temp-stream))
  (with-open-file (temp-stream *temp-filename* :element-type '(unsigned-byte 8))
    (zip:write-zipentry oz name temp-stream :file-write-date (get-universal-time))))

(defun sigil-clean (in-epub out-epub) (zipfilter in-epub #'should-clean #'clean out-epub))

; With help from Zach Beane
; http://xach.livejournal.com/
(defun zipfilter (in-filename test-f filter-f out-filename)
  (zip:with-zipfile (iz in-filename)
    (zip:with-output-to-zipfile (oz out-filename :if-exists :supersede)
      (zip:do-zipfile-entries (name entry iz)
	(let ((newname (clean name)) (content (zip:zipfile-entry-contents entry)))
	  (if (funcall test-f newname)
	      (zip-write-bytes oz newname (flexi-streams:string-to-octets (funcall filter-f (flexi-streams:octets-to-string content)) :external-format :utf-8))
	      (zip-write-bytes oz newname content))
	  (delete-file *temp-filename*))))))

(defun clean (html)
  (values
   (clean-pre-start
    (clean-pre-end
     (clean-nbsp-literal
      (clean-nbsp-code
       (clean-quote-left
        (clean-quote-right
         (clean-quote-a
          (clean-dash
           (clean-dash2
            (clean-backspace
             (clean-hyphen
              (clean-cent
               html))))))))))))))

(defun clean-pre-start (html) (cl-ppcre:regex-replace-all "(?i)(?m)<pre[^>]*>(\\s)*" html "<pre>"))
(defun clean-pre-end (html) (cl-ppcre:regex-replace-all "(?i)(?m)(\\s)+</pre>" html "</pre>"))
(defun clean-nbsp-literal (html) (cl-ppcre:regex-replace-all #\no-break_space html " "))
(defun clean-nbsp-code (html) (cl-ppcre:regex-replace-all "(?i)(&nbsp;)|(%c2%a0)" html " "))
(defun clean-quote-left (html) (cl-ppcre:regex-replace-all #\left_double_quotation_mark html "\""))
(defun clean-quote-right (html) (cl-ppcre:regex-replace-all #\right_double_quotation_mark html "\""))
(defun clean-quote-a (html) (cl-ppcre:regex-replace-all #\latin_small_letter_a_with_circumflex html "\""))
(defun clean-dash (html) (cl-ppcre:regex-replace-all #\U0097 html "&mdash;"))
(defun clean-dash2 (html) (cl-ppcre:regex-replace-all #\latin_capital_letter_a_with_circumflex html ""))
(defun clean-backspace (html) (cl-ppcre:regex-replace-all #\backspace html ""))
(defun clean-hyphen (html) (cl-ppcre:regex-replace-all #\U0096 html "-"))
(defun clean-cent (html) (cl-ppcre:regex-replace-all #\cent_sign html "&cent;"))

(defun should-clean (name)
  (member (pathname-type name) '("htm" "html" "xml" "xhtml" "opf" "ncx") :test #'equalp))

(defun sigil-usage (program)
  (format t "~&Usage: ~a <in-zip> <out-zip>~%" program)
  (quit))

(defun sigil-main (args)
  (unless (>= (length args) 3)
      (sigil-usage (car args)))

  (format t "Cleaning...~%")

  (sigil-clean (second args) (third args))

  (format t "Done.~%")

  (quit))

;;; With help from Francois-Rene Rideau
;;; http://tinyurl.com/cli-args
(let ((args
       #+clisp ext:*args*
       #+sbcl sb-ext:*posix-argv*
       #+clozure (ccl::command-line-arguments)
       #+gcl si:*command-args*
       #+ecl (loop for i from 0 below (si:argc) collect (si:argv i))
       #+cmu extensions:*command-line-strings*
       #+allegro (sys:command-line-arguments)
       #+lispworks sys:*line-arguments-list*
     ))

  (if (member (pathname-name *load-truename*)
              args
              :test #'(lambda (x y) (search x y :test #'equalp)))
    (sigil-main args)))
