;
;	generic_goToAndGet.m
;
;	Action code for generic go-to-object-and-get-it operation.
;	This is the default 'get' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {				; Hand must be empty
	    chainTo	v_beep			; If we get here we failed
	}
	    containerAbort
	    doMyAction ACTION_GO		; My GO walks to this object
	    waitWhile animation_wait_bit	; Wait till we get there

	    chore AV_ACT_bend_over
	    sendMsg pointed_noid, MSG_GET, 0

	    getResponse GET_SUCCESS
	    if (!zero) {			; Non-zero is success
	        lda pointed_noid
	    	jsr v_get_subject_object
	        changeContainers 0, AVATAR_HAND, actor_noid
		lda #AV_ACT_bend_back
		chainTo v_set_actor_chore
	    }
	chore AV_ACT_bend_back
	chainTo	v_beep				; If we get here we failed
	actionEnd

