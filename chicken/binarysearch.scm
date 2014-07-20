; Andrew Pennebaker
; 18 Feb 2007
; URL: http://snippets.dzone.com/posts/show/3535

(define binary-search
	(lambda (ls value low high)
		(let ((mid (floor (/ (+ low high) 2))))
			(cond
				((> low high) -1)
				((= (list-ref ls mid) value) mid)
				((> (list-ref ls mid) value) (binary-search ls value low (- mid 1)))
				((< (list-ref ls mid) value) (binary-search ls value (+ mid 1) high))))))