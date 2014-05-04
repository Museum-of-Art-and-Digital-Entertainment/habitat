;
;	generic_SPEAK.m
;
;	Action code for the asynchronous 'SPEAK' behavior.
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

	movew	response_data, source
	chainTo	v_balloonMessage

	actionEnd

