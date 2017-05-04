;
;	generic_CHANGESTATE.m
;
;	Action code to handle the CHANGESTATE asynchronous message.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

; This is the parameter used in the CHANGESTATE message:
define NEW_STATE = 0

	actionStart

	getResponse NEW_STATE
	newImage actor_noid
	rts

	actionEnd
