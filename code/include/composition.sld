(define-library (composition)
  (import (scheme base))
  (export
    compose
    compose-rl)
  (begin

    ;; Right-to-left composition, i.e.
    ;;
    ;; ((compose a b c) x) ==> (a (b (c x)))
    ;;
    (define-syntax compose-rl
      (syntax-rules ()
        ((compose-rl a b)
         (lambda (x)
           (a (b x))))
        ((compose-rl a b ...)
         (compose-rl a (compose-rl b ...)))))

    ;; Left-to-right composition, i.e.
    ;;
    ;; ((compose a b c) x) ==> (c (b (a x)))
    ;;
    (define-syntax compose
      (syntax-rules ()
        ((compose a b)
         (lambda (x)
           (b (a x))))
        ((compose a b ...)
         (compose a (compose b ...)))))))
