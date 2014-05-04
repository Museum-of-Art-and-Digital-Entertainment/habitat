;
;	shovel_dig.m	goto-and-dig here	an rdo.
;
;	Action code for using the shovel to poke around.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-July-1986
;
	include	"action_head.i"
	include "class_equates.m"


	actionStart
	lda	pointed_noid
	pha
	moveb	subject_noid, pointed_noid	; walk to subject
	jsr	v_set_up_pointed_pointers
	doMyAction	ACTION_GO
	waitWhile	animation_wait_bit
	pla
	sta	pointed_noid
	jsr	v_set_up_pointed_pointers	; recover

	chore	AV_ACT_bend_over
	sound	DIGGING
	sendMsg	pointed_noid, MSG_DIG, 0	; tell others
	chore	AV_ACT_bend_back
	waitWhile	animation_wait_bit
	rts

	actionEnd

