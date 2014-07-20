#!/usr/bin/env csi -ss

;;; Andrew Pennebaker
;;; 5 Mar 2011
;;;
;;; From The Chicken User's Manual
;;; http://wiki.call-cc.org/man/4/Getting%20started

(require-extension srfi-13) ; strings
(require-extension srfi-1) ; lists

(define (palindrome? x)
	(define (check left right)
		(if (>= left right)
			#t
			(and (char=? (string-ref x left) (string-ref x right))
				(check (add1 left) (sub1 right)))))
		(check 0 (sub1 (string-length x))))

(define (usage)
	(display (format "Usage: ~a <string>\n" (cdr (program)))))

(define (main args)
	(if (> (length args) 0)
		(let ((text (car args)))
			(display
				(format "~a ~a\n"
					text
					(if (palindrome? text)
						"is a palindrome"
						"is not a palindrome"))))
		(usage)))

(define (program)
	(if (string=? (car (argv)) "csi")
		(let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
			(if (number? s-index)
				(cons 'interpreted (list-ref (argv) (+ 1 s-index)))
				(cons 'unknown "")))
		(cons 'compiled (car (argv)))))

(if (equal? (car (program)) 'compiled)
	(main (cdr (argv))))
