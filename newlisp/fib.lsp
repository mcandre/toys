#!/usr/bin/env newlisp

(load (append (env "NEWLISPDIR") "/modules/gmp.lsp"))

(context 'fib)

(define (fib:fib n)
	(if (< n 2) n
		(begin
			(let ((a "0") (b "1"))
				(for (i 0 (- n 2))
					(let ((c a))
						(setf a b b (GMP:+ c b))))

				b))))

(define (main)
	(print "N = ")
	(setf n (int (read-line)))

	(println "Running")
	(setf elapsedt (time (setf x (fib n))))
	(println "Fib " n " = " x)
	(println "Time = " elapsedt " msec")

	(exit))

(if (find "fib" (main-args 1)) (main))

(context 'MAIN)