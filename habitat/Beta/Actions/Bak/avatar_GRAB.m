;
;	avatar_GRAB.m
;
;	Action code for the asynchronous avatar grab behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; These are the parameters of the GRAB message:
define GRAB_AVATAR = 0

	actionStart

	chore AV_ACT_hand_out
	getResponse GRAB_AVATAR
	jsr v_get_subject_object
	lda actor_noid
	putProp subject, AVATAR_restrainer
	rts

	actionEnd
