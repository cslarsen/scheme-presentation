(import (scheme base)
        (scheme write)
        (composition))

(define (println . args)
  (define (my-newline x)
    (newline)
    x)

  (for-each
    (compose display my-newline)
    args))

(println 1 2 3)
