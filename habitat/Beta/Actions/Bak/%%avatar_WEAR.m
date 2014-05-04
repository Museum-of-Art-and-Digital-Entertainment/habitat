;
;	avatar_WEAR.m
;
;	Action code for the asynchronous donning of a head.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-May-1986
;
	include	"action_head.i"

	actionStart

	lda in_hand_noid
	jsr v_get_subject_object
	sound	CLOTHES_DONNED, actor_noid
	ldx #0
	ldy #AVATAR_HEAD
	lda actor_noid
	chainTo v_change_containers

	actionEnd

