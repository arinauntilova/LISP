;;; НАТАША
(defun x_in_y_rec (lstx lsty)
	(cond  	((null lstx) t)
		(t  (if (member (car lstx) lsty)
			        (x_in_y (cdr lstx) lsty))) ))

(defun x_in_y (lstx lsty)
	(reduce #'eql (mapcar #'(lambda (x) (not (null (member x lsty)))) lstx)))

(defun set-equal (lstx lsty)
	(and (x_in_y lstx lsty)
		 (x_in_y lsty lstx)) )

(defun set-equal_rec (lstx lsty)
	(and (x_in_y_rec lstx lsty)
		 (x_in_y_rec lsty lstx)) )
		 
		 
		 ;;;======
		 
(defun is_subset(seta setb)
	(reduce #'(lambda (a x) (and a (member x setb))) seta :initial-value t)
)

(defun is_equal (seta setb)
	(and (is_subset seta setb) (is_subset setb seta))
	
)

;;;===========

(defun is_in_set(el search_set)
	(reduce #'(lambda (a b) (or a b))
		(mapcar #'(lambda (x) (equal el x)) search_set)
	)
)

; 1 (1 2)
(defun is_in_set(el search_set)
	(reduce #'(lambda (a x) (or a (equal el x))
		search_set :initial-value nil)
	)
)
