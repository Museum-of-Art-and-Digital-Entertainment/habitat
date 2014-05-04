;
;	stereo_put.m
;
;	Action code for the put-tape-in-stereo operation.
;	This is the 'put' behavior for the stereo.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the LOAD request:
define TAPE_TO_LOAD = 0
; This is the parameter returned by the LOAD request:
define LOAD_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (zero) {				; Must holding *something*
		chainTo v_beep			; Complain if hand empty
	}
	    containerAbort
	    doMyAction ACTION_GO		; My GO walks to the stereo
	    waitWhile animation_wait_bit	; Wait till we get there

	    getProp in_hand, OBJECT_class_pointer
	    cmp #CLASS_TAPE
	    if (equal) {			; Have to be holding a tape!
		getProp pointed, STEREO_tape
		if (zero) {			; Stereo must not be loaded
		    chore AV_ACT_bend_over
		    lda in_hand_noid
		    putArg TAPE_TO_LOAD
		    sendMsg pointed_noid, MSG_LOAD, 1
		    getResponse LOAD_SUCCESS
		    if (!zero) {
			lda in_hand_noid
			jsr v_get_subject_object
			changeContainers 0, 0, pointed_noid
			lda #AV_ACT_bend_back
			chainTo v_set_actor_chore
;			rts
		    }
		}
		lda #AV_ACT_bend_back
		jsr v_set_actor_chore
		chainTo v_beep			; Complain on failure
	    }
	    lda #THE_REGION_NOID		; Drop in region if not tape
	    chainTo v_putInto

	actionEnd

