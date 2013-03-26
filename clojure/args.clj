":";exec lein exec $0 ${1+"$@"}
":";exit

(ns args
  (:gen-class))

(defn -main [& args]
  (doall (map println args)))

(when (.contains (first *command-line-args*) *source-path*)
  (apply -main (rest *command-line-args*)))
