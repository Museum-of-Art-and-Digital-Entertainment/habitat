;
;	generic_getMass.m
;
;	Action code for generic go-to-object-and-get-it operation that checks
;	 the mass of the object gotten.
;	This is the 'get' behavior for objects that vary in size.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	Mass in our world is binary: either a thing can be picked up or it
;	 can't!
;
	include	"action_head.i"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {				; Hand must be empty
		chainTo	v_beep
	}
	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there

	getProp pointed, GENERIC_mass
	if (zero) {				; Mass is either zero or one
		chore AV_ACT_bend_over
		sendMsg pointed_noid, MSG_GET, 0

		getResponse GET_SUCCESS
		if (!zero) {			; Non-zero is success
	            lda pointed_noid
	    	    jsr v_get_subject_object
	            changeContainers 0, AVATAR_HAND, actor_noid
		    lda #AV_ACT_bend_back
		    jsr v_set_actor_chore
	            rts
		}
	}
	lda #AV_ACT_bend_back
	jsr v_set_actor_chore
	chainTo	v_beep				; If we get here we failed

	actionEnd

