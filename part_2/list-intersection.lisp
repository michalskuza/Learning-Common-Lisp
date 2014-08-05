(defun list-intersection (L1 L2)
   (remove-if-not #'(lambda (X) (and (member X L1) (member X L2))) L1))
