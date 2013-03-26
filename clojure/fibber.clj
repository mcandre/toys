":";exec lein exec $0 ${1+"$@"}
":";exit

(ns fibber
  (:gen-class))

(defn fib [n]
  (if (< n 2) n
      (+ (fib (- n 1)) (fib (- n 2)))))

(defn -main [& args]
  (println ((memoize fib) 20)))

(when (.contains (first *command-line-args*) *source-path*)
  (apply -main (rest *command-line-args*)))
