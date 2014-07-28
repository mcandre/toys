#!/usr/bin/env csi -ss

; Andrew Pennebaker
; 9 Feb 2007 - 12 Jun 2007
; URL: http://snippets.dzone.com/posts/show/3492

(use srfi-1) ; lists
(use srfi-13) ; strings

(define (main args)
  (display "N = ")
  (define n (read))

  (display "Running\n")

  (define startt (current-seconds))

  (define steps (hanoi n *start* *aux* *end*))

  (define endt (current-seconds))

  (display (format "Time = ~a sec\n" (- endt startt))))

(define (program)
  (if (string=? (car (argv)) "csi")
      (let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
        (if (number? s-index)
            (cons 'interpreted (list-ref (argv) (+ 1 s-index)))
            (cons 'unknown "")))
      (cons 'compiled (car (argv)))))

(if (equal? (car (program)) 'compiled)
    (main (cdr (argv))))

(define *start* 0)
(define *aux* 1)
(define *end* 2)

(define (hanoi n start aux end)
  (if (= n 1)
			(cons start end)
			(cons
       (cons
        (hanoi (- n 1) start aux end)
        start)
       (cons
        aux
        (hanoi (- n 1) aux start end)))))
