#!/usr/bin/env csi -ss

(use srfi-1) ; lists
(use srfi-13) ; strings

(define (main args)
  (display "Age: ")
  (display (format "~a\n" (response (read)))))

(define (program)
  (if (string=? (car (argv)) "csi")
      (let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
        (if (number? s-index)
            (cons 'interpreted (list-ref (argv) (+ 1 s-index)))
            (cons 'unknown "")))
      (cons 'compiled (car (argv)))))

(if (equal? (car (program)) 'compiled)
    (main (cdr (argv))))

(define response
	(lambda (age)
		(cond
			((< age 0) "That is impossible.")
			((< age 4) "You are a toddler.")
			((< age 13) "You are a kid.")
			((< age 20) "You are a teenager.")
			((< age 40) "You are under the hill.")
			((= age 40) "You are standing upon the hill.")
			((< age 64) "You are over the hill.")
			((< age 100) "You are a senior citizen.")
			(else "You are barking old."))))
