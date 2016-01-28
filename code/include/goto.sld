;; Usage:
;;
;; Create a named point in the code that we can return to later, even with
;; new values (if supplied).
;;
;; Usage:
;; (label 'name 'default-value)
;; (goto 'name 'new-value)
;; (goto 'name) ; no value is passed
;;
;; TODO: will (goto 'name) work with 'default-value above?
;;
(define-library (goto)
  (import (scheme base)
          (scheme case-lambda))
  (export
    label
    goto
    list-labels)
  (begin
    (define labels (list))

    (define (list-labels)
      labels)

    (define (found? label)
      (if (assq label labels) #t #f))

    (define (add! label cont)
      (set! labels (append labels (list (list label cont)))))

    (define label
      (case-lambda
        ((name value)
         (call/cc
           (lambda (here)
             (unless (found? name)
                (add! name here))
             value)))
        ((name) (label name #f))))

    (define (lookup name)
     (if (found? name)
       (cadr (assq name labels))
       (error "No such label")))

    (define goto
      (case-lambda
        ((name) ((lookup name)))
        ((name value) ((lookup name) value))))))
