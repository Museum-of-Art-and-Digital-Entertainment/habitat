;
;	shovel_DIGGING.m
;
;	Action code for ASYNC shovel digging.
;
;	This file should be assembled as position independent code.
;
;	Randy Farmer
;	Lucasfilm Ltd.
;	2-July-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

define	DIGGER_NOID	=	0x0

	actionStart
	sound		DIGGING, actor_noid
	getResponse	DIGGER_NOID
	sta		actor_noid
	jsr		v_set_up_actor_pointers		; who is digging?
	chore		AV_ACT_bend_over
	asyncAnimationWait
	chore		AV_ACT_bend_back
	asyncAnimationWait
	rts

	actionEnd

