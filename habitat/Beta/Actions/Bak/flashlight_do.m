;
;	flashlight_do.m
;
;	Action code for the flashlight switch operation.
;	This is the 'do' behavior for flashlights.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To toggle the switch on a flashlight, you have to be holding it.  If
;	 it goes on you increase the region light level by 1, or decrement it
;	 if it goes off.  If you aren't holding it, of course, we punt to
;	 depends.
;
	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {			; Have to be holding object to do this
		sound	SWITCH_CLICK
		getProp pointed, FLASHLIGHT_on
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
		lda #0			; No args
		ldx pointed_noid	; Send to me
		rjsr	v_send_arguments
		waitWhile reply_wait_bit
		rts
	}
	chainTo v_depends	; If not holding

	actionEnd
