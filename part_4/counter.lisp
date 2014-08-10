(defparameter *counter* 0 
  "Counter to keep track of ....")

(defparameter *threshold* 4
  "Counter will be reset to zero when its value reaches this threshold.")

(defun counter-inc ()
  "Increment global counter by one."
  (if (>= (1+ *counter*) *threshold*)
      (setf *counter* 0)
    (incf *counter*)))

(defun counter-value ()
  "Return current value of global counter."
  *counter*)

(defun counter-threshold ()
  "Return current threshold of global counter."
  *threshold*)

(defun counter-set-threshold (th)
  "Set counter threshold to TH."
  (setf *threshold* th)
  (if (>= *counter* *threshold*)
      (setf *counter* 0))
  *threshold*)

(defun make-counter ()
  "Create a new instance of a counter object."
  (let ((counter 0))
    (list #'(lambda ()
        (incf counter))
    #'(lambda ()
        (setf counter 0)))))

(defun counter-increment (counter)
  "Increment counter."
  (funcall (first counter)))

(defun counter-reset (counter)
  "Reset counter."
  (funcall (second counter)))

(defun make-counter ()
  "Create a new instance of a counter object."
  (let ((counter 0))
    (list #'(lambda ()
        (incf counter))
    #'(lambda ()
        (setf counter 0)))))

(defun counter-increment (counter)
  "Increment counter."
  (funcall (first counter)))

(defun counter-reset (counter)
  "Reset counter."
  (funcall (second counter)))