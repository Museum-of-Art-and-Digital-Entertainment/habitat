;
;	fortune_machine_put.m
;
;	Action code for the pay-for-a-fortune operation.
;	This is the 'put' behavior for the fortune machine.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
; This is the value returned by the coinop function
define COINOP_SUCCESS 	=	0
define COINOP_price = 1
define Fortune = 3

	include	"action_head.i"

	actionStart

	doMyAction	FORTUNE_COINOP
	getarg	COINOP_SUCCESS
	if (!zero) {
		addwwb source, response_data, #Fortune
		moveb	pointed_noid, actor_noid	; who's talking
		jsr	v_balloonMessage
		getProp	pointed, OBJECT_animation_state
		cmp	#PARKING_METER_grSTATE
		if (equal) {
		    complexSound	PARKING_METER_CRANK
		} else {
		    complexSound	FORTUNE_DISPENSED
		}
	}
	rts

	actionEnd
