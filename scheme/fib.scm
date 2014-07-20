#!/usr/bin/env csi -ss

; Andrew Pennebaker
; 13 Feb 2007 - 5 Jun 2007

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

(display "N = ")

(define n (read))

(display "Running\n")

(define startt (current-seconds))

(define x (fib n))

(define endt (current-seconds))

(display (format "Fib ~a = ~a\n" n x))

(display (format "Time = ~a sec\n" (- endt startt)))

(exit)
