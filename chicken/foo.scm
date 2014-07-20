#!/usr/bin/env csi -ss

(define foo
	(lambda ()
		(display "foo\n")
		(foo)))

(foo)
