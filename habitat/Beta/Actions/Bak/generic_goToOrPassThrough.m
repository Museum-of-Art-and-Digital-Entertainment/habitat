;
;	generic_goToOrPassThrough.m
;
;	Action code to go to or pass through a door.
;	This is the 'go' behavior for door-like objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

	actionStart

	lda	pointed_at_cel_number
	cmp	#2				; the 'black space'
	if (equal) {				; If open...
		rjsr	v_goXY			; walk to desired spot
		lda	#DIRECTION_UP
		chainTo v_go_to_new_region
	}
	jsr	v_find_goto_coords
	stx	desired_x
	sty	desired_y
	chainTo	v_goXY

	actionEnd
