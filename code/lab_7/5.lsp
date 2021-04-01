(defun set_and_get_i (lst i x)
	(cond	((null lst) nil)
			((= i 0) 	(let ((y (car lst))) 
							(setf (car lst) x) y) )
			(t (set_and_get_i (cdr lst) (- i 1) x))
	)
)


(defun swap_two_element (lst i j)
	(cond	((null lst) nil)
			((= i 0) 	(setf (car lst) (set_and_get_i lst j (car lst))))
			((= j 0) 	(setf (car lst) (set_and_get_i lst i (car lst))))
			(t (swap_two_element (cdr lst) (- i 1) (- j 1)))
	)
	lst
)



;;; ================

(defun insert_elem (elem list)
	(cond
		((null list) (cons elem nil))
		((< elem (car list)) (cons elem list))
		(t (cons (car list) (insert_elem elem (cdr list))))
	)
)
(defun my_sort (list)
	(reduce
		#'(lambda (sorted tmp)
		(insert_elem tmp sorted)
		) list)
)


(defun select-between (lst left right) 
	(my_sort (remove-if #'(lambda (x) (or (< x left) (> x right))))
	lst) 
)
