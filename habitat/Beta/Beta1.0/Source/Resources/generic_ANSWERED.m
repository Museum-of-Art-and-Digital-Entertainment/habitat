;
;	generic_ANSWERED.m
;
;	Action code to handle the ANSWERED asynchronous message.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	lda #PHONE_TALKING
	putProp actor, TELEPHONE_state
	/* sound effect of silence */
	rts

	actionEnd
