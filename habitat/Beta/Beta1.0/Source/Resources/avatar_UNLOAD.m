;
;	avatar_UNLOAD.m
;
;	Action code for the avatar asynchronous UNLOAD stereo behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; This is the parameter to the UNLOAD message:
define UNLOAD_STEREO = 0

	actionStart

	getProp in_hand, STEREO_tape
	jsr v_get_subject_object	; Get the tape
	getProp actor, OBJECT_x_position
	tax
	getProp actor, OBJECT_y_position
	tay
	lda #THE_REGION_NOID		; Put it here
	rjsr v_change_containers
	lda #NULL
	putProp in_hand, STEREO_tape
	rts

	actionEnd
