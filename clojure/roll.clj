":";exec clj -m `basename $0 .clj` ${1+"$@"}
":";exit

(ns roll
  (:gen-class))

(defn parse
  "Parse a dice specification string
  of the form xdy or xDy
  into [x y]."
  [dice]
  (let [m (first (re-seq #"([0-9]*)[dD]([0-9]+)" dice))
        x (let [x (nth m 1)]
            (if (= x "") 1 (Integer/parseInt x)))
        y (Integer/parseInt (nth m 2))]
    [x y]))

(defn roll
  "Returns a sequence of random rolls specified by strings or keywords of

  xdy or xDy

  where x is the number of dice to roll and
  y is the number of faces on each die."
  [dice]
  (let [[x y] (parse (name dice))]
    (doall (repeatedly x #(+ 1 (rand-int y))))))

(defn -main [& args]
  (doall (map (comp println roll) args)))