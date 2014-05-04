;
;	stereo_get.m
;
;	Action code for the get-tape-out-of-stereo operation.
;	This is the 'get' behavior for the stereo.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {				; If holding something...
		getProp in_hand, OBJECT_class_pointer
		cmp #CLASS_STEREO
		if (equal) {			; ...It must be a stereo
			getProp in_hand, STEREO_tape
			if (!zero) {		; If a tape is loaded
				jsr v_get_subject_object
				getProp actor, OBJECT_x_position
				tax
				getProp actor, OBJECT_y_position
				tay
				lda #THE_REGION_NOID
				rjsr v_change_containers
				sendMsg pointed_noid, MSG_UNLOAD, 0
				rts
			}
		}
		chainTo v_beep		; Complain if not stereo or unloaded
	} ; else normal goToAndGet of stereo
	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there

	chore AV_ACT_bend_over
	sendMsg pointed_noid, MSG_GET, 0
	getResponse GET_SUCCESS
	if (!zero) {			; Non-zero is success
	        lda pointed_noid
	    	jsr v_get_subject_object
	        changeContainers 0, AVATAR_HAND, actor_noid
		lda #AV_ACT_bend_back
		chainTo v_set_actor_chore
;	        rts				; Avoid beep below
	}
	chore AV_ACT_bend_back
	chainTo	v_beep				; If we get here we failed
	actionEnd

