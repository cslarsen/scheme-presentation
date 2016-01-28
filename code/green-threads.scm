(import (scheme base)
        (scheme write)
        (green-threads))

;; Stop after stop-n iterations
;;
(define (worker message stop-n)
  (lambda ()
    (let loop ((n 1))
      (for-each display (list message " n=" n))
      (newline)
      (if (< n stop-n)
        (begin
          (yield)
          (loop (+ 1 n)))
        (thread-exit)))))

(fork (worker "thread-A" 3))
(fork (worker "thread-B" 5))
(fork (worker "thread-C" 7))
(thread-exit)
