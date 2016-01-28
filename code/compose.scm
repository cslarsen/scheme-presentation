(import (scheme base)
        (scheme char)
        (print)
        (print-eval)
        (composition)
        (currying))

(define (upcase x) (map char-upcase x))

(define reverse-string
  (compose string->list reverse list->string))

(define reverse-string-rl-compose
  (compose-rl list->string reverse string->list))

(define reverse-upper-string
  (compose
    string->list
    reverse
    (curry (map char-upcase))
    list->string))

(print-eval (reverse-string "Hello!"))
(print-eval (reverse-upper-string "Hello!"))
(print-eval (reverse-string-rl-compose "Hello!"))
