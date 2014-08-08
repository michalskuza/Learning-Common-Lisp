(defun fast-list-length (L)
   (fast-list-length-aux L 0))

(defun fast-list-length-aux (L A)
   (if (null L)
      A
      (fast-list-length-aux (rest L) (1+ A))))
