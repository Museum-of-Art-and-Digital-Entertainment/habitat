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

define	SWITCH_SUCCESS	=	0		; host returns Suc Flag

define	SAVE_STATE	=	0		; save what we wanna do.

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {			; Have to be holding object to do this
		sound	SWITCH_CLICK
		getProp pointed, FLASHLIGHT_on
		eor #1			; Toggle the ON bit
		putArg	SAVE_STATE
		if (zero) {		; If now off, tell host we're off
			ldy #MSG_OFF
		} else {		; Else tell host we're on
			ldy #MSG_ON
		}
		; Set up host message only once!
		lda #0			; No args
		ldx pointed_noid	; Send to me
		rjsr	v_send_arguments
		waitWhile reply_wait_bit
		getResponse	SWITCH_SUCCESS
		if (!zero) {
		    getArg SAVE_STATE
		    if (zero) {
			decLight
		    } else {
			incLight
		    }
		    getArg SAVE_STATE
		    putProp pointed, FLASHLIGHT_on
		    newImage pointed_noid
		}
		rts
	}
	chainTo v_depends	; If not holding

	actionEnd
