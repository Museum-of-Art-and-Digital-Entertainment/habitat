;
;	drugs_do.m
;
;	Action code for the pill taking operation.
;	This is the 'do' behavior for drugs.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
;	To take a pill you have to be holding the drugs, otherwise we punt to
;	 'depends'.  If the pills are all used up we delete the pillbottle
;	 (drugs) object.
;

; This is the parameter returned by the TAKE request
define TAKE_SUCCESS = 0

	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding drugs to take one
;		chore AV_ACT_take_NI
	    	sendMsg pointed_noid, MSG_TAKE, 0 ; Effect is asynchronous
		getResponse TAKE_SUCCESS
		if (zero) {
			chainTo v_beep
		}
		getProp pointed, DRUGS_count		; Get count
		tax
		dex					; Decrement
		if (zero) {				; If all gone...
			lda pointed_noid
			chainTo v_delete_object		; Nuke it
		}
		txa
		putProp pointed		; Otherwise just note new count
		rts
	}
	chainTo v_depends	; If not holding

	actionEnd

