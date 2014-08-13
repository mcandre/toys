":"; exec csi -ss $0 ${1+"$@"}

;;; Andrew Pennebaker
;;; 5 Mar 2011
;;;
;;; From The Chicken User's Manual
;;; http://wiki.call-cc.org/man/4/Getting%20started

(define (palindrome? x)
	(define (check left right)
		(if (>= left right)
			#t
			(and (char=? (string-ref x left) (string-ref x right))
				(check (add1 left) (sub1 right)))))
		(check 0 (sub1 (string-length x))))

(define (usage)
	(display (format "Usage: ~a <string>\n" (program-name))))

(define (main args)
	(if (> (length args) 0)
		(let ((text (car args)))
			(display
				(format "~a ~a\n"
					text
					(if (palindrome? text)
						"is a palindrome"
						"is not a palindrome"))))
		(usage)))

(cond-expand
 (chicken-compile-shared)
 (compiling (main (command-line-arguments)))
 (else))
