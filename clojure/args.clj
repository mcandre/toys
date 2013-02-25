":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

(ns args
  (:gen-class))

(defn -main [& args]
  (doseq [arg args]
    (println arg)))