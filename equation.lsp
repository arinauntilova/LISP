(defun myformat (x)
	(format nil "root: ~,5F" x) )

(defun solve (a b c)
	(let ((D (- (* b b) (* 4 a c))))
		(cond 	((> D 0) 
                                ( format nil "~A ~A" 
					     (myformat (/ (- (sqrt D)     b) (* 2 a))  )     
					     (myformat (/ (- (- b) (sqrt D)) (* 2 a))  )     ))
			((= D 0) ( myformat( / (- b) (* 2 a) )  ))
			(T "not solve in R" ) ) ) ) 




#|	
(load "uravn.lsp")	


(/ (- b (sqrt D)) (* 2 a)) 
(/ (+ (- b) (sqrt D)) (* 2 a)) 

tests
(solve 1 2 1)
(solve 4 2 1)
(solve 1 3 1)

|#


