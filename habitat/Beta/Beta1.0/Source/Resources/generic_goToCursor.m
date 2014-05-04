;
;	generic_goToCursor.m
;
;	Action code for generic go-to-cursor-location operation.
;	This is the 'go' behavior for large-screen-area objects.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

	actionStart

	lda	desired_x
	pha
	lda	desired_y
	pha
	lda	last_command_selected
	cmp	#ACTION_GO		; was this a goto ONLY?
	if (!equal) {			; walk NEAR this place
	    lda	in_hand_noid
	    if (!zero) {
		lda	in_hand_noid
		sta	subject_noid
		sta	object_noid
		lda	in_hand_object
		sta	subject_object
		sta	object_address
		lda	in_hand_object+1
		sta	subject_object+1
		sta	object_address+1
		ldx	desired_x
		ldy	desired_y
		lda	#0			; region
		rjsr	v_change_containers
		jsr	v_find_goto_alt_entry
		stx	desired_x
		sty	desired_y
		sta	walk_how
		changeContainers 0,AVATAR_HAND, actor_noid
	    }
	}
	rjsr	v_goXY			; Cursor is default motion target!
	pla
	sta	desired_y
	pla
	sta	desired_x		; restore 'put down' position
	rts
	actionEnd

