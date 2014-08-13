":"; exec csi -ss $0 ${1+"$@"}

(define (main args)
  (map print args))

(cond-expand
 (chicken-compile-shared)
 (compiling (main (command-line-arguments)))
 (else))
