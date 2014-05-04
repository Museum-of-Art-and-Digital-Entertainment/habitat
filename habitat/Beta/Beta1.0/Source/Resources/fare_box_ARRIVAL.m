;
;	fare_box_ARRIVAL.m
;
;	Action code for the asynchronous arrival announcement.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

; This is the parameter of the ARRIVAL message
define ARRIVAL_NEW_NEXT_STOP = 0

	actionStart

	movew actor_object, printf_parameters
	addwwb printf_parameters, printf_parameters, #FARE_BOX_nextStop
	jsr v_balloon_printf
	string "Arriving at @"
	ldx #0
	do {
		txy
		lda y[@response_data]
		putProp actor, FARE_BOX_nextStop
		inx
		cpx #BUS_STOP_NAME_LENGTH
	} while (!equal)
	jsr v_balloon_printf
	string "Next stop @"
	chainTo v_beep	/* for now */

	actionEnd
