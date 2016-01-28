(define-library (memoization)
  (import (scheme base)
          (scheme write)
          (srfi 69))
  (export
    define-memoize
    lambda-memoize)
  (begin
    (define-syntax lambda-memoize
      (syntax-rules ()
        ((_ (arg ...) body ...)
         (let
           ((table (make-hash-table equal?)))
           (lambda (arg ...)
             (let ((key (list arg ...)))
               (if (hash-table-exists? table key)
                 (hash-table-ref table key)
                 (let
                   ((value (begin body ...)))
                   (hash-table-set! table key value)
                    value))))))))

    (define-syntax define-memoize
      (syntax-rules ()
        ((_ (name arg ...) body ...)
         (define name
           (lambda-memoize (arg ...)
              (begin body ...))))))
    
    ))
