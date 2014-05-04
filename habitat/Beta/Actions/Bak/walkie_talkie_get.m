;
;	walkie_talkie_get.m
;
;	Action code for the answer-or-pickup walkie-talkie operation.
;	This is the 'get' behavior for walkie_talkie objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (zero) {				; Hand must be empty
	    containerAbort
	    doMyAction ACTION_GO		; My GO walks to this object
	    waitWhile animation_wait_bit	; Wait till we get there

	    sendMsg pointed_noid, MSG_GET, 0

	    getResponse GET_SUCCESS
	    if (!zero) {			; Non-zero is success
	        lda pointed_noid
	    	jsr v_get_subject_object
	        changeContainers 0, AVATAR_HAND, actor_noid
		lda #PHONE_ACTIVE
		chainTo v_answer_or_unhook
	    }
	}
	chainTo	v_beep				; If we get here we failed
	actionEnd
