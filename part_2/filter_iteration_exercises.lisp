;; Filter iteration exercises

(defun list-remove-if (P L)
  (if (null L)
      nil
    (if (funcall P (first L))
	(list-remove-if P (rest L))
      (cons (first L) (list-remove-if P (rest L))))))

(defun list-difference (L1 L2)
  (remove-if #'(lambda (X) (member X L2)) L1))
