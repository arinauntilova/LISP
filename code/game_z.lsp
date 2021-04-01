(defun roll-dice () (print (list (+ (random 6) 1) (+ (random 6) 1))) )

(defun reroll-if-need (x)
	(if	(or	(equal x '(1 1))
			(equal x '(6 6)))
		(and (print "Reroll!") (roll-dice))
		x
	)
)
(defun roll () (reroll-if-need (roll-dice)) )

(defun roll-sum (r) (+ (first r) (second r)) )

(defun is-winner (res)
	(if	(or	(= res 7)
			(= res 11)
		)
		t
		nil
	)
)

(defun play ()
	(cond	(	(and	(print "First player:")
						(is-winner (setq p1 (roll-sum (roll))))
				)
				"First player won"
			)
			(	(and	(print "Second player:")
						(is-winner (setq p2 (roll-sum (roll))))
				)
				"Second player won"
			)
			((= p1 p2) "Tie!")
			((> p1 p2) "First player won")
			(t "Second player won")
	)
)
