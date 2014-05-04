;
;	grenade_do.m
;
;	Action code for the grenade pull-pin operation.
;	This is the 'do' behavior for grenades.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To pull the pin you must be holding the grenade (and the pin can't
;	 have already been pulled!).  If you aren't holding it we punt to
;	 reversed do.
;
	include	"action_head.i"

;This is the parameter returned by the PULLPIN message
define PULLPIN_SUCCESS = 0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to do this
		getProp pointed, GRENADE_pinPulled
		if (zero) {		; Can't pull pin if already pulled
		    	sendMsg pointed_noid, MSG_PULLPIN, 0
			getResponse PULLPIN_SUCCESS
			if (!zero) {	; Non-zero indicates success
				lda #TRUE
				putProp pointed, GRENADE_pinPulled
				rts
			}
		}
		chainTo v_beep		; Complain if failed or already pulled
	}
	chainTo v_depends		; Punt to 'depends' if not holding

	actionEnd

