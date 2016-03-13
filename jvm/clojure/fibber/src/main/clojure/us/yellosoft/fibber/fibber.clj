(ns us.yellosoft.fibber.Fibber
  (:gen-class))

(defn fib [n]
  (if (< n 2) n
      (+ (fib (- n 1)) (fib (- n 2)))))

(defn -main [& args]
  (println ((memoize fib) 20)))
