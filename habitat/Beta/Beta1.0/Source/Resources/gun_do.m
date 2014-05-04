;
;	gun_do.m
;
;	Action code for the gun safety toggling operation.
;	This is the 'do' behavior for guns.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To flip the safety you have to be holding the gun.
;
	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to do this
		getProp pointed, GUN_safetyOn
		if (!zero) {	; EOR below should just work, but if it's
			lda #1	; initialized funny, this should fix it!
		}
		eor #1		; Toggle safety bit
		putProp pointed	; And store it away
		if (zero) {
			sound GUN_SAFETY_OFF
		} else {
			sound GUN_SAFETY_ON
		}
		rts
	}
	chainTo v_depends	; If not holding

	actionEnd

