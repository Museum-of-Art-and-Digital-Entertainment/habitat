;
;	generic_depends.m
;
;	Action code for generic do-reversal operation.
;	This is the most common 'do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
;	If I am empty handed, we want to execute the reverse-do behavior of
;	 the avatar that is me; otherwise we wnat to execute the reverse-do
;	 behavior of the object in my hand.  In either case, the subject
;	 object should be set to the object pointed at, whatever that may be.
;
	include	"action_head.i"

	actionStart
	chainTo v_depends
	actionEnd
