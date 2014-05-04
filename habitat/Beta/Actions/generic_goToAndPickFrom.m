;
;	generic_goToAndPickFrom.m
;
;	Action code for generic go-to-container-and-get-something-out-
;	 of-it operation.
;	This is the 'get' behavior for non-portable, unclosable containers.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
;	To do this, your hands have to be empty.  First we go to the object's
;	 location.  Then we get something out of it, picking from a sub-menu.
;	 The container is assumed to be OPEN.
;
	include	"action_head.i"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {				; Hand must be empty
;		lda #AV_ACT_bend_back
;		jsr v_set_actor_chore
		chainTo	v_beep
	}
	    containerAbort
	    doMyAction ACTION_GO		; My GO walks to this object
	    waitWhile animation_wait_bit	; Wait till we get there

	    chore AV_ACT_bend_over
	    rjsr v_pick_from_container
	    if (zero) {
		lda #AV_ACT_bend_back
		jsr v_set_actor_chore
		chainTo v_beep
	    }
	    sendMsg pointed_noid, MSG_GET, 0

	getResponse GET_SUCCESS
	cmp	#SUCCESS_VALUE
	if (equal) {
	    lda pointed_noid
	    jsr v_get_subject_object
	    changeContainers 0, AVATAR_HAND, actor_noid
	    lda #AV_ACT_bend_back
	    chainTo v_set_actor_chore
	}
	jsr	v_beep_or_boing		; If we get here we failed
	lda #AV_ACT_bend_back
	chainTo v_set_actor_chore

	actionEnd

