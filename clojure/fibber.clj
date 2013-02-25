":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

(ns fibber
  (:gen-class))

(defn fib [n]
  (if (< n 2) n
      (+ (fib (- n 1)) (fib (- n 2)))))

(defn -main [& args]
  (println ((memoize fib) 41)))