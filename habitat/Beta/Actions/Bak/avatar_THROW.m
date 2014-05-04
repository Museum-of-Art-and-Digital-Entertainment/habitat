;
;	avatar_THROW.m
;
;	Action code for the asynchronous throw operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; These are the parameters of the THROW message
define THROW_TARGET = 0
define THROW_X = 1
define THROW_Y = 2
define THROW_HIT = 3

; This is a scratch variable to recover a clobbered register
define TEMP_Y = async_workspace

	actionStart

	chore AV_ACT_throw
	asyncAnimationWait
	lda in_hand_noid
	jsr v_get_subject_object
	getResponse THROW_Y
	sta	TEMP_Y
	getResponse THROW_X
	tax
	ldy	TEMP_Y
	lda #THE_REGION_NOID
	rjsr v_change_containers
	ldy	#OBJECT_orientation
	lda	y[@subject_object]
	and	#0xfe				; clear low bit
	sta	y[@subject_object]
	chore AV_ACT_hand_back
	rts

	actionEnd
