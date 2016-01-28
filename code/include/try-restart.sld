(define-library (try-restart)
  (import (scheme base)
          (print))

  (export
    try)

  (begin
    (define-syntax try
      (syntax-rules (catch)
        ((try 
           (exception-handler handler)
           (restart-handler the-restart)
           body ...
           (catch exception-catcher))
         (begin
           (define handler (lambda (error) #f)) ; default: do nothing
           (define the-restart #f); default
           (call/cc
             (lambda (exit) ; exit try-scope

               (set! handler
                 (lambda (error)
                   (call/cc
                     (lambda (current-restart)
                       (set! the-restart current-restart)
                       (exception-catcher error)
                       (exit))))) ; handler

               (begin body ...)))))))))
