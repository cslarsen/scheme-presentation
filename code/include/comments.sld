(define-library (comments)
  (import (scheme base))
  (export
    comment
    uncomment)
  (begin
    (define-syntax comment
      (syntax-rules ()
        ((comment body ...)
         (begin))))

    ;; Works because macros are expanded from the outside and in, unlike
    ;; evaluation, which is a depth-first traversal.
    ;;
    ;; Notice we explicitly match (uncomment (comment body ...))
    ;;                                        ^^^^^^^
    (define-syntax uncomment
      (syntax-rules ()
        ((uncomment (comment body ...))
         (begin body ...))))))
