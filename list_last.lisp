(defun list-last (L)
   (if (null L)
      nil
     (if (null (rest L))
       L 
       (list-last (rest L)))))
