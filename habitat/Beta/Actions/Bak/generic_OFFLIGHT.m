;
;	generic_OFFLIGHT.m
;
;	Action code for asynchronous lights-off operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
	include	"action_head.i"

	actionStart

	sound	SWITCH_CLICK, actor_noid
	lda	#OFF
	putProp actor, GENERIC_on
	newImage actor_noid
	decLight
	rts

	actionEnd
