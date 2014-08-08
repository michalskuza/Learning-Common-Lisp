(defun make-empty-BST ()
  "Create an empty BST."
  nil)

(defun BST-empty-p (B)
  "Check if BST B is empty."
  (null B))

(defun BST-member-p (B E)
  "Check if E is a member of BST B."
  (if (BST-empty-p B)
      nil
    (BST-nonempty-member-p B E)))

(defun BST-nonempty-member-p (B E)
  "Check if E is a member of nonempty BST B."
  (if (bin-tree-leaf-p B)
      (= E (bin-tree-leaf-element B))
    (if (<= E (bin-tree-node-element B))
	(BST-nonempty-member-p (bin-tree-node-left B) E)
      (BST-nonempty-member-p (bin-tree-node-right B) E))))

(defun BST-insert (B E)
  "Insert E into BST B."
  (if (BST-empty-p B)
      (make-bin-tree-leaf E)
    (BST-nonempty-insert B E)))

(defun BST-nonempty-insert (B E)
  "Insert E into nonempty BST B."
  (if (bin-tree-leaf-p B)
      (BST-leaf-insert B E)
    (let ((elmt  (bin-tree-node-element B))
	  (left  (bin-tree-node-left    B))
	  (right (bin-tree-node-right   B)))
      (if (<= E (bin-tree-node-element B))
	  (make-bin-tree-node elmt
			      (BST-nonempty-insert (bin-tree-node-left B) E)
			      right)
	(make-bin-tree-node elmt
			    left
			    (BST-nonempty-insert (bin-tree-node-right B) E))))))

(defun BST-leaf-insert (L E)
  "Insert element E to a BST with only one leaf."
  (let ((elmt (bin-tree-leaf-element L)))
    (if (= E elmt)
	L
      (if (< E elmt)
	  (make-bin-tree-node E
			      (make-bin-tree-leaf E)
			      (make-bin-tree-leaf elmt))
	(make-bin-tree-node elmt
			    (make-bin-tree-leaf elmt)
			    (make-bin-tree-leaf E))))))

(defun BST-remove (B E)
  "Remove E from BST B."
  (if (BST-empty-p B)
      B
    (if (bin-tree-leaf-p B)
	(BST-leaf-remove B E)
      (BST-node-remove B E))))

(defun BST-leaf-remove (L E)
  "Remove E from BST leaf L."
  (if (= E (bin-tree-leaf-element L))
      (make-empty-BST)
    L))

(defun BST-node-remove (N E)
  "Remove E from BST node N."
  (let
      ((elmt  (bin-tree-node-element N))
       (left  (bin-tree-node-left    N))
       (right (bin-tree-node-right   N)))
    (if (<= E elmt)
	(if (bin-tree-leaf-p left)
	    (if (= E (bin-tree-leaf-element left))
		right
	      N)
	  (make-bin-tree-node elmt (BST-node-remove left E) right))
      (if (bin-tree-leaf-p right)
	  (if (= E (bin-tree-leaf-element right))
	      left
	    N)
	(make-bin-tree-node elmt left (BST-node-remove right E))))))
