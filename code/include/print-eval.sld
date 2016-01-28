(define-library (print-eval)
  (import (scheme base)
          (scheme write))
  (export print-eval)
  (begin

    ;; Print code and its result, e.g.
    ;;
    ;; (print-eval (+ 1 2 3))
    ;;
    ;; prints "(+ 1 2 3) ==> 6\n"
    ;;
    (define-syntax print-eval
      (syntax-rules ()
        ((_ body ...)
         (let
           ((code (quote body ...))
            (result (begin body ...)))
           (display code)
           (display " ==> ")
           (display result)
           (newline)))))))
