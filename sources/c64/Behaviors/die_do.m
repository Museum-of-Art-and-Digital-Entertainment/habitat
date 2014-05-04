;
;	die_do.m
;
;	Action code for the die rolling operation.
;	This is the 'do' behavior for dice.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar & Aric Wilmunder
;	Lucasfilm Ltd.
;	17-December-1986
;
	include	"action_head.i"

; This is the parameter returned by the ROLL request
define ROLL_STATE  = 0
define DIE_ROLLING = 0

	actionStart

	lda	#DIE_ROLLING				; animate die
	newImage pointed_noid
	complexSound	MAGIC
    	sendMsg pointed_noid, MSG_ROLL, 0
	getResponse ROLL_STATE
	newImage pointed_noid
	rts


	actionEnd

