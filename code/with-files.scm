(import (scheme base)
        (scheme file)
        (scheme cxr)
        (print)
        (with-files))

(define (open-file name)
  (println "Opening " name)
  `((file) ,(open-input-file name) ,name)) ; return file handle and name

(define (close-file file)
  (let
    ((name (caddr file))
     (handle (cadr file)))

    (print "Closing " name)
    (close-input-port handle)

    (println ", is port closed? "
      (if (input-port-open? handle) "No" "Yes"))))

(define (read-file file)
  (let
    ((name (caddr file))
     (handle (cadr file)))
    (println "Reading " name ": " (read-line handle))))

(with-files
  ((foo (open-file "FOO.txt"))
   (bar (open-file "BAR.txt")))

  (close-procedure close-file)

  (read-file foo)
  (read-file bar))
