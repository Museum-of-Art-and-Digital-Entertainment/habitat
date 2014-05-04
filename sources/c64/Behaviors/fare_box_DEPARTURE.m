;
;	fare_box_DEPARTURE.m
;
;	Action code for the asynchronous departure announcement.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	movew actor_object, printf_parameters
	addwwb printf_parameters, printf_parameters, #FARE_BOX_nextStop
	jsr v_balloon_printf
	string "Departing now for @"
	rts

	actionEnd
