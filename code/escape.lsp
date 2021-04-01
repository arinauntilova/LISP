#|(defun result (lst)
)|#

(defun get_elem (n1 n2 lst)
 (nth n1 (nth n2 lst))
)

(defun get_f_sec_go (lst len)
	(print (* (floor (/ len 2)) (max (get_elem 1 0 lst) (get_elem 1 1 lst))))
)

(defun get_f_sec_back_n (lst len)    ; нечетные
	;(print (floor (/ len 2)))
	(print (+ (* (floor (/ len 2.0)) (get_elem 1 0 lst)) (* (- (floor (/ len 2.0)) 1) (get_elem 1 1 lst)) ) )        ; СДЕЛАТЬ ЧИТАЕМОЙ !!!!
)

(defun get_f_sec_back (lst len)    ; четные
	(print (+ (* (- (/ len 2.0) 1) (get_elem 1 0 lst)) (* (- (/ len 2) 1) (get_elem 1 1 lst)) ) )        ; СДЕЛАТЬ ЧИТАЕМОЙ !!!!
)

;(defun get_rest_sum (lst len)	
;)

#|
(defun rec (num s)
	(if (>= num 3)
	(rec (- num 2) (+ s num))
	s
	)
)|#

(defun rec (num s lst)
	(if (>= num 3)
	(rec (- num 2) (+ s (get_elem 1 (- num 1) lst)) lst)
	(print s)
	)
)

(defun solve (lst)
	(let ((len (length lst)))
		;(print (floor (/ len 2.0)))
		(cond ((= len 0) Nil) 
			  ((= len 1) (get_elem 1 0 lst))
			  ((evenp len) (+ (get_f_sec_go lst len) (get_f_sec_back lst len) (rec len 0 lst)) )  ; четная длина
			  (T (+ (get_f_sec_go lst len) (get_f_sec_back_n lst len) (rec len 0 lst)))
		)	
	)
)

;;; ничего себе, я смог написать сортировку пузырём. на Lisp
#|
(defun bubble_move (lst)
  (cond
	((atom (cdr lst)) lst)
	((> (car lst) (cadr lst)) (cons (cadr lst) (bubble_move (cons (car lst) (cddr lst)))))
	(T lst)   
  )
)

(defun bubble (lst)
  (cond 
	((atom (cdr lst)) lst)
	(T (bubble_move (cons (car lst) (bubble (cdr lst)))))
  )
) |#

(defun escape (lst)
	(sort lst #'< :key #'cadr)
	(print lst)
	(solve lst)	
)