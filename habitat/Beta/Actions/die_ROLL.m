;
;	die_ROLL.m
;
;	Action code for asynchronous die roll.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar & Aric Wilmunder
;	Lucasfilm Ltd.
;	17-December-1986
;
	include	"action_head.i"

; This is the parameter of the ROLL message
define ROLL_STATE = 0

	actionStart

	getResponse ROLL_STATE
	newImage actor_noid
	rts

	actionEnd

