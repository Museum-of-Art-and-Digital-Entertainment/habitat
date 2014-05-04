;
;	avatar_ATTACK.m
;
;	Action code for asynchronous event when one avatar attacks another.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters from the ATTACK message
define ATTACK_TARGET = 0
define ATTACK_DAMAGE = 1

	actionStart

	getProp in_hand, OBJECT_class_pointer
	cmp #CLASS_KNIFE
	if (!equal) {
		chore AV_ACT_shoot1
		asyncAnimationWait
		getProp in_hand, OBJECT_class_pointer
		tax
		lda #GUNSHOT
		ldy in_hand_noid
		cpx #CLASS_GUN
		if (equal) {
			jsr v_do_a_sound
		} else {
		    cpx #CLASS_STUN_GUN
		    if (equal) {
			jsr v_do_a_complex_sound
		    }
		}
		lda #AV_ACT_shoot2
	} else {
		lda #AV_ACT_knife
	}
	jsr	v_set_actor_chore
	getResponse ATTACK_TARGET
	sta	actor_noid
	jsr	v_set_up_actor_pointers
	lda	#AV_ACT_get_shot
	chainTo v_set_actor_chore

	actionEnd

