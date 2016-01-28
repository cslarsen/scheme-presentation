;; Taken from https://en.wikipedia.org/wiki/Continuation
;;
;; Implements coroutines (aka green threads), a form of
;; cooperative multitasking.
;;
;; Could quite easily add the following
;; - a better scheduler with, e.g., thread priorities
;; - multiplex onto kernel threads, if you have a real
;;   thread library.
;;
(define-library (green-threads)
  (import (scheme base)
          (scheme process-context))
  (export
    fork
    yield
    thread-exit)
  (begin
    (define queue '())

    (define (empty-queue?)
      (null? queue))

    (define (enqueue x)
      (set! queue (append queue (list x))))

    (define (dequeue)
      (let
        ((first (car queue))
         (rest (cdr queue)))
        (set! queue rest)
        first))

    ;; Starts a new thread runing (proc)
    (define (fork proc)
      (call/cc
        (lambda (k)
          (enqueue k)
          (proc))))

    ;; Yields the processor to another thread,
    ;; if there is one
    (define (yield)
      (call/cc
        (lambda (k)
          (enqueue k)
          ((dequeue)))))

    ;; Terminates current thread or entire program,
    ;; if there are no threads left.
    (define (thread-exit)
      (if (empty-queue?)
        (exit)
        ((dequeue))))))
