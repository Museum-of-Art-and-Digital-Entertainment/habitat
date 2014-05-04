;
;	beeper_BEEP.m
;
;	Action code to handle the beeper BEEP asynchronous message.
;
;	This file should be assembled as position independent code.
;
;	The host sends the beeper a BEEP message when the player should be
;	 notified of a phone call.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

	actionStart

	lda	#TRUE
	putProp actor, BEEPER_beeping
	/* do something with sound */
	rts

	actionEnd
