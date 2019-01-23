(ns us.yellosoft.args
  (:gen-class))

(defn -main [& args]
  (doall (map println args)))
