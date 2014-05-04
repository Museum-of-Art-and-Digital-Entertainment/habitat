;
;	avatar_POUR.m
;
;	Action code for the asynchronous water bottle pour operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	chore AV_ACT_hand_out
	lda in_hand_noid
	jsr v_get_subject_object
	lda #FALSE
	putProp subject, BOTTLE_filled
	newImage subject_noid
	asyncAnimationWait
	chore AV_ACT_hand_back
	rts

	actionEnd

