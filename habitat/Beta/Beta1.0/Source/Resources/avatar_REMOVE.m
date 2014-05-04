;
;	avatar_REMOVE.m
;
;	Action code for the asynchronous avatar remove head behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-May-1986
;
	include	"action_head.i"

	actionStart

	getProp actor, AVATAR_contents+AVATAR_HEAD
	jsr v_get_subject_object
	sound	CLOTHES_DOFFED, actor_noid
	chore	AV_ACT_stand
	newImage subject_noid, HEAD_OFF
	ldx #0
	ldy #AVATAR_HAND
	lda actor_noid
	chainTo v_change_containers

	actionEnd
