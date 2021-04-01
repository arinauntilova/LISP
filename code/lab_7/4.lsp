(defun my_reverse(lst)
(reduce
#'(lambda (res tmp)
(cons tmp res)
) lst :initial-value nil
)
)

(defun swap-first-last (list)
	(reduce
		#'(lambda (result tmp)
			(cond 
				((equal (length result) (- (length list) 1))   (my_reverse (cons (car list) result)))
				( t (cons tmp result ))
			)
		) (cdr list) :initial-value (last list)
	)
)


;;; NATASHA

(defun set_and_get_last (lst x)
	(cond	((null (cdr lst)) 	(let ((y (car lst))) 
									(setf (car lst) x)
									y
								)
			)
			(t (set_and_get_last (cdr lst) x))
	)
)


(defun swap_first_last (lst)
	(setf (car lst) (set_and_get_last (cdr lst) (car lst))) 
	lst
)