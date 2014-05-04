;
;	avatar_CLOSE.m
;
;	Action code for the asynchronous close door or gate operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;

	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the CLOSE request to the host
define CLOSE_DOOR = 0
define CLOSE_FLAGS = 1

	actionStart

	chore AV_ACT_hand_out
	getResponse CLOSE_DOOR
	jsr v_get_subject_object
	getResponse CLOSE_FLAGS
	putProp subject, DOOR_flags
	and #OPEN_BIT
	newImage subject_noid
	sound	EXIT_CLOSING, subject_noid
	asyncAnimationWait
	chore AV_ACT_hand_back
	rts

	actionEnd
