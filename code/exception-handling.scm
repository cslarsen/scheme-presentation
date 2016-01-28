(import (scheme base)
        (print)
        (try-catch))

(println  "--start--")

(try
  (exception-handler oops)

  (define (divide a b)
    (if (zero? b)
      (oops "Division by zero")
      (println a "/" b " = " (inexact (/ a b)))))

  (divide 10 2)
  (divide 1 3)
  (divide 3 0)
  (println "This should not execute")

  (catch
    (lambda (error)
      (println "Hey, we caught an error: " error))))

(println "--end--")
