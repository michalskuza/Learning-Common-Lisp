(defun make-stack ()
  (let ((stack nil))
    (list #'(lambda (x)
	      (push x stack))
	  #'(lambda ()
	      (pop stack))
	  #'(lambda ()
	      (null stack)))))

(defun stack-push (stack x)
  (funcall (first stack) x))

(defun stack-pop (stack)
  (funcall (second stack)))

(defun stack-empty-p (stack)
  (funcall (third stack)))
