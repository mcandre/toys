#!/usr/bin/env emacs --script

(defun fizzy (n)
  (cond
   ((= (% n 15) 0) "FizzBuzz")
   ((= (% n 3) 0) "Fizz")
   ((= (% n 5) 0) "Buzz")
   (t (format "%d" n))))

(mapcar '(lambda (n) (message (fizzy n)))
 (number-sequence 1 100))
