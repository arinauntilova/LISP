(defun find_by_func(val lst)
	(find-if #'(lambda (x) x)
		(mapcar #'(lambda (pair) 
			(cond 
				((equal (car pair) val) (cdr pair)) 
				((equal (cdr pair) val) (car pair)) 
			)
		) lst)
	)
)

(defun find_by_func(val lst)
	(find-if #'(lambda (pair)
			(cond 
				((equal (car pair) val) (cdr pair)) 
				((equal (cdr pair) val) (car pair)) 
			)
		) lst)
)

(defun find_by_func_r (val lst)
	(cond ((null lst) nil)
		((equal (caar lst) val) (cdar lst))
		((equal (cdar lst) val) (caar lst))
		(t (find_by_func_r val (cdr lst)))
	)
)


(find_by_func `moscow `( (russia . moscow) ( italy . rim )))