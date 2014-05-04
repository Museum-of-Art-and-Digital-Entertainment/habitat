;
;	die_do.m
;
;	Action code for the die rolling operation.
;	This is the 'do' behavior for dice.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
	include	"action_head.i"

; This is the parameter returned by the ROLL request
define ROLL_STATE = 0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding die to roll it
	    	sendMsg pointed_noid, MSG_ROLL, 0
		getResponse ROLL_STATE
		putProp pointed, DIE_state
		newImage pointed_noid
		rts
	}
	chainTo v_depends	; Punt to 'depends' if not holding

	actionEnd

