(import (scheme base)
        (scheme process-context)
        (print)
        (goto))

(define n 0)

(println "Should now print 100 \"Hi!\"s:")

(begin
  (label 10)
  (print "Hi! ")

  (set! n (+ 1 n))
  (if (< n 100)
    (goto 10)
    (exit))

  (println "This line will never execute..."))
