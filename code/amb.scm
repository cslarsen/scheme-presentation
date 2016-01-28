; Shows how one can implement the amb ("ambiguous") operator in Scheme,
; otherwise known as non-deterministic programming.
;
; "Non-deterministic" simply means that we follow ALL code paths
; SIMULTANEOUSLY. Of course, we don't actually do this. Instead we use
; continuations as a stack of operations, providing us with backtracking.
;
; For more info, see examples from SICP, 4.3:
; http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-28.html#%_sec_4.3
;
; A good introduction on the amb operator can be found at
; http://matt.might.net/articles/programming-with-continuations--exceptions-backtracking-search-threads-generators-coroutines/
;
; One can use amb for searching w/backtracking, general non-deterministic
; programming, solving logic puzzles (basically a light-weight prolog
; engine), and more. A more powerful amb engine would be smarter about the
; backtracking and provide with more tools (if you know Prolog you know
; about cuts, etc.)

(import (scheme base)
        (scheme write)
        (amb))

(define (println . s)
  (for-each display s)
  (newline))

(define (an-element-of items)
  (require (not (null? items)))
  (amb (car items) (an-element-of (cdr items))))

(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

;; Keeps printing results until we run out of parameters.
(define-syntax try-again
  (syntax-rules ()
    ((_) (amb))))

(let
  ((a (amb 0 1 2 3 4 5 6 7 8 9 10))
   (b (amb 0 1 2 3 4 5 6 7 8 9 10)))
  (require (= (+ a b) 10)) ;; for these numbers, require that this holds
  (println a " + " b " = " (+ a b))
  (try-again))
