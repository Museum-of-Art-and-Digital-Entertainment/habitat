;
;	avatar_BUGOUT.m
;
;	Action code for the asynchronous escape device activation operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;

	include	"action_head.i"

	actionStart

	getProp in_hand, ESCAPE_DEVICE_charge
	tax
	dex
	if (zero) {			; If all used up...
		lda in_hand_noid
		chainTo v_delete_object	; ...nuke it
	}
	txa
	putProp in_hand			; Otherwise just note new charge
	sound	ESCAPE_DEVICE_ACTIVATES, in_hand_noid
	rts

	actionEnd

