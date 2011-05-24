(define response
	(lambda (age)
		(cond
			((< age 0) "That is impossible.")
			((< age 4) "You are a toddler.")
			((< age 13) "You are a kid.")
			((< age 20) "You are a teenager.")
			((< age 40) "You are under the hill.")
			((= age 40) "You are standing upon the hill.")
			((< age 64) "You are over the hill.")
			((< age 100) "You are a senior citizen.")
			(else "You are barking old."))))

(display "Age: ")
(display (response (read)))
(display "\n")

(exit)