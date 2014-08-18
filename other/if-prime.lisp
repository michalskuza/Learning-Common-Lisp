(defun is-prime(N)
  (let 
    ((R (floor (/ N 2))))
      (is-prime-aux N R)))

(defun is-prime-aux(N A)
  (if (= 1 A) 
    T
    (if (zerop (rem N A))
       NIL
       (is-prime-aux N (1- A)))))
