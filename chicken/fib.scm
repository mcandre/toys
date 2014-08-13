":"; exec csi -ss $0 ${1+"$@"}

; Andrew Pennebaker
; 13 Feb 2007 - 5 Jun 2007

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

(cond-expand
 (chicken-compile-shared)
 (compiling (main (command-line-arguments)))
 (else))
