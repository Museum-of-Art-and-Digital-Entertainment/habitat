;
;	button_CHANGESTATE.m
;
;	Action code for generic do-magical-thing operation.
;	This is the async  behavior for buttons and knobs and things
;
;	This file should be assembled as position independent code.
;
;
	include	"action_head.i"

;  sent by host
define	SWITCHER_NOID	=	0
define	NEW_STATE	=	1

	actionStart

	moveb		actor_noid, subject_noid
	getResponse	SWITCHER_NOID
	sta		actor_noid
	jsr		v_set_up_actor_pointers
	chore		AV_ACT_operate
	asyncAnimationWait
	complexSound	MAGIC, subject_noid
	getResponse	NEW_STATE
	newImage	subject_noid		; the rest is async
	rts

	actionEnd

