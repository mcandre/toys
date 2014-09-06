; Andrew Pennebaker
; 3 Feb 2007
; URL: http://snippets.dzone.com/posts/show/3478

(define dec->bin
	(lambda (d)
		(cond
			((< d 1) (list 0))
			((= d 1) (list 1))
			((> d 1) (append
				(dec->bin (floor (/ d 2)))
				(list (if (= (modulo d 2) 0) 0 1)))))))
