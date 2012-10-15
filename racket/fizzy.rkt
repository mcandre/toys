#!/usr/bin/env racket
#lang racket

(provide fizzy)

(define (fizzy n)
	(cond
		[(equal? (modulo n 15) 0) "FizzBuzz"]
		[(equal? (modulo n 3) 0) "Fizz"]
		[(equal? (modulo n 5) 0) "Buzz"]
		[else (format "~a" n)]))

(module+ main
	(for ([i (in-range 1 101)])
		(printf "~a\n" (fizzy i))))