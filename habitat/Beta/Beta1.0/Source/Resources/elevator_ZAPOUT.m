;
;	elevator_ZAPOUT.m
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-February-1987
;
	include	"action_head.i"

	actionStart

	complexSound	ELEVATOR_DEPARTING, actor_noid
	rts

	actionEnd
