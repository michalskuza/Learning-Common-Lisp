;; Search iteration exercises

(defun find-long-list (L)
   (find-if #'(lambda (X) (= (list-length X) 3)) L))

(defun find-even-list (L)
   (find-if #'(lambda (X) (evenp (list-length X))) L))

(defun find-divisible-by-three (L)
   (find-if #'(lambda (X) (zerop (rem X 3))) L))
