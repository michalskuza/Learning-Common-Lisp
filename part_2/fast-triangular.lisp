(defun fast-triangular (N)
  (fast-triangular-aux N 1))

(defun fast-triangular-aux (N A)
  (if (= N 1)
      A
    (fast-triangular-aux (1- N) (+ N A))))
