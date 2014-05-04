;
;	generic_goToAndPickFromGet.m
;
;	Action code for generic go-to-object-and-get-it-or-get-something-out-
;	 of-it operation.
;	This is the 'get' behavior for portable containers.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
;	To do this, your hands have to be empty.  First we go to the object's
;	 location.  Then if the object is OPEN, we get something out of it,
;	 picking from a sub-menu.  If the object is CLOSED, we get the object
;	 itself.
;
	include	"action_head.i"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {				; Hand must be empty
	    chainTo v_beep
	}
	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there
	chore AV_ACT_bend_over

	getPropC pointed, CONTAINER_flags
	and #OPEN_BIT
	if (!zero) {			; If open, pick from container
	    rjsr v_pick_from_container
	    if (zero) {
		lda #AV_ACT_bend_back
		jsr v_set_actor_chore
		chainTo v_beep
	    }
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

