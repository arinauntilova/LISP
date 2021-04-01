(defun my_sum_r(lst res)
	(cond
		((null lst) res)
		((numberp (car lst)) (my_sum_r (cdr lst)(+ res (car lst))))
		((listp (car lst)) (my_sum_r (cdr lst) (my_sum_r (car lst) res)))
		(t (my_sum_r (cdr lst) res))
	)
)


(defun my_sum (lst)
	(reduce #'(lambda (res x)
		(cond
			((numberp x) (+ res x))
			((listp x) (+ (my_sum x) res))
			(t res)
	)) lst :initial-value 0)
)