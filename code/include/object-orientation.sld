(define-library (object-orientation)
  (import (scheme base)
          (scheme write))

  (export
    define-class
    define-object
    define-generic
    make-class
    make-object
    make-generic
    specialise!
    initialise
    <class>
    class-of
    is-a?
    get-arg
    slot-ref
    slot-set!
    member-accessor
    member-mutator
    write-class
    write-object
    class?
    object?)

  (include "bos.scm") ; Bryan's Object System
  (include "bos-macros.scm")
  (include "bos-utils.scm"))
