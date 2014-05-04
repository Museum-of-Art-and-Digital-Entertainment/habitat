;
;	escape_device_BUGOUT.m
;
;	Action code for the asynchronous escape device activation operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	sound	ESCAPE_DEVICE_ACTIVATES, actor_noid
	rts

	actionEnd

