;
;	instant_object_TRANSFORM.m
;
;	Action code for the asynchronous transformation of instant objects
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	lda actor_noid
	chainTo v_delete_object		; New object appears by-and-by

	actionEnd
