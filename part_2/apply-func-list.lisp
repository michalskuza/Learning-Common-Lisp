(defun apply-func-list (L X)
 (if (null L)
     X
    (funcall (first L) (apply-func-list (rest L) X))))
