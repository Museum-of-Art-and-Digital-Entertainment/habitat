;
;	avatar_WALK.m
;
;	Action code for the avatar asynchronous 'WALK' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

; These are the parameters of the avatar WALK message from the host:
	define WALK_TO_X = 0
	define WALK_TO_Y = 1
	define WALK_TO_HOW = 2

	actionStart

	getResponse WALK_TO_HOW
	pha
	getResponse WALK_TO_X
	tax
	iny
	getResponse
	tay
	pla
	chainTo	v_start_walk

	actionEnd
