;
;	generic_throw.m
;
;	Action code for generic throw-one-object-at-another operation.
;	This is the default 'reversed-do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter sent in the THROW request
define THROW_TARGET = 0
define THROW_X = 1
define THROW_Y = 2

; This is a scratch variable to recover a clobbered register
define TEMP_NEW_Y = 0x10

; These are the parameters returned by the THROW request
define THROW_NEW_TARGET = 0
define THROW_NEW_X = 1
define THROW_NEW_Y = 2
define THROW_HIT = 3

	actionStart

	lda	Im_sitting
	if (!zero) {
	    chainTo	v_beep
	}
	lda	desired_y
	sec
	sbc	#1
	if (plus) {
	    lda	#0x80		; bottom limit
	}
	putArg	THROW_Y
	lda	desired_x
	putArg	THROW_X
	lda	subject_noid
	putArg	THROW_TARGET
	chore	AV_ACT_throw
	sendMsg	pointed_noid, MSG_THROW, 3
	getResponse THROW_HIT
	if (zero) {				; host says NO!
	    chainTo	v_beep
	}
	lda	pointed_noid
	jsr	v_get_subject_object
	getResponse THROW_NEW_Y
	putArg	TEMP_NEW_Y
	getResponse THROW_NEW_X
	sta	desired_x
	tax
	getArgY TEMP_NEW_Y
	sty	desired_y
	lda	#THE_REGION_NOID
	rjsr	v_change_containers
	ldy	#OBJECT_orientation
	lda	y[@subject_object]
	and	#0xfe				; clear low bit
	sta	y[@subject_object]
	chore	AV_ACT_hand_back
	rts

	actionEnd
