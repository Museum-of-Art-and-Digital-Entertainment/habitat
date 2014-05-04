;
;	walkie_talkie_talk.m
;
;	Action code for the dial-or-talk-on-the-walkie-talkie operation.
;	This is the 'talk' behavior for walkie-talkie objects.
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
	if (equal) {
		chainTo v_dial_or_talk
	}
	ldx #0
	chainTo v_talk

	actionEnd
