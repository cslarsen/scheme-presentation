(define-library (generator)
  (import (scheme base))
  (export generator-lambda)
  (begin
    ;; NOTE: does not accept any parameters, yet...
    (define-syntax generator-lambda
      (syntax-rules ()
        ((generator-lambda yielder body ...)
          (letrec
            ((next
               (lambda (return)
                 (let-syntax
                   ((yielder (syntax-rules ()
                               ((_ value)
                                (set! return
                                  (call/cc (lambda (here)
                                             (return (cons here value)))))))))
                   (return (begin body ...))))))

             ;; trampoline
             (lambda ()
               (let
                 ((v (call/cc (lambda (cc) (next cc)))))
                 (if (pair? v)
                   (begin
                     (set! next (car v))
                     (cdr v)) v)))))))
))
