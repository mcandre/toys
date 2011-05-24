(define foo
	(lambda ()
		(display "foo\n")
		(foo)))

(foo)