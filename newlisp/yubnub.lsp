#!/usr/bin/env newlisp

(context 'yubnub)

(setf PARSER "http://yubnub.org/parser/parse?command=")

(define (yubnub:yubnub terms)
	(exec (append "open " PARSER (join terms "+"))))

(define (main)
	(let ((arguments (main-args)))
		(yubnub (2 arguments)))

	(exit))

(if (find "yubnub" (main-args 1)) (main))

(context MAIN)