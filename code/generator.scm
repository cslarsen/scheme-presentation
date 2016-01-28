(import (scheme base)
        (scheme write)
        (generator))

(define (println . s)
  (for-each display s)
  (newline))

(define num
  (generator-lambda yield
    (yield 10)
    (yield 20)
    (yield 30)
    -1))

(println "1: " (num) " (should be 10)")
(println "2: " (num) " (should be 20)")
(println "3: " (num) " (should be 30)")
(println "4: " (num) " (should be -1)")
(println "5: " (num) " (should be -1)")
