; Andrew Pennebaker
; 5 Feb 2007
; URL: http://snippets.dzone.com/posts/show/3479

(define bin->dec
	(lambda (b)
		(cond
			((integer? b) b)
			((= (length b) 0) 0)
			(else
				(+
					(* (expt 2 (- (length b) 1)) (car b))
					(bin->dec (cdr b)))))))
