;
;	head_put.m
;
;	Action code for the head 'put' operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-June-1986
;
    include	"action_head.i"
    include	"class_equates.m"

    actionStart

    lda pointed_noid				; What are we pointing at?
    cmp me_noid					; Is it me?
    if (equal) {				; Yes! Try to put the head on
        lda subject_noid			; Are we holding the head?
        cmp in_hand_noid
        if (equal) {				; Yes, we can put it on!
            sendMsg subject_noid, MSG_WEAR, 0
            getResponse WEAR_SUCCESS
            if (!zero) {
                getProp actor, AVATAR_contents+AVATAR_HEAD
            	if (!zero) {			; Already have a head?
                    rjsr v_delete_object		; Nuke it!
                }
                sound CLOTHES_DONNED
		ldx #0
		ldy #AVATAR_HEAD
		lda actor_noid
		chainTo v_change_containers
            }
        }
        chainTo v_beep			; Handle various errors
    }
    doMyAction	HEAD_INTERNAL_PUT	; otherwise normal drop
    rts

    actionEnd
