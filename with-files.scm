;; Example on how to do resource management
;; By Christian Stigen Larsen

(cond-expand
  (r7rs
    (import (scheme base)
            (scheme write)))
  (else
    (begin)))

(define (println . args)
  (for-each display args)
  (newline))

(define (open-file name)
  (println "Open " name)
  `((filea) ,name))

(define (close-file file)
  (println "Close " (cadr file)))

(define (read-file file)
  (println "Read " (cadr file)))

(define-syntax with-files
  (syntax-rules ()
    ((_
      ((file1 init1) ...)
      body ...)
     (begin
       (let*
         ((file1 init1) ...)
         body ...
         (map close-file (list file1 ...)))))))

(with-files
  ((foo (open-file "foo.txt"))
   (bar (open-file "bar.txt")))
  (read-file foo)
  (read-file bar))
