(defun create-table (lst lastname firstname middlename salary age rank)
    (cons (list lastname firstname middlename salary age rank) lst)
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

(defun count-salary (lst)
    (cond
        ((null lst) 0)
        (t (+ (car (cdddar lst)) (count-salary (cdr lst))) )
    )
)


;;; (update-salary-all (create-table '((A B C 4000 20 2)) 'D 'E 'M 5000 22 1) 3000)

;;; (update-salary-person (create-table '((A B C 4000 20 2)) 'D 'E 'M 5000 22 1) 3000 #'(lambda (x) (and (= 2 (nth 5 x) ))))

;;;(count-salary (create-table '((A B C 4000 20 2)) 'D 'E 'M 5500 22 1))