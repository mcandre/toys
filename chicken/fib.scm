#!/usr/bin/env csi -ss

; Andrew Pennebaker
; 13 Feb 2007 - 5 Jun 2007

(require-extension srfi-13) ; strings
(require-extension srfi-1) ; lists

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

(define (fib n)
	(cond
		((< n 2) n)
		(else
			(let ((a 0) (b 1) (i 0) (m (- n 1)))
				(do () ((= i m))
					(let ((c (+ a b)))
						(set! a b)
						(set! b c)
						(set! i (+ i 1))))
						b))))

; recursion overhead is slow
;
;(define (fib n)
;	(cond
;		((= n 0) 0)
;		((= n 1) 1)
;		(else
;			(+ (fib (- n 1)) (fib (- n 2))))))
