;
;	stereo_UNLOAD.m
;
;	Action code for the stereo asynchronous UNLOAD stereo behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; This is the parameter to the UNLOAD message:
define AVATAR_NOID = 0
define UNLOAD_STEREO = 1

	actionStart

	getResponse	AVATAR_NOID
	sta	actor_noid
	jsr	v_set_up_actor_pointers
	getProp in_hand, STEREO_tape
	jsr v_get_subject_object	; Get the tape
	getProp actor, OBJECT_x_position
	tax
	getProp actor, OBJECT_y_position
	tay
	lda #THE_REGION_NOID		; Put it here
	jsr v_change_containers
	lda #NULL
	putProp in_hand, STEREO_tape
	rts

	actionEnd
