(defun myformat (x)
	(if (complexp x) 
		(format nil "root: ~,5F~,5@Fi" (realpart x) (imagpart x)) 
		(format nil "root: ~,5F" x) ))

(defun root (a b D)
	(/ (- D b) (* 2 a)) )

(defun result (x1 x2)
	(format nil "~A ~A" (myformat x1)(myformat x2)) )

(defun solve (a b c)
	(cond 	((and (not (zerop a)) (not (zerop c)))
				(let ((D (sqrt (- (* b b) (* 4 a c))) ) )						
					(result (root a b D) (root a b (- D)))  )
			)
			((zerop a)
				(cond	((not (zerop b))  (myformat (/ (- c) b)) )
						((and (zerop b) (not (zerop c)))  "no roots in R and C!"  )
						(T "infinite number of roots!")
				)			
			)
			(T (format nil "~A ~A" (myformat 0) (myformat (/ (- b) a) )   )  )
	)			
) 

#|
sbcl.exe
(load "equ_1.lsp")
|#



