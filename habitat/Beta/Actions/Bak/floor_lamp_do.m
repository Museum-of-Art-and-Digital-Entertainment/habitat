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

	actionStart

	jsr	v_punt_if_not_adjacent
		chore AV_ACT_operate
		waitWhile animation_wait_bit
		sound	SWITCH_CLICK

		getProp pointed, FLOOR_LAMP_on
		eor #1			; Toggle the ON bit
		pha
		putProp pointed		; Remember new value
		newImage pointed_noid	; change graphics
		pla
		if (zero) {		; If now off, tell host we're off
			decLight
			ldy #MSG_OFF
		} else {		; Else tell host we're on
			incLight
			ldy #MSG_ON
		}
		; Set up host message only once!
		lda #0
		ldx pointed_noid
		rjsr v_send_arguments
		waitWhile reply_wait_bit
		chore AV_ACT_hand_back
		rts

	actionEnd
