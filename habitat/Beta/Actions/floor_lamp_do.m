;
;	floor_lamp_do.m
;
;	Action code for the floor lamp switch operation.
;	This is the 'do' behavior for floor lamps.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To toggle the switch on a floor lamp, you have to be near it.  If
;	 it goes on you increase the region light level by 1, or decrement it
;	 if it goes off.  If you aren't near it, of course, we punt to
;	 'depends'.
;
	include	"action_head.i"

define	SWITCH_SUCCESS	=	0		; host returns Suc Flag

define	SAVE_STATE	=	0		; save what we wanna do.

	actionStart

	jsr	v_punt_if_not_adjacent
	chore	AV_ACT_operate
	waitWhile animation_wait_bit
	sound	SWITCH_CLICK

	getProp pointed, FLOOR_LAMP_on
	eor #1			; Toggle the ON bit
	putArg	SAVE_STATE

	if (zero) {		; If now off, tell host we're off
		ldy #MSG_OFF
	} else {		; Else tell host we're on
		ldy #MSG_ON
	}
	; Set up host message only once!
	lda #0
	ldx pointed_noid
	rjsr v_send_arguments
	waitWhile reply_wait_bit

	chore AV_ACT_hand_back

	getResponse	SWITCH_SUCCESS
	if (!zero) {
	    getArg SAVE_STATE
	    if (zero) {
		decLight
	    } else {
		incLight
	    }
	    getArg SAVE_STATE
	    putProp pointed, FLOOR_LAMP_on
	    newImage pointed_noid
	    rts
	}
	chainTo	v_beep

	actionEnd
