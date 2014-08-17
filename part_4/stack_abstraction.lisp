(defparameter *stack* nil)

(defun global-stack-push (x)
  (push x *stack*))

(defun global-stack-pop ()
  (pop *stack*))

(defun global-stack-empty-p ()
  (null *stack*))
