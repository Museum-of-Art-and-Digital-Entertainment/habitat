;
;	garbage_can_FLUSH.m
;
;	Action code for the garbage can asynchronous FLUSH behavior.
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

	sound	GARBAGE_FLUSH, actor_noid
	lda actor_noid
	chainTo v_purge_contents

	actionEnd
