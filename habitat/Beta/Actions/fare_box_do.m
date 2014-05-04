;
;	fare_box_do.m
;
;	Action code for the inquire-about-the-bus operation.
;	This is the 'do' behavior for the fare box.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	movew pointed_object, printf_parameters
	addwwb printf_parameters, printf_parameters, #FARE_BOX_nextStop
	jsr v_balloon_printf
	string "Next stop: @"
	rts

	actionEnd
