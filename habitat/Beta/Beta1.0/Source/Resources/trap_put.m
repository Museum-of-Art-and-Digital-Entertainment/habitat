;
;	trap_put.m
;	code for generic go-to-object-and-drop-something operation.
;
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

	lda	in_hand_noid
	if (zero) {chainTo v_beep }		; Hand must NOT be empty
	cmp	pointed_noid
	if (equal) {chainTo v_beep}
	getProp	pointed, TRAP_type		; 0, 1 ,2 or ???
	cmp	#2				; ground ONLY
	if (!equal) {chainto v_beep}
	containerAbort
	doMyAction ACTION_GO			; My GO walks to this object
	waitWhile animation_wait_bit		; Wait till we get there
	jsr	v_face_cursor
	chore AV_ACT_bend_over
	lda	#THE_REGION_NOID		; Drop in the region
	rjsr	v_putInto
	chore AV_ACT_bend_back
	rts

	actionEnd
