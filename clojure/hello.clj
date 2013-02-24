":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

; Load:
;
; clj scriptedmain.clj
;
; Interpret:
;
; ./hello.clj <name>
; clj -m hello <name>
;
; Compile:
;
; clj
; => (set! *compile-path* ".")
; => (compile 'hello)
;
; Run:
;
; java -cp ~/path/to/clojure.jar:. hello <name>

(ns hello
	(:gen-class))

(defn usage []
	(println "Usage: hello <name>"))

(defn -main [& args]
	(if-not (first args)
		(usage)
		(printf "Hello %s!\n" (first args))))