;;
;; Binary Trees
;;

;;
;; Constructors for binary trees
;;

(defun make-bin-tree-leaf (E)
  "Create a leaf."
  (list E))

(defun make-bin-tree-node (E B1 B2)
  "Create a node with element K, left subtree B1 and right subtree B2."
  (list E B1 B2))

;;
;; Selectors for binary trees
;;

(defun bin-tree-leaf-element (L)
  "Retrieve the element of a leaf L."
  (first L))

(defun bin-tree-node-element (N)
  "Retrieve the element of a node N."
  (first N))

(defun bin-tree-node-left (N)
  "Retrieve the left subtree of a node N."
  (second N))

(defun bin-tree-node-right (N)
  "Retrieve the right subtree of a node N."
  (third N))

;;
;; Recognizers for binary trees
;;

(defun bin-tree-leaf-p (B)
  "Test if binary tree B is a leaf."
  (and (listp B) (= (list-length B) 1)))

(defun bin-tree-node-p (B)
  "Test if binary tree B is a node."
  (and (listp B) (= (list-length B) 3)))


;; Searching Binary Trees

(defun bin-tree-member-p (B E)
  "Test if E is an element in binary tree B."
  (if (bin-tree-leaf-p B)
      (equal E (bin-tree-leaf-element B))
    (let
  ((elmt  (bin-tree-node-element B))
   (left  (bin-tree-node-left    B))
   (right (bin-tree-node-right   B)))
      (or (equal E elmt)
    (bin-tree-member-p left E)
    (bin-tree-member-p right E)))))

;; Binary tree reversion

(defun bin-tree-reverse (B)
  "Reverse binary tree B."
  (if (bin-tree-leaf-p B)
      B
    (let
  ((elmt  (bin-tree-node-element B))
   (left  (bin-tree-node-left    B))
   (right (bin-tree-node-right   B)))
      (make-bin-tree-node elmt
              (bin-tree-reverse right)
              (bin-tree-reverse left)))))

(defun bin-tree-preorder (B)
  "Create a list containing keys of B in preorder."
  (if (bin-tree-leaf-p B)
      (list (bin-tree-leaf-element B))
    (let
  ((elmt  (bin-tree-node-element B))
   (left  (bin-tree-node-left    B))
   (right (bin-tree-node-right   B)))
      (cons elmt
      (append (bin-tree-preorder left)
        (bin-tree-preorder right))))))

(defun fast-bin-tree-preorder (B)
  "A tail-recursive version of bin-tree-preorder."
  (preorder-aux B nil))

(defun preorder-aux (B A)
  "Append A to the end of the list containing elements of B in preorder."
  (if (bin-tree-leaf-p B)
      (cons (bin-tree-leaf-element B) A)
    (let
  ((elmt  (bin-tree-node-element B))
   (left  (bin-tree-node-left    B))
   (right (bin-tree-node-right   B)))
      (cons elmt
      (preorder-aux left
        (preorder-aux right A))))))