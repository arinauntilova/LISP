(defun f (num)
 (if (= (signum num) -1) (- num 1)  (+ num 1) )
)

(defun f1 (num)
 (if (< num 0) (- num 1)  (+ num 1) )
)

(defun ff (n1 n2 n3)
 (if (or (< n2 n1 n3) (< n3 n1 n2) ) T)
)