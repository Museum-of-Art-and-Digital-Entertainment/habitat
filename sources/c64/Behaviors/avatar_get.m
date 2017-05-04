;
;	avatar_get.m
;
;	Action code for the avatar 'get' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-May-1986
;
;	If the avatar we are pointing at is holding something in his hand, we
;	 want to grab that thing, whatever it is, unless we are pointing at
;	 ourself, in which case we want to get something out of our pocket.
;
	include	"action_head.i"

; These are the parameters of the message response to the GRAB request
define GRAB_NOID = 0			; What thing did we get?

; This is the parameter returned by the GET request
define GET_SUCCESS = 0

	actionStart

	ldx	pointed_noid
	cpx	me_noid
	beq	its_me_link
;	if (!equal) {				; No grabbing from yourself!
	    lda	in_hand_noid
	    if (zero) {				; Hand must be empty
		doMyAction ACTION_GO		; My GO walks to this object
		waitWhile animation_wait_bit	; Wait till we get there

		chore AV_ACT_hand_out
		sendMsg pointed_noid, MSG_GRAB, 0
		lda	#AV_ACT_hand_back
		bne	skip_its_me_link
its_me_link:	beq	its_me
skip_its_me_link:
		jsr	v_set_actor_chore

		getResponse GRAB_NOID
		if (!zero) {			; Non-zero is success
			jsr	v_get_subject_object
			ldx	#0
			ldy	#AVATAR_HAND
			lda	actor_noid
			chainTo v_change_containers
		}
	    }
	    chainTo v_beep			; Catch the various errors
;	}
its_me:

	; If it's me I'm pointing at, then I want to get something out of
	; my pocket.
	lda in_hand_noid			; Have to be empty handed
	if (!zero) {
		chainTo v_beep
	}

	lda	pointed_at_limb			; if pointing at av face,
	cmp	#AVATAR_FACE_LIMB
	if (equal) {
	    getProp pointed, OBJECT_contents+AVATAR_HEAD
	    if (!zero) {
		jsr v_get_subject_object	; Become the head
		moveOb subject, pointed
		lda #ACTION_GET			; Punt to head get
		chainTo v_issue_nested_command
	    }
	}

	chore AV_ACT_unpocket
	waitWhile animation_wait_bit
	rjsr v_pick_from_container	; Pick something from pocket
	if (!zero) {			; Only if something picked!
		sendMsg pointed_noid, MSG_GET, 0 ; Try to get it
		getResponse GET_SUCCESS		; Did we get it?
		cmp	#SUCCESS_VALUE
		if (equal) {			; We DID?
			lda pointed_noid	; Put in hand
			jsr v_get_subject_object
			changeContainers 0, AVATAR_HAND, actor_noid
			chore AV_ACT_stand
			rts			; Avoid beep below
		}
		bne	skip		; preserve 'a'
	}
	lda	#0
skip:
	jsr	v_beep_or_boing
	lda	#AV_ACT_stand
	chainto	v_set_actor_chore
	actionEnd