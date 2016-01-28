(import (scheme base)
        (scheme write)
        (scheme char)
        (print)
        (print-eval)
        (currying))

(define (mul a b)
  (* a b))

(define mul10 (curry (mul 10)))

(print-eval (mul 10 20))
(print-eval (mul10 20))
(print-eval ((curry (map char-upcase)) (string->list "hello")))

;; TODO:
;; Find some BETTER demonstrations of why currying is
;; useful other than simple arithmetic. Some real world
;; examples.
;;
;; Also, currying + composition is very cool as well,
;; and useful.
