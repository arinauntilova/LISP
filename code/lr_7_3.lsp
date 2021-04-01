(defun update_el (lst i el)
    (cond 
        ((null lst) nil)
        ((= i 0) (cons el (cdr lst) ))
        (t (cons (car lst) (update_el (cdr lst) (- i 1) el)))
    )
)

(defun nth_r (lst k)
    (car (nthcdr lst k))
)

(defun swap-to-element (lst i j)
    (cond 
        ((null lst) nil)
        ((= i 0) (cons (nth j lst) (update_el lst j (car lst)) ))
        ((= j 0) (cons (nth i lst) (update_el lst i (car lst)) ))
        (t (cons (car lst) (swap-to-element (cdr lst) (- i 1) (- j 1))))
    )
)


