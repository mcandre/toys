":";exec lein exec $0 ${1+"$@"}

(ns fizzy
  (:gen-class))

(defn fizzy [n]
  (let [x (mod n 3)
        y (mod n 5)]
    (cond (= [x y] [0 0]) "FizzBuzz"
          (= x 0) "Fizz"
          (= y 0) "Buzz"
          :else (format "%d" n))))

(defn -main [& args]
  (doall (map (comp println fizzy) (range 1 101))))

(when (.contains (first *command-line-args*) *source-path*)
  (apply -main (rest *command-line-args*)))
