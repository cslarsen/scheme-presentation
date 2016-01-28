(define-library (lazy-evaluation)
  (import (scheme base))

  (export
    delay-computation
    force-computation)

  (begin
    (define-syntax delay-computation
      (syntax-rules ()
        ((_ thunk)
         (list 'delayed (lambda () thunk)))))

    (define (force-computation delayed)
      (if (and (list? delayed)
               (eq? (car delayed) 'delayed))
        ((cadr delayed))
        (error "Not a delayed computation")))))
