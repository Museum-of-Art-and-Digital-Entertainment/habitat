;
;	walkie_talkie_do.m
;
;	Action code for the hang-up-or-answer walkie-talkie operation.
;	This is the 'do' behavior for walkie-talkie objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	lda in_hand_noid
	cmp pointed_noid
	if (equal) {		; Have to be holding object to do this
;		chainTo v_hangup_or_answer
	}
	chainTo v_depends

	actionEnd
