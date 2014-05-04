;
;	avatar_POSTURE.m
;
;	Action code for the asynchronous avatar posture change.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; This is the parameter used in the POSTURE message
define NEW_POSTURE = 0

	actionStart

	getResponse NEW_POSTURE
	chainTo	v_set_actor_chore

	actionEnd
