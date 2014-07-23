(defun fast-power (B E)
   (fast-power-aux B E 1))

(defun fast-power-aux (B E A)
   (if (zerop E)
	A
   (fast-power-aux B (1- E) (* B A))))
