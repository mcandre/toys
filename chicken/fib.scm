#!/usr/bin/env csi -ss

; Andrew Pennebaker
; 13 Feb 2007 - 5 Jun 2007

(use srfi-1) ; lists
(use srfi-13) ; strings

(define (fib n)
	(cond
		((= n 0) 0)
		((= n 1) 1)
		(else
			(+ (fib (- n 1)) (fib (- n 2))))))

(define (main args)
  (display "N = ")
  (define n (read))
  (display (format "~a\n" (fib n))))

(define (program)
  (if (string=? (car (argv)) "csi")
      (let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
        (if (number? s-index)
            (cons 'interpreted (list-ref (argv) (+ 1 s-index)))
            (cons 'unknown "")))
      (cons 'compiled (car (argv)))))

(if (equal? (car (program)) 'compiled)
    (main (cdr (argv))))
