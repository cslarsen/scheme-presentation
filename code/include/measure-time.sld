(define-library (measure-time)
  (import (scheme base)
          (scheme time)
          (print))
  (export
    measure-time
    report-time)
  (begin
    (define-syntax measure-time
      (syntax-rules ()
        ((_ body ...)
         (let*
           ((start (current-second))
            (value (begin body ...))
            (time-taken (- (current-second) start)))
           (values time-taken value)))))

    (define-syntax report-time
      (syntax-rules ()
        ((_ body ...)
         (let
           ((code (quote body ...)))
           (call-with-values
             (lambda () (measure-time body ...))
             (lambda (time value)
               (println code " ==> " value " (" time " secs)")
               value))))))))
