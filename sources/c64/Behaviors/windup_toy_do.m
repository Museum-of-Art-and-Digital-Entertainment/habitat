;
;	windup_toy_do.m
;
;	Action code for the windup toy wind operation.
;	This is the 'do' behavior for the windup toy.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding toy to wind it
	    	sendMsg pointed_noid, MSG_WIND, 0
		getProp pointed, WINDUP_TOY_windLevel
		inca		; Increment wind count
		cmp #4
		if (geq) {	; Clamp at 4
			lda #4
		}
		putProp pointed	; Save new count
		lda #WINDUP_WOUND
		newImage pointed_noid
		rts
	}
	chainTo v_depends	; Punt to 'depends' if not holding

	actionEnd

