(defun roll_dice ()
	(print (list (+ (random 6) 1) (+ (random 6) 1))) )

(defun check_abs_win (dice)
	(or (equal 7  dice )
		(equal 11 dice) ) )

(defun check_reroll (dice)
	(or (equal dice '(1 1)) (equal dice '(6 6)))
)

(defun check_state (dice)
	(cond ((check_abs_win (+ (first dice) (second dice)))  "Gamer absolutely win" ) #| абсолютная победа |#
		  ((check_reroll dice) (check_state (roll_dice) ) ) 						#| перебрасывание |#
		  (T (+ (first dice) (second dice)))	            						#| подсчет очков |#
	)
)

(defun turn_gamer()
	(let ((dice_first (roll_dice)))
		(let ((st (check_state dice_first)))
			(if (numberp st) st (and (print st) nil) ) ))
)

(defun game ()
	(print "first throw")
	(let ((first_sum  (turn_gamer)))		
		(if first_sum  
			(and (print "second throw")                      
				(let ((second_sum (turn_gamer)))				
					(if (and first_sum second_sum)
						(cond 	((> first_sum second_sum) (print "first win"))
								((< first_sum second_sum) (print "second win"))
								(T (print "dead heat"))
						)
					)
				)
			)
		)	
	)
	nil
)