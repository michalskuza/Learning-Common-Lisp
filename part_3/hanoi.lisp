;;
;; A tower is a list of numbers
;;

(defun make-empty-tower ()
  "Create tower with no disk."
  nil)

(defun tower-push (tower disk)
  "Create tower by stacking DISK on top of TOWER."
  (cons disk tower))

(defun tower-top (tower)
  "Get the top disk of TOWER."
  (first tower))

(defun tower-pop (tower)
  "Remove the top disk of TOWER."
  (rest tower))

;;
;; Hanoi configuration
;;

(defun make-hanoi (from-tower aux-tower to-tower)
  "Create a Hanoi configuration from three towers."
  (list from-tower aux-tower to-tower))

(defun hanoi-tower (hanoi i)
  "Select the I'th tower of a Hanoi construction."
  (nth (1- i) hanoi))

;;
;; Utilities
;;

(defun hanoi-tower-update (hanoi i tower)
  "Replace the I'th tower in the HANOI configuration by tower TOWER."
  (cond
   ((= i 1) (make-hanoi tower (second hanoi) (third hanoi)))
   ((= i 2) (make-hanoi (first hanoi) tower (third hanoi)))
   ((= i 3) (make-hanoi (first hanoi) (second hanoi) tower))))

(defun hanoi-tower-top (hanoi i)
  "Return the top disk of the I'th tower in the HANOI configuration."
  (tower-top (hanoi-tower hanoi i)))

(defun hanoi-tower-pop (hanoi i)
  "Pop the top disk of the I'th tower in the HANOI configuration."
  (hanoi-tower-update hanoi i (tower-pop (hanoi-tower hanoi i))))

(defun hanoi-tower-push (hanoi i disk)
  "Push DISK into the I'th tower of the HANOI configuration."
  (hanoi-tower-update hanoi i (tower-push (hanoi-tower hanoi i) disk)))

;;
;; Operator: move top disk from one tower to another
;;

(defun move-disk (from to hanoi)
  "Move the top disk from peg FROM to peg TO in configuration HANOI."
  (let
      ((disk               (hanoi-tower-top hanoi from))
       (intermediate-hanoi (hanoi-tower-pop hanoi from)))
    (hanoi-tower-push intermediate-hanoi to disk)))

;;
;; Subgoal: moving a tower from one peg to another
;;

(defun move-tower (N from aux to hanoi)
  "In the HANOI configuration, move the top N disks from peg FROM to peg TO using peg AUX as an auxiliary peg."
  (if (= N 1)
      (move-disk from to hanoi)
    (move-tower (- N 1) aux from to 
		(move-disk from to
			   (move-tower (- N 1) from to aux hanoi)))))

;;
;; Driver function
;;

(defun solve-hanoi (N)
  "Solve the Tower of Hanoi problem."
  (move-tower N 1 2 3 (make-hanoi (make-complete-tower N) nil nil)))

(defun make-complete-tower (N)
  "Create a tower of N disks."
  (make-complete-tower-aux N (make-empty-tower)))

(defun make-complete-tower-aux (N A)
  "Push a complete tower of N disks on top of tower A."
  (if (zerop N)
      A
    (make-complete-tower-aux (1- N) (tower-push A N))))