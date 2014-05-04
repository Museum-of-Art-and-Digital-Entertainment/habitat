;
;	head_get.m
;
;	Action code for the head 'get' operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-June-1986
;
    include	"action_head.i"
    include	"class_equates.m"

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

; This is the parameter returned by the REMOVE request
define REMOVE_SUCCESS = 0

    actionStart

    getProp pointed, OBJECT_contained_by	; Where is head?
    if (!zero) {				; If not in region...
        jsr v_get_subject_object
        getProp subject, OBJECT_class_pointer
        cmp #CLASS_AVATAR			; ...is it on a body?
        if (equal) {				; Yes, is on body
            lda actor_noid			; Ah, but is it *my* body?
            cmp subject_noid
            if (equal) {			; Yes, it's my head alright
                lda in_hand_noid
                if (zero) {
                    ; Take head off (!) and put in hands
                    sendMsg pointed_noid, MSG_REMOVE, 0
		    getResponse REMOVE_SUCCESS
		    if (!zero) {
			sound	CLOTHES_DOFFED, actor_noid
			chore	AV_ACT_stand
                	newImage pointed_noid, HEAD_OFF
                	moveOb pointed, subject
			ldx #0
		 	ldy #AVATAR_HAND
			lda actor_noid
			chainTo v_change_containers
		    }
                }
            }
	    chainTo v_beep	; hands full or not my head or cursed!
        }
    }

    ; Sitting somewhere in region...
    doMyAction ACTION_GO		; My GO walks to this object
    waitWhile animation_wait_bit	; Wait till we get there
    chore AV_ACT_bend_over
    sendMsg pointed_noid, MSG_GET, 0
    chore AV_ACT_bend_back
    getResponse GET_SUCCESS
    if (!zero) {			; Non-zero is success
        lda pointed_noid
        jsr v_get_subject_object; Put in hand
        changeContainers 0, AVATAR_HAND, actor_noid
        rts
    }
    chainTo v_beep			; Complain on failure

    actionEnd
