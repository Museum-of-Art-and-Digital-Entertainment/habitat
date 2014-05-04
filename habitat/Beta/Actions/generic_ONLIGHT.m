;
;	generic_ONLIGHT.m
;
;	Action code for asynchronous lights-on operation.
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
	lda	#ON
	putProp actor, GENERIC_on
	newImage actor_noid
	incLight
	rts

	actionEnd
