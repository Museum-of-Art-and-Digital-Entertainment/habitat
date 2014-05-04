;
;	phone_booth_put.m
;
;	Action code for the pay-for-hang-up-or-drop-at pay phone operation.
;	This is the 'put' behavior for phone booth objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	/* This needs work! */

	getProp pointed, TELEPHONE_state
	cmp #PHONE_READY
	if (!equal) {
		lda #PHONE_CALL_COST
		jsr v_pay_coinop_or_drop
		if (carry) {
			lda #PHONE_ACTIVE
			putProp pointed, TELEPHONE_state
			/* dial tone sound effect */
		}
		rts
	}
	cmp #PHONE_LINE_BUSY
	if (!equal) {
		cmp #PHONE_LINE_RING
		if (!equal) {
			cmp #PHONE_TALKING
			if (!equal) {
				jsr	v_adjacency_check
				if (carry) {
				    rts
				}
			}
		}
	}
	jsr v_hangup
	lda #PHONE_CALL_COST
	chainTo v_refund

	actionEnd
