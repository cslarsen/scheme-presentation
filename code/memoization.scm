(import (scheme base)
        (measure-time)
        (print)
        (quote-code)
        (memoization))

(define mul
  (lambda-memoize (a b)
    (println "<calculating " a "*" b ">")
    (* a b)))

(define (fibo-slow n)
  (if (<= n 1) n
      (+ (fibo-slow (- n 1))
         (fibo-slow (- n 2)))))

(define-memoize (fibo-fast n)
  (if (<= n 1) n
      (+ (fibo-fast (- n 1))
         (fibo-fast (- n 2)))))

(println "Prove that memoization works ...")

(run (mul 12 12))
(run (mul 12 12))
(run (mul 12 12))
(newline)

(run (mul 21 21))
(run (mul 12 12))
(run (mul 21 21))
(newline)

(println "Measuring times for fibo-slow and fibo-fast ...")

(report-time (fibo-slow 35))
(report-time (fibo-fast 35))
(report-time (fibo-fast 100))
