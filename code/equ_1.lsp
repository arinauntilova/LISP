(defun myformat (x)
	(format nil "root: ~,5F" x) )
	
(defun myformat_complex (x)
	(format nil "root: ~,5F~,5@Fi" (realpart x) (imagpart x)))

(defun solve (a b c)
	(cond 	((and (not (zerop a)) (not (zerop c)))
				(let ((D (- (* b b) (* 4 a c))))
					(cond   ((> D 0) 
								(format nil "~A ~A" 
									(myformat (/ (- (sqrt D) b) (* 2 a))  )     
									(myformat (/ (- (- b) (sqrt D)) (* 2 a))  )   )   									
							)
							((zerop D) ( myformat( / (- b) (* 2 a) )  )  )
							(T  (format nil "~A ~A" 
									(myformat_complex (/ (- (sqrt D) b) (* 2 a))  )     
									(myformat_complex (/ (- (- b) (sqrt D)) (* 2 a))  )    )   
							) 
					) 
				)
			)
			((zerop a)
				(cond	((not (zerop b))
							(myformat( / (- c) b )  )
						)
						((and (zerop b) (not (zerop c)))  "no roots in R and C!"  )
						(T "infinite number of roots!")
				)			
			)
			( T (format nil "~A ~A" 
					(myformat 0)     
					(myformat (/ (- b) a) )   )   
			)
	)			
) 

#|
sbcl.exe
(load "equ_1.lsp")
|#



