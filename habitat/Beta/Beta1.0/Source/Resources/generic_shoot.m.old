;
;	generic_shoot.m
;
;	Action code for generic shoot-with-firearm operation.
;	This is the standard 'rdo' behavior for projectile weapons.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	To shoot somebody or something with a projectile weapon, you must be
;	 holding the weapon (which, in this case, is guaranteed since this is
;	 an 'rdo' behavior) and the safety must be off.
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the ATTACK and BASH requests
define SHOOT_TARGET = 0
; This is the parameter from the ATTACK response message
define ATTACK_damage = 0
; This is the parameter from the BASH response message
define BASH_success = 0

	actionStart

	chore AV_ACT_shoot1
	waitWhile animation_wait_bit
	sound GUNSHOT
	chore AV_ACT_shoot2
	lda	subject_noid			; Get the target
	putArg	SHOOT_TARGET			; Set it
	getProp	subject, OBJECT_class_pointer
	cmp	#CLASS_AVATAR			; Is target an avatar?
	if (equal) {
		sendMsg pointed_noid, MSG_ATTACK, 1	; Yes, ATTACK
		getResponse ATTACK_damage
		if (!zero) {			; Did we hit him?
			moveOb subject, actor	; Yes...
			lda #AV_ACT_get_shot	; ...make him jump!
			chainTo v_set_actor_chore
		}
		chainTo v_boing			; Nope, we missed
	}
	; Otherwise, if attacking inanimate object, send BASH
	sendMsg pointed_noid, MSG_BASH, 1
	getResponse BASH_success		; Did we smash it?
	if (!zero) {				; Yes we did
		lda subject_noid
		chainTo v_delete_object		; Nuke the target
	}
	chainTo v_boing				; We missed

	actionEnd

