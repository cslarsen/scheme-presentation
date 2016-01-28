R7RS Scheme implementation of common language features
======================================================

This project provides examples on how one can easily implement features from
other programming languages, in pure Scheme code.

Running the examples
--------------------

You need an R7RS-capable scheme.  I've used chibi-scheme:

    $ chibi-scheme -Iinclude hello-world.scm

Building your own modules
-------------------------

Modules must have the extension .sld and names and directories must be in
the form (some module name) --> "include/some/module/name.scm"


Author
------

Written by Christian Stigen Larsen (except the object-system)

License
-------

All code is put in the public domain by the author.
I would be happy to be credited, should you use the code for anything.

TODO
----

- Add rethrow in exception handling
- Use a stack for the exception handler, to allow nesting.
