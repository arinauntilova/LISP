(defun create-data (lst surname name patronymic salary age skill)
    (cons (list surname name patronymic salary age skill) lst)
)

(defun change-salary-all(lst param)
    (mapcar
        #'(lambda (x)
            (setf (cadddr x)(* param (cadddr x)))
        ) lst
    )
)

(defun change-salary-person (lst surname name patronymic param)
    (mapcar 
        #'(lambda (x)
            (if 
                (and 
                    (equal surname (car x))
                    (equal name (cadr x))
                    (equal patronymic (caddr x))
                )
                (setf (caddr x) (* param (cadddr x)))
            )
        ) lst

    )
)


(defun sum-salary (lst)
    (cond
        ((null lst) 0)
        (t (+ (car (cdddar lst)) (sum-salary (cdr lst))))
    )
)
