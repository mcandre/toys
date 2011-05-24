#!/usr/bin/env newlisp

(context 'hextime)

(define (hextime:seconds)
	(/ (* (/ (time-of-day) 1000) 65536) 86400))

(define (hextime:hextime)
	(let ((s (hextime:seconds)))
		(format "%x_%02x_%x" (/ s 4096) (/ (% s 4096) 16) (% s 16))))

(define (main)
	(println (hextime))

	(exit))

(if (find "hextime" (main-args 1)) (main))

(context 'MAIN)