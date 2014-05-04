;
;	avatar_LOAD.m
;
;	Action code for the avatar asynchronous LOAD stereo behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; These are the parameters of the LOAD message:
define LOAD_STEREO = 0
define LOAD_TAPE = 1

	actionStart

	chore AV_ACT_bend_over
	getResponse LOAD_TAPE
	jsr v_get_subject_object
	changeContainers 0, 0, in_hand_noid
	lda #AV_ACT_bend_back
	chainTo v_set_actor_chore
	
	actionEnd
