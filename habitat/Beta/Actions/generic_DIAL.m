;
;	generic_DIAL.m
;
;	Action code to handle the DIAL asynchronous message.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; This is the parameter used in the DIAL message:
define DIAL_SUCCESS = 0

	actionStart

	getResponse DIAL_SUCCESS
	if (!zero) {
		/* sound effect of phone line ring */
		lda #PHONE_LINE_RING
	} else {
		/* sound effect of phone line busy */
		lda #PHONE_LINE_BUSY
	}
	putProp actor, TELEPHONE_state
	rts

	actionEnd
