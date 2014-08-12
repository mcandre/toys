":"; exec csi -ss $0 ${1+"$@"}

(declare (uses chicken-syntax))
(use srfi-1) ; lists
(use srfi-13) ; strings
(use regex)

(define (main args)
  (map print args))

(define (program)
  (if (string=? (car (argv)) "csi")
      (let ((s-index (list-index (lambda (x) (string-contains x "-s")) (argv))))
        (if (number? s-index)
            (cons 'interpreted (list-ref (argv) (+ 1 s-index)))
            (cons 'unknown "")))
      (cons 'compiled (car (argv)))))

(let ((prog (program)))
	(if (and
			 (equal? (car prog) 'compiled)
			 (string-match ".*args.*" (cdr prog)))
			(main (cdr (argv)))))
