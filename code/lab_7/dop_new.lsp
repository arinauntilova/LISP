(defun create-info (lst lastname firstname middlename salary age skill)
    (cons (list lastname firstname middlename salary age skill) lst)
)

(defun create-table (lst1 lst2)
    (list lst1 lst2)
)

(defun update-salary-all(lst new_salary)
    (mapcar
        #'(lambda (x)
            (setf (cadddr x) new_salary)
        ) lst
    )
)

(defun update-salary-person (lst new_salary pred)
    (mapcar 
        #'(lambda (x)
            (if (funcall pred x)
                (setf (caddr x) new_salary)
            )
        ) lst
    )
)

#|
(defun update-salary-all_new(lst new_salary pred new_lst)
    (cond ((null lst) new_lst)
		  ((if (funcall pred x) (cons (create-info nil (caar lst) (cadar lst) (caddar lst) new_salary (car (cdddar lst)) (cadr (cdddar lst)) )  new_lst)      
												(cons (update-salary-all (cdr lst)) new_lst) )  )
		  (t (cons new_lst (car lst)) (update-salary-all (cdr lst) new_salary new_lst) )
	)
)|#


(defun sum-salary (lst)
    (cond
        ((null lst) 0)
        (t (+ (car (cdddar lst)) (sum-salary (cdr lst))) )
    )
)


;;; (update-salary-all (create-info '((Unt Ar Ol 4000 20 2)) 'Vetr 'Kate 'Ig 5500 22 1) 12000)
;;; (update-salary-person (create-info '((Unt Ar Ol 4000 23 2)) 'Vetr 'Kate 'Ig 5500 24 6) 12000 #'(lambda (x) (and (equal 'Vetr (car x)))))
;;;(sum-salary (create-info '((Unt Ar Ol 4000 23 2)) 'Vetr 'Kate 'Ig 5500 24 6))