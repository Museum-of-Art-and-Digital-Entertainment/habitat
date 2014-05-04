;
;	telekenesis_get.m
;
;	Action code for telekenetic get behavior
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
	sendMsg pointed_noid, MSG_GET, 0
	getResponse GET_SUCCESS
	if (!zero) {			; Non-zero is success
	        lda pointed_noid
	    	jsr v_get_subject_object
	        changeContainers 0, AVATAR_HAND, actor_noid
	        rts				; Avoid beep below
	}
	chainTo	v_beep				; If we get here we failed

	actionEnd

