#!/usr/bin/env newlisp

(setf STDIN 0)
(setf STDOUT 1)

(context 'atbash)

(define (atbash:atbash c)
	(let ((b (char c)))
		(if
			(and (>= b 65) (<= b 90))
			(char (+ 65 (% (- 25 (- b 65)) 26)))
			(and (>= b 97) (<= b 122))
			(char (+ 97 (% (- 25 (- b 97)) 26)))
			c)))

(define (main)
	(setf s (read-line))

	(while s
		(println (join (map atbash (explode s)) ""))

		(setf s (read-line)))

	(exit))

(if (find "atbash" (main-args 1)) (main))

(context MAIN)