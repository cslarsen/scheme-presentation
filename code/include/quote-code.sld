(define-library (quote-code)
  (import (scheme base)
          (scheme write))
  (export
    run
    code+result
    quote-code)
  (begin

    ;; Print "<code> ==> <result>"
    ;;
    (define-syntax run
      (syntax-rules ()
        ((_ body ...)
         (begin
           (display (code+result body ...))
           (newline)))))


    ;; Returns quoted code and its result
    ;;
    (define-syntax quote-code
      (syntax-rules ()
        ((_ body ...)
         (let
           ((code (quote body ...))
            (result (begin body ...)))
           (values code result)))))

    ;; Return string in form "code ==> result".
    ;;
    (define-syntax code+result
      (syntax-rules ()
        ((_ body ...)
         (call-with-values
           (lambda () (quote-code body ...))
           (lambda (code result)
             (call-with-port (open-output-string)
               (lambda (s)
                 (display code s)
                 (display " ==> " s)
                 (display result s)
                 (get-output-string s))))))))))
