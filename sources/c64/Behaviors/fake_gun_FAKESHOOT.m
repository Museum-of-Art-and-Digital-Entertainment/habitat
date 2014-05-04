;
;	fake_gun_FAKESHOOT.m
;
;	Action code for the fake gun asynchronous FAKESHOOT operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	This just pops the flag out.
;
	include	"action_head.i"

	actionStart

	lda #FAKE_GUN_FIRED
	putProp actor, FAKE_GUN_state
	newImage	actor_noid
	complexSound	JOKE_GUNSHOT,actor_noid
	rts

	actionEnd
