;
;	beeper_do.m
;
;	Action code to handle 'do' behavior of the beeper object.
;
;	This file should be assembled as position independent code.
;
;	The 'do' action indicates that the player wants the beeper to stop
;	 beeping, so if he is holding the beeper, shut it up.  If he isn't
;	 holding it, it's just a 'depends' operation as usual.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {
		lda	#FALSE
		putProp	pointed, BEEPER_beeping
		/* do something with sound */
		rts
	}
	chainTo v_depends

	actionEnd
