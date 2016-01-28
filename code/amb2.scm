(import (scheme base)
        (print)
        (amb2))

(let
  ((a (amb '(1 2 3 4 5 6 7)))
   (b (amb '(1 2 3 4 5 6 7)))
   (c (amb '(1 2 3 4 5 6 7))))

  ; We're looking for dimensions of a legal right
  ; triangle using the Pythagorean theorem:
  (println "a=" a " b=" b " c=" c)
  (assert (= (* c c) (+ (* a a) (* b b))))

  ; And, we want the second side to be the shorter one:
  (assert (< b a))

  ; Answer:
  (println (list a b c)))
