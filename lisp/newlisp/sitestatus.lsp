#!/usr/bin/env newlisp

(context 'SiteStatus)

(setf API "http://www.iwebtool.com/tool/tools/server_status/server_status.php?domain=")

(define (SiteStatus:SiteStatus domain)
  (let ((url (append API domain)))
    (setf data (get-url url))

    (if (find "The website is accessible!" data)
      "up"
      "down")))

(define (usage)
  (println "Usage: sitestatus <domains>")
  (exit))

(define (main)
  (let ((arguments (2 (main-args))))
    (if (< (length arguments) 1)
      (usage)
      (dolist (domain arguments)
        (println domain ": " (SiteStatus domain)))))

  (exit))

(if (find "sitestatus" (main-args 1)) (main))

(context MAIN)
