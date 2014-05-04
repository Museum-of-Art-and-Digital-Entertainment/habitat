;
;	magic_lamp_GIVEUP.m
;
;	Action code for the asynchronous magic lamp genie timeout.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	jsr	v_balloon_printf
	string	"Time's up. You lose."
	lda actor_noid
	chainTo v_delete_object		; Nuke the lamp

	actionEnd

