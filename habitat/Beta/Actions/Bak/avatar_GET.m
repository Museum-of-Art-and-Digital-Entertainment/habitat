;
;	avatar_GET.m
;
;	Action code for the avatar asynchronous 'GET' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters of the GET message:
define GET_WHAT = 0
define GET_HOW = 1

	actionStart

	getResponse GET_HOW		; Get from ground or from pocket?
	tay
	if (!zero) {			; 1==>from pocket 2==>no chore
	    lda #AV_ACT_stand		; Stand up when done
	    pha
	    cpy	#1
	    if (equal) {
		lda #AV_ACT_unpocket	; Reach for pocket now
	    }
	} else {			; 0==>from ground
	    lda #AV_ACT_bend_back	; Bend back when done
	    pha
	    lda #AV_ACT_bend_over	; Bend over now
	}
	jsr v_set_actor_chore
	asyncAnimationWait
	getResponse GET_WHAT
	jsr v_get_subject_object	; Noid in A
	changeContainers 0, AVATAR_HAND, actor_noid
	pla				; Chore selected above
	chainTo v_set_actor_chore

	actionEnd
