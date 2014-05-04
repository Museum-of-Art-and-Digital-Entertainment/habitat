;
;	generic_goToAndFill.m
;
;	Action code for generic go-to-water-and-fill-bottle operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the host FILL request
define FILL_SUCCESS = 0

	actionStart

	getProp	in_hand, OBJECT_class_pointer
	cmp	#CLASS_BOTTLE
	if (equal) {
	    	doMyAction ACTION_GO		; My GO walks to this object
	    	waitWhile animation_wait_bit	; Wait till we get there

		chore AV_ACT_bend_over
	    	sendMsg	in_hand_noid, MSG_FILL, 0
		chore AV_ACT_bend_back

	    	getResponse FILL_SUCCESS
	    	if (!zero) {			; Non-zero is success
	    	    lda	#TRUE
		    putProp in_hand, BOTTLE_filled
		    newImage in_hand_noid
	    	    rts				; Avoid beep below
	    	}
	}
	chainTo	v_beep				; If we get here we failed
	actionEnd

