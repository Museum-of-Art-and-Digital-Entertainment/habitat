;
;	generic_OFF.m
;
;	Action code for asynchronous turn-a-switch-off operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda	#OFF
	putProp actor, GENERIC_on
	newImage actor_noid
	sound	SWITCHED_OFF,actor_noid
	rts

	actionEnd
