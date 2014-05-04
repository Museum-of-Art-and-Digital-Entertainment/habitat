;
;	generic_strike.m
;
;	Action code for generic strike-with-weapon operation.
;	This is the standard 'rdo' behavior for non-projectile weapons.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
;	To strike somebody or something with a non-projectile weapon, you
;	 must be holding the weapon (which, in this case, is guaranteed since
;	 this is an 'rdo' behavior) and within arm's reach of the designated
;	 target.
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the ATTACK and BASH requests
define STRIKE_TARGET = 0
; scratch
define SAVE_POINT = 5
; This is the parameter from the ATTACK response message
define ATTACK_damage = 0
; This is the parameter from the BASH response message
define BASH_success = 0

	actionStart

	lda	pointed_noid			; 
	sta	SAVE_POINT			; this is all for adj check
	moveb	subject_noid, pointed_noid	; 
	jsr	v_set_up_pointed_pointers	; point to avatar for adja
	jsr	v_adjacency_check
	if (carry) {chainTo v_beep}
		lda	SAVE_POINT
		sta	pointed_noid
		jsr	v_set_up_pointed_pointers
		chore AV_ACT_knife
		lda	subject_noid			; Get the target
		putArg	STRIKE_TARGET			; Set it
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
		}
		; Otherwise, if attacking inanimate object, send BASH
		sendMsg pointed_noid, MSG_BASH, 1
		getResponse BASH_success		; Did we smash it?
		if (!zero) {				; Yes we did
			lda subject_noid
			chainTo v_delete_object		; Nuke the target
		}
		; Otherwise, we missed
	; Otherwise, we couldn't reach the target...
	chainTo v_beep
	actionEnd

