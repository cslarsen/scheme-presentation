(import (scheme base)
        (scheme eval)
        (print)
        (lazy-evaluation))

(define (format-harddrive)
  (println "Formatting harddrive, oops!"))

(define (calc expr)
  (println "The result of " expr " is " (eval expr)))

(define delayed
  (list
    (delay-computation (format-harddrive))
    (delay-computation (calc '(* 12 12)))
    (delay-computation (calc '(+ 12 12)))))

(force-computation (list-ref delayed 2))
(force-computation (list-ref delayed 1))
