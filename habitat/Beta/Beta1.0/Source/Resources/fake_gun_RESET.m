;
;	fake_gun_RESET.m
;
;	Action code for the fake gun asynchronous RESET operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	This just pushes the flag back in.
;
	include	"action_head.i"

	actionStart

	lda #FAKE_GUN_READY
	putProp actor, FAKE_GUN_state
	newImage actor_noid
	rts

	actionEnd
