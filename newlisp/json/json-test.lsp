#!/usr/bin/env newlisp

(setf standard '(
	("weather" (
		("serverUTCTime" "April 02, 2009 22:28:35")
		("sunset" "April 02, 2009 19:33:00")
		("sunrise" "April 02, 2009 06:55:00")
		("location" "Fairfax, VA")
		("formattedRise" "6:55 am")
		("formattedSet" "7:33 pm")
		("formattedCivilStart" "6:28 am")
		("formattedCivilEnd" "8:00 pm")
		("timezone" "-4")
		("longitude" "W 77.3")
		("latitude" "N 38.8")
		("zip" "22030")
		("CTE" "April 02, 2009 20:00:00")
		("CTS" "April 02, 2009 06:28:00")))))

(load "json.lsp")
;; (load (append (env "NEWLISPDIR") "/modules/json.lsp"))

(setf data (read-file "test.json"))

(setf info (Json:json->lisp data))

(if (= (difference info standard) '())
	(println "Success")
	(println "Failure"))

(exit)
