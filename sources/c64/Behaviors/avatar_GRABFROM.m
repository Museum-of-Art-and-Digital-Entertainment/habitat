;
;	avatar_GRABFROM.m
;
;	Action code for the asynchronous grab from one avatar to another.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; These are the parameters of the GRABFROM message:
define GRABFROM_AVATAR = 0

	actionStart

	chore AV_ACT_hand_out
	getResponse GRABFROM_AVATAR
	jsr v_get_subject_object
	getProp subject, AVATAR_contents+AVATAR_HAND
	jsr v_get_subject_object
	changeContainers 0, AVATAR_HAND, actor_noid
	asyncAnimationWait
	chore AV_ACT_hand_back
	rts

	actionEnd
