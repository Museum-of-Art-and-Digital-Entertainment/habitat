;
;	avatar_DIE.m
;
;	Action code for asynchronous event when one avatar dies.
;
;	This file should be assembled as position independent code.
;
;	Randy Farmer
;	Lucasfilm Ltd.
;	8 - Aug - 86
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	complexSound	AVATAR_KILLED, actor_noid
	ldy	#OBJECT_contents+AVATAR_HAND
	do {
		tya
		pha
		lda	y[@actor_object]		; what to drop
		if (!zero) {
			sta	in_hand_noid		; SLEAZE!
			lda	#THE_REGION_NOID
			jsr	v_putInto
		}
		pla
		tay
		dey
		cpy	#OBJECT_contents+AVATAR_LEGS
	} while (geq)
	rts

	actionEnd

