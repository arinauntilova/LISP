(defun myformat (x)
	(format nil "root: ~,5F" x) )
	
(defun myformat_complex (x)
	(format nil "root: ~,5F ~,5@Fi" (realpart x) (imagpart x)))

#|
(defun solve (a b c)
	(let ((D (- (* b b) (* 4 a c))))
		(cond 	((> D 0) 
                                (format nil "~A ~A" 
					     (myformat (/ (- (sqrt D) b) (* 2 a))  )     
					     (myformat (/ (- (- b) (sqrt D)) (* 2 a))  )     ))
			((= D 0) ( myformat( / (- b) (* 2 a) )  ))
			(T "not solve in R" ) ) ) ) 
			
|#

(defun solve (a b c)
	(cond 	((and (not (= a 0)) (not (= c 0)))
				(let ((D (- (* b b) (* 4 a c))))
					(cond   ((> D 0) 
								#|(myformat '1)|#
								(format nil "~A ~A" 
									(myformat (/ (- (sqrt D) b) (* 2 a))  )     
									(myformat (/ (- (- b) (sqrt D)) (* 2 a))  )     
								)   									
							)
							((= D 0) ( myformat( / (- b) (* 2 a) )  )
								#|(myformat '2) |#
							)
							(T  #|(myformat '3)
								"not solve in R" |#
								(format nil "~A ~A" 
									(myformat_complex (/ (- (sqrt D) b) (* 2 a))  )     
									(myformat_complex (/ (- (- b) (sqrt D)) (* 2 a))  )     
								)   
							) 
					) 
				)
			)
			((= a 0)
				(cond	((not(= b 0))
							#|(myformat '4) |#
							(myformat( / (- c) b )  )
						)
						((and (= b 0) (not(= c 0)) ) 
							#|(myformat '6)|#
							"not solve in R"
						)
						(t 
							#|(myformat '7) |#
							"infinite number of roots"
						)
				)			
			)
			( t 
				#|(myformat '11) |#
				(format nil "~A ~A" 
									(myformat 0)     
									(myformat (/ (- b) a)  )     
				)   
			)
	)			
) 


#|	
(load "equation.lsp")	
|#


