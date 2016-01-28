(import (scheme base)
        (print)
        (comments))

;; Notice that macros are expanded from the OUTSIDE IN,
;; unlike evaluation which is a depth-first traversal.
;;
;; That is why this works:
(uncomment
  (comment
    (define (hello)
      (println "The example worked fine!"))))

(comment
  (define (hello)
    (println "The example did NOT work!")))

(hello)
