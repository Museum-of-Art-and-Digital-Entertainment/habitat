;
;	fake_gun_do.m
;
;	Action code for the fake gun safety toggling operation.
;	This is the 'do' behavior for fake guns.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To flip the safety you have to be holding the fake gun. Also, if the
;	 flag is out we push it back in again.
;

; This is the parameter returned by the RESET request
define RESET_SUCCESS = 0

	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to do this
		getProp pointed, FAKE_GUN_state
		if (!zero) {	; Not 0 if fired.
		    	sendMsg pointed_noid, MSG_RESET, 0
			getResponse RESET_SUCCESS
			if (!zero) {
				lda #FAKE_GUN_READY
				putProp pointed, FAKE_GUN_state
				newImage pointed_noid
				rts
			}
		}
		chainTo v_beep
	}
	chainTo v_depends	; If not holding

	actionEnd

