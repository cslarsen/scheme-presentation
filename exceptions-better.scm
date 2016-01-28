;; Shows an exception mechanism implemented with call/cc and macros
;; By Christian Stigen Larsen

(import (scheme base)
        (scheme write))

(define (println . args)
  (for-each display args)
  (newline))

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
           body ...))))))

(println  "--start--")

(try
  (exception-handler oops)

  (define (divide a b)
    (if (zero? b)
      (oops "Division by zero")
      (println a "/" b " = " (inexact (/ a b)))))

  (divide 10 2)
  (divide 1 3)
  (divide 3 0)
  (println "This should not execute")

  (catch
    (lambda (error)
      (println "We caught an error: " error))))

(println "--end--")
