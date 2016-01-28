;; Taken from 
;; http://c2.com/cgi/wiki?AmbSpecialForm
;;
;; Can actually be implemented  in C using fork, wait and exit.
;;
(define-library (amb)
  (import (scheme base))
  (export
    amb
    require)
  (begin
    (define (*failure*)
      (error "Failure"))

    (define-syntax amb
      (syntax-rules ()
        ((amb) (*failure*))
        ((amb ?x) ?x)
        ((amb ?x ?y)
         (let ((old-failure *failure*))
           ((call/cc
              (lambda (cc)
                (set! *failure*
                  (lambda ()
                    (set! *failure* old-failure)
                    (cc (lambda () ?y))))
                (lambda () ?x))))))
        ((amb ?x ?rest ...)
         (amb ?x (amb ?rest ...)))))

    ; same as (assert ...) in other implementations
    (define (require p)
      (if (not p) (amb)))

    ))
