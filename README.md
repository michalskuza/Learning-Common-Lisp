Learning-Common-Lisp
====================

Learning Common Lisp using this course [Learning Lisp for CMPT 310](http://www2.cs.sfu.ca/CourseCentral/310/pwfong/Lisp/)

Loading 
   
    (load "testing.lisp") or
    (load "testing")
 

Compiling

    (compile-file "testing.lisp")

Debugging

    (trace factorial)

Binding

    let  - parallel
    let\* - sequential	

Constructors

    cons
    quote
    '

Selectors

    first   
    rest

Recognizers

    consp
    null

Capturing the trace to a file 

    (dribble "output.txt")

Returning a list

    (list 1 2)    

driver/auxiliary functions and accumulator variables

Iterating through a list
   mapcar

Search iteration

   find-if

Filter iteration

   remove-if

Returning Multiple Values

   multiple-value-bind 
