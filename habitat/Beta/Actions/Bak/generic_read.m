;
;	generic_read.m
;
;	Action code for read-minor-notes-and-labels behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda in_hand_noid
	cmp pointed_noid
	if (equal) {
		sendMsg pointed_noid, MSG_READ, 0
		movew response_data, source
		moveb pointed_noid, actor_noid
		chainTo	v_balloonMessage
	}
	chainTo v_depends

	actionEnd

