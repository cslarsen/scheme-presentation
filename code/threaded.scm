;; We previously showed how to do cooperative multighreading.
;; It required the programmer to explicitly insert (yield)
;; statements. Here is a macro that does it automatically
;; (untested)
;;
(import (scheme base)
        (scheme write))

(define (println . s)
  (for-each display s)
  (newline))

(define-syntax yield
  (syntax-rules ()
    ((_ expr ...)
     (begin
       (println "yield " (quote expr ...))
       expr ...))))

;; takes (a b c ...) expression and
;; turns into ((yield a) (yield b) (yield c) ...)
;;
;; TODO: Handlie sublists, as in
;;       ((a b) c ...) ==> (((yield a) (yield b)) (yield c) ...)
;;
;; Though, that MAY be a problem with special forms such
;; as (let ((a 1)) ...) because it would be syntactic error
;; to do ((yield let) ...) etc.
;;
(define-syntax begin-threaded
  (syntax-rules ()
    ((_ a)
     (yield a))
    ((_ a b ...)
     (begin
       (yield a)
       (begin-threaded b ...)))))


(begin-threaded
  (define a 1)
  (println "a1 = " a)
  (set! a 12)
  (println "a2 = " a)
  (println "a*a = " (* a a)))
