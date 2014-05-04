;
;	generic_cease.m
;
;	Action code for generic cease operation.
;	This is the almost universal default 'stop' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

	actionStart
	rts			; Return without doing anything.
	actionEnd

