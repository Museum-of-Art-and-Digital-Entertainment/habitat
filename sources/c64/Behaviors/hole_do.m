;
;	hole_do.m
;
;	Action code for to fill/empty a hole
;	This is the behavior for hole.
;
;	This file should be assembled as position independent code.
;
;	Randy Farmer
;	Lucasfilm Ltd.
;	2-July-1986
;
	include	"action_head.i"
	include "class_equates.m"

; internal action number
define	action_OPENCLOSE	=	8	; uses generic_adjOpenClose

	actionStart

	getProp in_hand, OBJECT_class_pointer
	cmp	#CLASS_SHOVEL
	if (equal) {
		doMyAction	ACTION_GO		; walk to hole
		waitWhile	animation_wait_bit
		doMyAction	action_OPENCLOSE	; change grstate!
		rts
	}
	chainTo v_depends			; not shovel? depends

	actionEnd

