":"; exec csi -ss $0 ${1+"$@"}

(define (main args)
  (display "Hello World!\n"))

(cond-expand
 (chicken-compile-shared)
 (compiling (main (command-line-arguments)))
 (else))
