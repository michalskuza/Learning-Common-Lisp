(defun bin-tree-size (B)
  (if (bin-tree-leaf-p B)
      1
    (+ 1 
       (bin-tree-size (bin-tree-node-left B)) 
       (bin-tree-size (bin-tree-node-right B)))))

(defun bin-tree-postorder (B)
  (if (bin-tree-leaf-p B)
      (list (bin-tree-leaf-element B))
    (let
	((elmt  (bin-tree-node-element B))
	 (left  (bin-tree-node-left    B))
	 (right (bin-tree-node-right   B)))
      (append (bin-tree-postorder left)
	      (append (bin-tree-postorder right)
		      (cons elmt nil))))))

(defun fast-bin-tree-postorder (B)
  (postorder-aux B nil))

(defun postorder-aux (B A)
  (if (bin-tree-leaf-p B)
      (cons (bin-tree-leaf-element B) A)
    (let
	((elmt  (bin-tree-node-element B))
	 (left  (bin-tree-node-left    B))
	 (right (bin-tree-node-right   B)))
      (postorder-aux left
		     (postorder-aux right 
				    (cons elmt A))))))

(defun bin-tree-inorder (B)
  (if (bin-tree-leaf-p B)
      (list (bin-tree-leaf-element B))
    (let
	((elmt  (bin-tree-node-element B))
	 (left  (bin-tree-node-left    B))
	 (right (bin-tree-node-right   B)))
      (append (bin-tree-inorder left) 
	      (cons elmt
		    (bin-tree-inorder right))))))

(defun fast-bin-tree-inorder (B)
  (inorder-aux B nil))

(defun inorder-aux (B A)
  (if (bin-tree-leaf-p B)
      (cons (bin-tree-leaf-element B) A)
    (let
	((elmt  (bin-tree-node-element B))
	 (left  (bin-tree-node-left    B))
	 (right (bin-tree-node-right   B)))
      (inorder-aux left
		   (cons elmt
			 (inorder-aux right A))))))

