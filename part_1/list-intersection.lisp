(defun list-intersection (L1 L2)
  "Return a list containing elements belonging to both L1 and L2."
  (cond
   ((null L1) nil)
   ((member (first L1) L2) 
    (cons (first L1) (list-intersection (rest L1) L2)))
   (t (list-intersection (rest L1) L2))))
