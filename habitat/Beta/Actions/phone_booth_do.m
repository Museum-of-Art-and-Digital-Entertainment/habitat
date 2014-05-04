;
;	phone_booth_do.m
;
;	Action code for the hang-up-or-answer pay phone operation.
;	This is the 'do' behavior for phone booth objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	jsr	v_punt_if_not_adjacent
	chainTo v_hangup

	actionEnd
