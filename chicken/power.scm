":"; exec csi -ss $0 ${1+"$@"}

(define (main args)
  (display "N: ")

  (define n (read))

  (display "Running\n")

  (define x (expt 2 n))

  (display "2^n= ")

  (display x)

  (display "\n"))

(cond-expand
 (chicken-compile-shared)
 (compiling (main (command-line-arguments)))
 (else))
