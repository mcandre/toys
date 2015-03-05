#!/usr/bin/env newlisp

(load (append (env "NEWLISPDIR") "/modules/json.lsp"))

(context 'Sunset)

(setf API "http://iamlegend.warnerbros.com/iphone/sunset.php?zip=")

(define (Sunset:Sunset zipcode)
  (let ((url (append API zipcode)))
    (setf data (get-url url))

    (setf info (Json:json->lisp data))

    (lookup "formattedSet" (lookup "weather" info))))

(define (usage)
  (println "Usage: sunset <zipcodes>")
  (exit))

(define (main)
  (let ((arguments (2 (main-args))))
    (if (< (length arguments) 1)
      (usage)
      (dolist (zipcode arguments)
        (println (Sunset zipcode)))))

  (exit))

(if (find "sunset" (main-args 1)) (main))

(context MAIN)
