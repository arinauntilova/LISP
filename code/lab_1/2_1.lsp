;2 element
(car (cdr '((A) (B C D))))
(cadr '(A B C D E))
;3 element
(car (cdr (cdr '((A) (B C D) S))))
(caddr '(A B C D E))
;4 element
(car (cdr (cdr (cdr '(A (B C D) (S (E F)) K)))))
(cadddr '(A B C D E))