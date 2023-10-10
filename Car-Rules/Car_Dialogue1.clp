(deffacts init
 (starter-turning null)
 (petrol null)
 (lights-working null) 
 (solenoid-click null)
 (terminals-clean null)
 (solenoid-fuse-ok null))

; ==================================== Question Asking rules ===========================================
 (defrule ask-starter
    (starter-turning null)
=> 
	(printout t "When you turn the key, does the starter motor turn? (yes/no) ")
	(bind ?answer (read))
	(assert (starter-turning ?answer)))
; -----------------------------------------------------------------------------------------------------
(defrule ask-petrol
	(petrol null)
    (starter-turning yes)
=> 
	(printout t "Is there petrol in the car? (yes or no): ")
	(bind ?answer (read))
	(assert (petrol ?answer)))
; -----------------------------------------------------------------------------------------------------
(defrule ask-lights
	(lights-working null)
    (starter-turning no)
=> 
	(printout t "Do the headlights work? (yes or no): ")
	(bind ?answer (read))
	(assert (lights-working ?answer)))
; -----------------------------------------------------------------------------------------------------
(defrule ask-solenoid-click
	(solenoid-click null)
    (lights-working yes)
=> 
	(printout t "Do you hear a clicking sound when turning the key? (yes or no): ")
	(bind ?answer (read))
	(assert (solenoid-click ?answer)))
; -----------------------------------------------------------------------------------------------------
(defrule ask-terminals
	(terminals-clean null)
    (solenoid-click yes)
=> 
	(printout t "Are the battery terminals clean? (yes or no): ")
	(bind ?answer (read))
	(assert (terminals-clean ?answer)))
; -----------------------------------------------------------------------------------------------------
(defrule ask-solenoid-fuse
	(solenoid-fuse-ok null)
    (solenoid-click no)
=> 
	(printout t "Is the solenoid fuse okay? (yes or no): ")
	(bind ?answer (read))
	(assert (solenoid-fuse-ok ?answer)))

; ===================================== Static Rules ============================================
(defrule decision-call-aa
	(starter-turning yes)
	(petrol yes)
=> 
	(printout t "Call the A.A." crlf))

(defrule decision-buy-petrol
	(starter-turning yes)
	(petrol no)
=> 
	(printout t "Buy some petrol!" crlf))	

(defrule decision-replace-starter
	(starter-turning no)
	(lights-working yes)
	(solenoid-click yes)
	(terminals-clean yes)
=> 
	(printout t "Replace Starter" crlf))			
	
(defrule decision-clean-terminals
	(starter-turning no)
	(lights-working yes)
	(solenoid-click yes)
	(terminals-clean no)
=> 
	(printout t "Clean Terminals" crlf))		

(defrule decision-replace-solenoid
	(starter-turning no)
	(lights-working yes)
	(solenoid-click no)
	(solenoid-fuse-ok yes)
=> 
	(printout t "Replace solenoid" crlf))	

(defrule decision-replace-fuse
	(starter-turning no)
	(lights-working yes)
	(solenoid-click no)
	(solenoid-fuse-ok no)
=> 
	(printout t "Replace fuse" crlf))		
	
(defrule decision-charge-battery
	(starter-turning no)
	(lights-working no)
=> 
	(printout t "Charge battery" crlf))	

; ============================== Exit Loop =====================================================

; (defrule exit-loop
; 	(starter-turning $?)
; 	(petrol $?)
; 	(lights-working $?)
; 	(solenoid-click $?)
; 	(terminals-clean $?)
; 	(solenoid-fuse-ok $?)
; 	(not (decision ?))
; =>
; 	(halt))

; (defrule print-decision
; 	?decision <- (decision ?)
; =>
; 	(printout t "The recommended action is: " ?decision crlf)
; 	(retract ?decision))
