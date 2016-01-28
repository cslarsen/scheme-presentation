(define-library (with-files)
  (import (scheme base))

  (export
    with-files)

  (begin
    (define-syntax with-files
      (syntax-rules ()
        ((_
          ((file1 init1) ...)
          (close-procedure closer)
          body ...)
         (begin
           (let*
             ((file1 init1) ...)
             body ...
             (map closer (list file1 ...)))))))))
