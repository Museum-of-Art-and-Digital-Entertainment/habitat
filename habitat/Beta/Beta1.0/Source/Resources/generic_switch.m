;
;	generic_switch.m
;
;	Action code for the generic switch toggle operation.
;	This is the 'do' behavior for switched objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	To toggle the switch on an object, you have to be holding it.  If
;	 you aren't holding it, of course, we punt to depends.
;
	include	"action_head.i"

	actionStart

define	SWITCH_SUCCESS	=	0		; host returns Suc Flag

define	SAVE_STATE	=	0		; save what we wanna do.

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {			; Have to be holding object to do this
		getProp pointed, GENERIC_on
		eor #1			; Toggle the ON bit
		putArg	SAVE_STATE
		if (zero) {		; If now off, tell host we're off
			sound	SWITCHED_OFF
			ldy #MSG_OFF
		} else {		; Else tell host we're on
			sound	SWITCHED_ON
			ldy #MSG_ON
		}
		lda #0			; No args
		ldx pointed_noid	; Send to me
		rjsr v_send_arguments
		waitWhile reply_wait_bit
		getResponse	SWITCH_SUCCESS
		if (!zero) {
		    getArg SAVE_STATE
		    putProp pointed, GENERIC_on
		    newImage pointed_noid
		}
		rts
	}
	chainTo v_depends		; If not holding

	actionEnd
