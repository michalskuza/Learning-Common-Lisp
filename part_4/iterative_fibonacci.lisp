(defun fibonacci (n)
  "Compute the N'th Fibonacci number."
  (do ((f1 0 f2)
       (f2 1 (+ f1 f2))
       (i  0 (1+ i)))
      ((= i n) f2)
      ; empty body
      ))

(defun fib (n)
  "Compute the N'th Fibonacci number."
  (let ((f1 0)
  (f2 1)
  (i  0))
    (loop
     (if (= i n)
   (return-from fib f2))
     ; empty body
     (psetf f1 f2
      f2 (+ f1 f2)
      i  (1+ i)))))