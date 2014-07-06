Learning-Common-Lisp
====================

Learning Common Lisp using this course [Learning Lisp for CMPT 310](http://www2.cs.sfu.ca/CourseCentral/310/pwfong/Lisp/)

Loading 
   
* (load "testing.lisp") or
* (load "testing")
 

Compiling
   * (compile-file "testing.lisp")

Debugging
   * (trace factorial)

Binding
   * let  - parallel
   * let\* - sequential	

Constructors
   * cons
   * quote
   * '

Selectors
   * first   
   * rest

Recognizers
   * consp
   * null

Capturing the trace to a file 
   * (dribble "output.txt")
