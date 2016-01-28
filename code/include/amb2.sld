;; Taken from
;; http://matt.might.net/articles/programming-with-continuations--exceptions-backtracking-search-threads-generators-coroutines/
;;
(define-library (amb2)
  (import (scheme base))

  (export
    amb
    assert
    fail)

  (begin
    (define (current-continuation)
      (call/cc
        (lambda (cc)
          (cc cc))))

    (define fail-stack '())

    (define (fail)
      (if (not (pair? fail-stack))
        (error "back-tracking stack exhausted!")
        (begin
          (let ((back-track-point (car fail-stack)))
            (set! fail-stack (cdr fail-stack))
            (back-track-point back-track-point)))))

    (define (amb choices)
      (let ((cc (current-continuation)))
        (cond
          ((null? choices) (fail))
          ((pair? choices) (let ((choice (car choices)))
                             (set! choices (cdr choices))
                             (set! fail-stack (cons cc fail-stack))
                             choice)))))

    (define (assert condition)
      (if (not condition)
        (fail)
        #t))))
