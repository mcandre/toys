#!/usr/bin/env newlisp

(context 'slug)

(setf PARSER "http://slug.yellosoft.us/?e=")

(define (slug:slug terms)
	(exec (append "open " PARSER (join terms "+"))))

(define (main)
	(let ((arguments (main-args)))
		(slug (2 arguments)))

	(exit))

(if (find "slug" (main-args 1)) (main))

(context MAIN)
