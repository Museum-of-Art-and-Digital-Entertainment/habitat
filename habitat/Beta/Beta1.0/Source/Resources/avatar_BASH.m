;
;	avatar_BASH.m
;
;	Action code for asynchronous event when an avatar attacks an object.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters from the BASH message
define BASH_TARGET = 0
define BASH_SUCCESS = 1

	actionStart

	getProp in_hand, OBJECT_class_pointer
	cmp #CLASS_GUN
	if (equal) {
		chore AV_ACT_shoot1
		AsyncAnimationWait
		sound GUNSHOT,in_hand_noid
		lda #AV_ACT_shoot2
	} else {
		lda #AV_ACT_knife
	}
	jsr v_set_actor_chore
	getResponse BASH_SUCCESS	; If damage actually occurred...
	if (!zero) {			; (Non-zero encodes success)
		getResponse BASH_TARGET
		chainTo v_delete_object	; Nuke the target
	}
	rts

	actionEnd

