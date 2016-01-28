;; Shows that one can implement object-orientation in Scheme.
;; We're using Bryan [O'Sullivan's] Object System (bos).
;;
(import (scheme base)
        (print)
        (object-orientation)) ; Bryan's [O'Sullivan] Object System

(define-class <point> (<class>) (x y))

(specialise! initialise <point>
  (lambda (call-next-method self . args)
    (call-next-method)
    (slot-set! self 'x (get-arg args 'x))
    (slot-set! self 'y (get-arg args 'y))))

(define-class <3dpoint> (<point>) (z))

(specialise! initialise <3dpoint>
  (lambda (call-next-method self . args)
    (call-next-method)
    (slot-set! self 'z (get-arg args 'z))))

(define-object point <3dpoint>
  'x 4
  'y 7
  'z 8)

(println "Here's a 3d point:")
(write-object point)
(newline)

(println "Changing x to 123:")
(slot-set! point 'x 123)
(write-object point)
(newline)
