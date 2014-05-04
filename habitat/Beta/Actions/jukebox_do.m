;
;	jukebox_do.m
;
;	Action code for the flip-through-the-selections behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	doMyAction ACTION_GO			; Go to the jukebox first
	waitWhile animation_wait_bit		; Wait till we get there

	sendMsg pointed_noid, MSG_CATALOG, 0	; Get the next catalog choice
	movew response_data, source
	moveb pointed_noid, actor_noid
	chainTo	v_balloonMessage		; Display it

	actionEnd

