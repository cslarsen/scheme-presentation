(import (scheme base)
        (scheme write)
        (scheme cxr)
        (scheme inexact)
        (scheme eval)
        (print))

;; Replaces all occurrences of symbol with value in the expression.
;;
(define (bind symbol value expr)
  (if (null? expr) '()                  ;; terminate list with '()
    (cons
      (cond
        ((symbol? (car expr))           ;; replace symbol w/value
         (if (equal? (car expr) symbol)
             value (car expr)))
        ((pair? (car expr))             ;; traverse pairs
         (bind symbol value (car expr)))
        (else                           ;; skip the others
         (car expr)))
      (bind symbol value (cdr expr))))) ;; keep replacing

;; Same as (bind ...) but takes a list of symbols and values.
;;
(define (bind* symvals expr)
  (if (null? symvals) expr
    (bind*
      (cdr symvals)
      (bind (caar symvals)
            (cadar symvals) expr))))

(define equation '(sqrt (+ (* x x) (* y y))))

(println "Equation: " equation)

(println "Binding x to 123, y to 456 gives: "
         (bind* '((x 123) (y 456)) equation))

(println "The result is: "
  (eval (bind*
          '((x 123)
            (y 456))
          '(sqrt (+ (* x x) (* y y))))))
