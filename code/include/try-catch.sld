(define-library (try-catch)
  (import (scheme base)
          (print))

  (export
    try)

  (begin
    (define-syntax try
      (syntax-rules (catch)
        ((try 
           (exception-handler handler)
           body ...
           (catch exception-catcher))
         (begin
           (define handler (lambda (error) #f)) ; default: do nothing
           (call/cc
             (lambda (exit)
               (set! handler
                 (lambda (error)
                   (exception-catcher error)
                   (exit)))
               body ...))))))))
