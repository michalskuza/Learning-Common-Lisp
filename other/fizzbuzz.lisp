(defun fizzbuzz ()
   (fizzbuzz-aux 1))

(defun fizzbuzz-aux (N)   
  (cond     
    ((AND (zerop (rem N 3)) (zerop (rem N 5)))
      (print 'fizzBuzz))   
      ((zerop (rem N 3))
   		(print 'Fizz))      
   	((zerop (rem N 5))
   		(print 'Buzz))      	
    (T (print N)))

  (if (< N 100)     	  
    (fizzbuzz-aux (+ N 1))
    ()))
