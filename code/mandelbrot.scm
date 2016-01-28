(import (scheme base)
        (scheme write)
        (scheme complex))

(define max-iterations 50)
(define escape-radius #i2)

(define (println . s)
  (for-each display s)
  (newline))

(define (in-set? point)
  (define (loop z iterations)
    (cond
      ((> (magnitude z) (square escape-radius)) #f)
      ((> iterations max-iterations) #t)
      (else (loop (+ (square z) point)
                  (+ 1 iterations)))))
  (loop point 0))

(define (put-pixel z)
  (display (if (in-set? z) #\* #\ )))

(let*
  ((start  -2.0+i)
   (stop    1-i)
   (width  80)
   (height 22)
   (delta-re (make-rectangular
               (/ (real-part (- stop start)) width) 0))
   (delta-im (make-rectangular 0
               (/ (imag-part (- stop start)) height))))

  (do ((z start (+ z delta-im)))
      ((< (imag-part z) (imag-part stop)))
    (do ((z z (+ z delta-re)))
        ((> (real-part z) (real-part stop)))
      (put-pixel z))

    (newline)))
