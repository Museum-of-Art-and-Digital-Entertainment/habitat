;
;	bottle_FILL.m
;
;	Action code for the asynchronous water bottle fill operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

define	AVATAR_NOID	=	0

	actionStart

	getResponse	AVATAR_NOID
	sta	actor_noid
	jsr	v_set_up_actor_pointers
	chore AV_ACT_bend_over
	lda in_hand_noid
	jsr v_get_subject_object
	lda #TRUE
	putProp subject, BOTTLE_filled
	newImage subject_noid
	asyncAnimationWait
	chore AV_ACT_bend_back
	rts

	actionEnd

