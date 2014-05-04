;
;	stun_gun_rdo.m
;
;	Action code for the shoot-with-a-stun-gun operation.
;	This is the standard 'rdo' behavior for stun guns.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	30-July-1986
;
;	To shoot somebody or something with a stun gun, you must be holding
;	 the gun (which, in this case, is guaranteed since this is
;	 an 'rdo' behavior) and the safety must be off.
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the STUN request
define STUN_TARGET = 0
; This is the parameter from the STUN response message
define STUN_SUCCESS = 0

	actionStart

	chore AV_ACT_shoot1
	waitWhile animation_wait_bit
	complexSound STUN_GUN_FIRE
	chore AV_ACT_shoot2
	getProp	subject, OBJECT_class_pointer
	cmp #CLASS_AVATAR			; Is target an avatar?
	if (equal) {
		lda subject_noid		; Get the target
		putArg STUN_TARGET		; Set it
		sendMsg pointed_noid, MSG_STUN, 1	; Do it
		getResponse STUN_SUCCESS	; Hit?
		if (!zero) {			; If so...
			complexSound	STUN_GUN_HIT
			moveOb subject, actor
			lda #AV_ACT_get_shot
			chainTo v_set_actor_chore
		}
	}
	sound	STUN_GUN_MISS
	rts

	actionEnd

