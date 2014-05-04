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

; This is the parameter to the ATTACK request
define STRIKE_TARGET = 0
; scratch
define SAVE_POINT = 5
; This is the parameter from the ATTACK response message
define ATTACK_result = 0
define ATTACK_target = 1

; These are the interpretations of ATTACK_result
define ATTACK_MISS = 0     ; no effect, beep at player
define ATTACK_DESTROY = 1  ; destroyed target object
define ATTACK_HIT = 2      ; hit target avatar, didn't kill him
define ATTACK_DEATH = 3    ; hit target avatar, killed him (death is asynch)

	actionStart

	lda	pointed_noid			; 
	sta	SAVE_POINT			; this is all for adj check
	moveb	subject_noid, pointed_noid	; 
	jsr	v_set_up_pointed_pointers	; point to avatar for adja
	jsr	v_adjacency_check
	if (carry) {
		chainTo v_beep
	}
	lda	SAVE_POINT
	sta	pointed_noid
	jsr	v_set_up_pointed_pointers

	chore AV_ACT_knife
	lda	subject_noid			; Get the target
	putArg	STRIKE_TARGET			; Set it
	sendMsg pointed_noid, MSG_ATTACK, 1	; Yes, ATTACK
	getResponse ATTACK_result
	if (zero) {				; Did we miss completely?
		chainTo v_boing			; Error beep
	}
	cmp #ATTACK_DESTROY
	if (equal) {			; Did we destroy the target object?
		lda subject_noid
		chainTo v_delete_object		; Nuke the target
        }
        ; Must have hit an Avatar (that's the only choice left);
	getResponse ATTACK_target
	sta	actor_noid
	jsr	v_set_up_actor_pointers
	lda #AV_ACT_get_shot			; make him jump!
	chainTo v_set_actor_chore

	actionEnd

