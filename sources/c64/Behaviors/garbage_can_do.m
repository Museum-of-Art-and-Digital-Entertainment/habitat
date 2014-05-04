;
;	garbage_can_do.m
;
;	Action code for the garbage can flush behavior.
;	This is the 'do' behavior for garbage cans.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	jsr	v_punt_if_not_adjacent
	sound	GARBAGE_FLUSH
	sendMsg pointed_noid, MSG_FLUSH, 0
	lda pointed_noid
	chainTo v_purge_contents

	actionEnd
