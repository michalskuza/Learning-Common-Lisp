(defun power (B E)
   (if (zerop E)
      B
     (* B (power B (- E 1))))
)
