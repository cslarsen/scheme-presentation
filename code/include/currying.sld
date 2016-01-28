;; Note 1:
;; Strictly speaking, this is not true currying, but instead partial
;; application.
;;
;; Currying means to take an n-ary function and convert it into n functions
;; taking a single argument. Partial application is fixing some arguments in
;; a function, reducing its arity.
;;
;; The c-lambda macro described in the link below offers true currying in
;; Scheme, and is very neat.
;;
;; http://www.engr.uconn.edu/~jeffm/Papers/curry.html
;;
;; It should be possible to create a syntax-rules macro that does the same
;; (without using eval) that expands to a case-lambda or something.
;;
(define-library(currying)
  (import (scheme base))
  (export curry)
  (begin
    ;; Usage: ((curry (* 10)) 23) ==> 230
    ;;
    (define-syntax curry
      (syntax-rules ()
        ((curry (function fixed-param ...))
         (lambda all-params
           (apply function (append (list fixed-param ...)
                                   all-params))))))))

;; TODO:
;; Would be neat to specify positions, e.g.
;; (define (mul a b) (* a b))
;; (curry (mul _ 10)) => (lambda (x) (mul x 10))
