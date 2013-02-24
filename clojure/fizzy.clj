":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

; Load:
;
; clj fizzy.clj
;
; Interpret:
;
; ./fizzy.clj
; clj -m fizzy
;
; Compile:
;
; clj
; => (set! *compile-path* ".")
; => (compile 'fizzy)
;
; Run:
;
; java -cp ~/path/to/clojure.jar:. fizzy

(ns fizzy
  (:gen-class))

(defn fizzy [n]
  (cond (= (mod n 15) 0) "FizzBuzz"
        (= (mod n 3) 0) "Fizz"
        (= (mod n 5) 0) "Buzz"
        :else (format "%d" n)))

(defn -main [& args]
  (doseq [fb (map fizzy (range 1 101))]
    (println fb)))