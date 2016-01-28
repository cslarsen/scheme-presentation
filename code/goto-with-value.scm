;; Demonstrates goto-with-parameters.
;;
;; We can label a place in the code and return to it, with a new value.
;;
(import (scheme base)
        (print)
        (goto))

(begin
  (label 'default)
  (println
    (label 'text "Result: ")
    (* (label 'mul1 2)
       (label 'mul2 222)))) ; prints 444

(goto 'text "... and again: ") ; prints 444
(goto 'mul1 1/2) ; prints 111
