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

	lda actor_noid			; Was it me that just bit the dust?
	cmp me_noid
	if (equal) {			; If so, do nothing (I'll get picked
		rts			;    up asynchronously).
	}
	complexSound	AVATAR_KILLED, actor_noid
	moveOb	in_hand, subject		; what to move
	getProp	actor, OBJECT_x_position
	tax					; new x
	iny
	getProp	actor
	tay					; new y
	lda	#THE_REGION_NOID		; what to put it in
	chainTo	v_change_containers

	actionEnd

