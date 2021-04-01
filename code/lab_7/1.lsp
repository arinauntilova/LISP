(defun my_reverse(lst)
	(reduce #'(lambda (res tmp) (cons tmp res)) lst :initial-value nil)
)

(defun is_pol(lst)
	(equal lst (my_reverse lst))
)

(defun my_rev_rec(lst rlst)
	(cond ((null lst) rlst)
		(t (my_rev_rec (cdr lst) (cons (car lst) rlst)))
	)
)
(defun is_pol_rec (lst) 
	(equal lst (my_rev_rec lst nil)))

;;; НАТАША
(defun palindrom (lst)
	(equal (reverse lst) lst)
)

(defun my_palindrom (lst)
	(reduce #'eql (mapcar #'= lst (reverse lst)))
)