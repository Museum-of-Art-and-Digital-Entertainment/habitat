;
;	teleport_booth_put.m
;
;	Action code for the pay-for-teleport operation.
;	This is the 'put' behavior for the teleport booth.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

; This is the value returned by the coinop function
define COINOP_SUCCESS	=	0

	doMyAction	ACTION_GO
	waitWhile	animation_wait_bit

	getProp pointed, TELEPORT_state
	if (zero) {		; Don't pay for an already active booth!
		doMyAction TELEPORT_COINOP
		getArg	COINOP_SUCCESS
		if (!zero) {
			complexSound	TELEPORT_ACTIVATES
			lda	#TELEPORT_ACTIVE
			putProp pointed, TELEPORT_state
		}
		rts
	}
	chainTo v_beep		; Complain on failure

	actionEnd
