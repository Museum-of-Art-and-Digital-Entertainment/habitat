;
;	avatar_put.m
;
;	Action code for the avatar 'put' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-May-1986
;
;	Hand whatever we are holding to the avatar pointed at.  This won't
;	 work if we are pointing at ourself, if the pointed at avatar is
;	 already holding something, or if we aren't holding anything, of
;	 course.  If we are pointing at ourself, we want to take what's in our
;	 hand and put it in our pocket.
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter of the message response to the HAND request
define HAND_SUCCESS = 0		; TRUE --> We handed over *something*
; This is the parameter of the message response to the WEAR request
define WEAR_SUCCESS = 0

	actionStart

	ldx	pointed_noid
	cpx	me_noid
	beq	its_me_link
;	if (!equal) {				; No handing to yourself!
	    lda	in_hand_noid
	    if (zero) {			; Must be holding something
		chainTo	v_beep
	    }
		doMyAction ACTION_GO		; My GO walks to this object
		waitWhile animation_wait_bit	; Wait till we get there

		getProp	in_hand, OBJECT_class_pointer
		cmp	#CLASS_TOKENS
		if (equal) {
		    chainTo	v_depends	; put SOME tokens.
		}

		chore AV_ACT_hand_out
		sendMsg pointed_noid, MSG_HAND, 0
		lda	#AV_ACT_hand_back

		bne	skip_its_me_link
its_me_link:	beq	its_me
skip_its_me_link:

		jsr	v_set_actor_chore

		getResponse HAND_SUCCESS
		if (!zero) {			; Non-zero is success
		    lda	in_hand_noid
		    jsr	v_get_subject_object
		    ldx #0
		    ldy #AVATAR_HAND
		    lda pointed_noid
		    chainTo v_change_containers
		}
	    chainTo v_beep		; Catch the various errors
;	}
its_me:
	; If we got here we were pointed at ourselves, and we want to
	;   pocket something.

	lda in_hand_noid		; Empty handed?
	if (zero) {			; Nope
	    chainTo v_beep		; Can't pocket what you don't have...
	}
	jsr v_get_subject_object
	getProp in_hand, OBJECT_class_pointer
	cmp #CLASS_HEAD
	if (equal) {
	    getProp actor, AVATAR_contents+AVATAR_HEAD
	    bne	try_to_put_in_pocket		; Already have a head?
	    sendMsg subject_noid, MSG_WEAR, 0
	    getResponse WEAR_SUCCESS
	    if (!zero) {
		sound CLOTHES_DONNED, actor_noid
		newImage in_hand_noid, 0
		changeContainers 0, AVATAR_HEAD, actor_noid
		chore	AV_ACT_stand
		rts
	    }
	    chainTo v_beep
	} 
try_to_put_in_pocket:
	chore AV_ACT_unpocket
	waitWhile animation_wait_bit
	lda	me_noid
	rjsr	v_putInto
	lda	#AV_ACT_stand
	chainTo	v_set_actor_chore

	actionEnd
