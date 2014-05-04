;
;	generic_wearOrGet.m
;
;	Action code for generic get-or-wear a garment operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-June-1986
;
	include	"action_head.i"

; This is the parameter to the 'wearOrGet' call
define WEAR_WHERE = 0x10
; This is the parameter returned by the GET request
define GET_SUCCESS = 0
define WEAR_SUCCESS = 0

	actionStart

    lda in_hand_noid
    if (!zero) {

; If hand is not empty, put the garment on (presuming that we are
;  holding it, which we first test for).

	cmp pointed_noid			; Are we holding garment?
	if (equal) {				; Yazzah!
		getArg WEAR_WHERE		; Offset into avatar contents
		tax				; Save for future reference
		clc
		adc #OBJECT_contents		; Compute offset into contents
		tay				; Use this offset...
		getProp actor			; ...to get the item there
		if (!zero) {			; Already wearing something?
			tay			; Save the item noid
			txa			; Get the offset once again
			cmp #AVATAR_HEAD	; Are we putting on head?
			if (!equal) {		; No, error city, man
				chainTo v_beep	; Complain and bail out
			}
			tya			; Nuke the existing head
			jsr v_delete_object
		}
		sound	CLOTHES_DONNED
		sendMsg pointed_noid, MSG_WEAR, 0
		getResponse	WEAR_SUCCESS
		if (zero) {
			chainTo	v_beep
		}
		lda pointed_noid
		jsr v_get_subject_object
		getArg WEAR_WHERE
		tay
		ldx #0
		lda actor_noid
		jsr v_change_containers
		lda	#0
		putProp	actor, AVATAR_background_actitviy
		rts
	}
	chainTo	v_beep			; If we get here we failed
    }

	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there
	chore AV_ACT_bend_over
	sendMsg pointed_noid, MSG_GET, 0
	getResponse GET_SUCCESS
	if (!zero) {			; Non-zero is success
	        lda pointed_noid
		jsr v_get_subject_object; Put in hand
	        changeContainers 0, AVATAR_HAND, actor_noid
		getArg WEAR_WHERE
		cmp #AVATAR_HEAD
		if (!equal) {
			lda #1
			newImage pointed_noid
		}
		lda #AV_ACT_bend_back
		chainTo v_set_actor_chore
	}
	lda #AV_ACT_bend_back
	jsr v_set_actor_chore
	chainTo v_beep			; Complain on failure

	actionEnd

