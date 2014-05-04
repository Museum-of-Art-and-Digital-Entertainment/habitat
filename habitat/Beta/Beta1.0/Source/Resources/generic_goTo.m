;
;	generic_goTo.m
;
;	Action code for generic go-to-object operation.
;	This is the almost universal default 'go' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

	actionStart

	jsr	v_find_goto_coords
	sta	walk_how
	stx	desired_x
	sty	desired_y
	chainTo	v_goXY				; Will actually execute move

	actionEnd
