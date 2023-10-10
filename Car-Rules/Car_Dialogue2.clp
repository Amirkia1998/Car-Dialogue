(deffacts init
(initial-fact))

; this rule is not needed anymore in the new version of the interpreter
(defrule start
	?adr <- (initial-fact)	;check if initial fact is in memmory (if yes returns true)
=> 
	(assert (start))	;assert variable start
	(retract ?adr)		;retract initial-fact from memmory so that next time we restart the program, we can pass the start rule 
	(printout t crlf "Let's diagnose your car" crlf crlf)
	)
	
(defrule check-starter
	?adr <- (start)	
	(not (starter ?)) ; checking if (starter) status was given. (starter ?) is false. "not" makes it true. so we pass to the then part 
=> 
	(printout t "Starter working (y/n)? ")
	(retract ?adr)	; retract start from memmory so that next time we restart the program, there is no start variable in the memmory  
	(assert (starter (read))))

(defrule check-petrol
	(starter y)	
	(not (petrol ?))
=>
	(printout t "Got any petrol? (y/n) ")
	(assert (petrol (read))))	
	
(defrule call-aa
	?adr1 <- (starter y)
	?adr2 <- (petrol y)
=>
	(printout t "Call the AA" crlf)
	(retract ?adr1 ?adr2)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule
	
(defrule buy-petrol
	?adr1 <- (starter y)
	?adr2 <- (petrol n)
=>
	(printout t "Buy some petrol!" crlf)
	(retract ?adr1 ?adr2)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule	
			
(defrule lights
	(starter n)
	(not (lights ?))
=> 
	(printout t "Lights working? (y/n) ")
	(assert (lights (read))))

(defrule solenoid
	(starter n)
	(lights y)
	(not (solenoid ?))
=> 
	(printout t "Solenoid click? (y/n) ")
	(assert (solenoid (read))))
	
(defrule terminals
	(starter n)
	(lights y)
	(solenoid y)
	(not (terminals ?))
=> 
	(printout t "Terminals clean? (y/n) ")
	(assert (terminals (read))))

(defrule replace-starter
	?a1 <- (starter n)
	?a2 <- (lights y)
	?a3 <- (solenoid y)
	?a4 <- (terminals y)
=>	
	(printout t "Replace starter!" crlf)
	(retract ?a1 ?a2 ?a3 ?a4)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule
			
(defrule clean-terminals
	?a1 <- (starter n)
	?a2 <- (lights y)
	?a3 <- (solenoid y)
	?a4 <- (terminals n)
=>	
	(printout t "Clean terminals!" crlf)
	(retract ?a1 ?a2 ?a3 ?a4)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule	
	
(defrule solenoid-fuse
	(starter n)
	(lights y)
	(solenoid n)
	(not (solenoid-click ?))
=> 
	(printout t "Solenoid fuse OK? (y/n) ")	
	(assert (solenoid-click (read))))

(defrule replace-solenoid
	?a1 <- (starter n)
	?a2 <- (lights y)
	?a3 <- (solenoid n)
	?a4 <- (solenoid-click y)
=>
	(printout t "Replace solenoid" crlf)
	(retract ?a1 ?a2 ?a3 ?a4)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule	
	
(defrule replace-fuse
	?a1 <- (starter n)
	?a2 <- (lights y)
	?a3 <- (solenoid n)
	?a4 <- (solenoid-click n)
=>
	(printout t "Replace fuse" crlf)
	(retract ?a1 ?a2 ?a3 ?a4)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule	
	
(defrule charge-battery
	?a1 <- (starter n)
	?a2 <- (lights n)
=> 
	(printout t "Charge battery! " crlf)
	(retract ?a1 ?a2)
	(assert (initial-fact))) ;it is like an endless loop. so that next time we run the program, we can pass the first rule	