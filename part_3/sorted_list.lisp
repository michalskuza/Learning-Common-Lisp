(defun make-empty-sorted-list ()
  nil)

(defun sorted-list-empty-p (L)
  (null L))

(defun sorted-list-member-p (L E)
  (if (null L)
      nil
    (if (> E (first L))
	(sorted-list-member-p (rest L) E)
      (= E (first L)))))

(defun sorted-list-insert (L E)
  (if (null L)
      (list E)
    (if (> E (first L))
	(cons (first L) (sorted-list-insert (rest L) E))
      (if (= E (first L))
	  L
	(cons E L)))))

(defun sorted-list-remove (L E)
  (if (null L)
      nil
    (if (> E (first L))
	(cons (first L) (sorted-list-remove (rest L) E))
      (if (= E (first L))
	  (rest L)
	L))))
