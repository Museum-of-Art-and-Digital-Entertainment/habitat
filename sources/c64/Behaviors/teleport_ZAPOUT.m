;
;	teleport_ZAPOUT.m
;
;	This file should be assembled as position independent code.
;
;	Lucasfilm Ltd.
;
	include	"action_head.i"

	actionStart

	complexSound	TELEPORT_DEPARTING, actor_noid
	lda		#TELEPORT_READY
	putProp 	actor, TELEPORT_state
	rts

	actionEnd
