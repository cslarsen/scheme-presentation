#|

Canonical Hello, world in R7RS Scheme

To run this with chibi-scheme, just do

  $ chibi-scheme hello-world.scm

Another way to comment is to use #; which will ignore the next datum.

|#

(import (scheme base)
        (scheme write))

;; Print the message
(display "Hello, world!")
(newline)

