#!/usr/bin/env csi -ss

(require-extension srfi-13) ; strings
(require-extension srfi-1) ; lists

(define (main args)
  (display "N: ")

  (define n (read))

  (display "Running\n")

  (define x (expt 2 n))

  (display "2^n= ")

  (display x)

  (display "\n"))

(define (program)
  (if (string=? (car (argv)) "csi")
      (let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
        (if (number? s-index)
            (cons 'interpreted (list-ref (argv) (+ 1 s-index)))
            (cons 'unknown "")))
      (cons 'compiled (car (argv)))))

(if (equal? (car (program)) 'compiled)
    (main (cdr (argv))))
