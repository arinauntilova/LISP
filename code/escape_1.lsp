(defun get_elem (n1 n2 lst)
 (nth n1 (nth n2 lst)) )

(defun get_f_sec_go (lst len)
	(* (floor (/ len 2)) (max (get_elem 1 0 lst) (get_elem 1 1 lst)))  )

(defun get_f_sec_back (lst len)    ; все
	(let ((half_len (floor (/ len 2)))  
		  (first_el (get_elem 1 0 lst))
		  (sec_el (get_elem 1 1 lst))
		 )
		(let ((result (+ (* (- half_len 1) first_el) (* (- half_len 1) sec_el))) ) 
			(if (evenp len) result (+ result first_el)) )		
	)
)

(defun rec (num s lst)
	(if (>= num 3)
	(rec (- num 2) (+ s (get_elem 1 (- num 1) lst)) lst)  s)  )

(defun solve (lst)
	(let ((len (length lst)))
		(cond ((= len 0) nil) 
			  ((= len 1) (get_elem 1 0 lst))
			  (t (+ (get_f_sec_go lst len) (get_f_sec_back lst len) (rec len 0 lst)) ) 
		)	
	)
)

(defun escape (lst)
	(print lst)
	(sort lst #'< :key #'cadr)
	
	(let ((result (solve lst))) 
		(if (eql result nil) 
			(print "Incoreect list length") 
			(print result) )
	)		
)


;;; Тесты
(escape '((a 1) (b 2) (c 5) (d 10)))
(escape '(( )))
(escape '((a 1)))
(escape '((a 1) (d 2)))
(escape '((a 1) (c 3) (d 2)))
(escape '((a 1) (b 4) (c 3) (d 2)))
(escape '((a 1) (b 4) (c 3) (d 2) (e 5)))
(escape '((a 1) (b 4) (c 3) (d 2) (e 5) (g 7) (m 6) (k 8) (d 9)))
(escape '((a 1) (b 4) (c 3) (d 2) (e 5) (g 7) (m 6) (k 8) (t 10) (d 9)))



