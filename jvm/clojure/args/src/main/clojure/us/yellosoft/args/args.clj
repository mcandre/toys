(ns us.yellosoft.args.Args
  (:gen-class))

(defn -main [& args]
  (doall (map println args)))
