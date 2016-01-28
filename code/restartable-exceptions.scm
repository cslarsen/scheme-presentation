(import (scheme base)
        (print)
        (try-restart))

(println  "--start--")

(try
  (exception-handler oops)
  (restart-handler phew)

  (define (divide a b)
    (let
      ((b (if (not (zero? b))
            b
            (oops
              (string-append
                "Division by zero: "
                (number->string a) "/"
                (number->string b))))))
      (println a "/" b " = " (inexact (/ a b)))))

  (divide 10 2)
  (divide 3 0)
  (println "Whoa, we recovered from an error!")
  (println "Restartable exceptions are neat!")

  (catch
    (lambda (error)
      (begin
        (println "Hey, we caught an error: " error)
        (println "Restart division with 1 as numerator:")
        (phew 1)))))

(println "--end--")
