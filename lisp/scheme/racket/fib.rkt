#!/usr/bin/env racket
#lang racket

(provide fib)

(define (fib n)
  (cond
    [(equal? n 0) 0]
    [(equal? n 1) 1]
    [else (+ (fib (- n 1)) (fib (- n 2)))]))

(module+ main (printf "~a\n" (fib 30)))
