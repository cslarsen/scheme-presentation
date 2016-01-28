(define-library (print)
  (import (scheme base)
          (scheme write))
  (export
    print
    println
    prints
    printsln)

  (begin
    (define (print . args)
      "Same as display, but takes multiple args."
      (for-each display args))

    (define (prints . args)
      "Same as print but adds a space between each arg."
      (for-each
        (lambda (s)
          (display s)
          (display " "))
        args))

    (define (println . args)
      "Same as print but adds a newline."
      (for-each display args)
      (newline))

    (define (printsln . args)
      "Same as prints but adds a newline."
      (for-each prints args)
      (newline))))
