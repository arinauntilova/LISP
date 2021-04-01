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
	
(defun rec_str (num s lst str)
	;(print s)
	(if (>= num 3)
	(rec_str (- num 2) (+ s (get_elem 1 (- num 1) lst)) lst (concatenate 'string str (get_elem 0 (- num 1) lst) " + " (get_elem 0 (- num 2) lst) " go; "))  
	(and (print str) s) )  )

(defun solve (lst)
	(let ((len (length lst)))
		(cond ((= len 0) nil) 
			  ((= len 1) (get_elem 1 0 lst))
			  ;(t (and (+ (get_f_sec_go lst len) (get_f_sec_back lst len) (setq r (rec_str len 0 lst (concatenate 'string (get_elem 0 0 lst) "hi"))) ) r )   ) 
			  (t (and (setq r (rec_str len 0 lst (concatenate 'string (get_elem 0 0 lst) " + " (get_elem 0 1 lst) " go; " (get_elem 0 0 lst) " back; ")))
					(+ (get_f_sec_go lst len) (get_f_sec_back lst len) r) )   ) 
		)	
	)
)

(defun escape (lst)
	(print lst)
	(sort lst #'< :key #'cadr)
	(print lst)
	(let ((result (solve lst))) 
		(if (eql result nil) 
			(print "Incorrect list length") 
			(print result) )
	)		
)


;;; Тесты
(escape '(("a" 1) ("b" 2) ("c" 5) ("d" 10)))
(escape '(( )))

(escape '(("a" 1)))

(escape '(("a" 1) ("d" 2)))
(escape '(("a" 1) ("c" 3) ("d" 2)))
(escape '(("a" 1) ("c" 3) ("d" 2) ("b" 4)))
(escape '(("a" 1) ("c" 3) ("b" 4) ("d" 2) ("e" 5)))
(escape '(("a" 1) ("c" 3) ("d" 2) ("e" 5) ("b" 4) ("g" 7) ("m" 6) ("k" 8) ("d" 9)))
(escape '(("a" 1) ("c" 3) ("d" 2) ("e" 5) ("b" 4) ("g" 7) ("m" 6) ("k" 8) ("t" 10) ("d" 9)))




