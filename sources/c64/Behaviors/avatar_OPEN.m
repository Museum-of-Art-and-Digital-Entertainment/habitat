;
;	avatar_OPEN.m
;
;	Action code for the asynchronous open door or gate operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;

	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the OPEN request to the host
define OPEN_DOOR = 0

	actionStart

	chore AV_ACT_hand_out
	asyncAnimationWait
	getResponse OPEN_DOOR
	jsr v_get_subject_object
	sound	EXIT_OPENING, subject_noid
	lda #(OPEN_BIT | UNLOCKED_BIT)
	putProp subject, DOOR_flags
	and #OPEN_BIT
	newImage subject_noid
	chore AV_ACT_hand_back
	rts

	actionEnd
