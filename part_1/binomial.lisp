(defun binomial (N R)
   (if (or (zerop R) (= N R))
      1
    (+ (binomial (1- N) (1- R))
       (binomial (1- N) R )))
)
