(defun factorial (N)
  (if (= N 1)
      1
    (* N (factorial (- N 1)))))
