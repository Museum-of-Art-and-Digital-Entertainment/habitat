;
;	fare_box_DEPARTING.m
;
;	Action code for the asynchronous pre-departure announcement.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

; This is the parameter in the DEPARTING message:
define DEPARTING_TIME = 0

	actionStart

	movew actor_object, printf_parameters
	addwwb printf_parameters, printf_parameters, #FARE_BOX_nextStop
	lda #0
	sta printf_parameters+2
	getResponse DEPARTING_TIME
	sta printf_parameters+3
	jsr v_balloon_printf
	string "Departing for @ in # minutes"
	rts

	actionEnd
