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

	ldy	#OBJECT_y_position
	lda	y[@pointed_object]
	clc
	ora	#0x80
	adc	#2
	sta	desired_y
	
	ldy	#Object_x_position
	lda	y[@pointed_object]
	adc	#8
	sta	desired_x

	chainTo	v_goXY			; Will actually execute move

	actionEnd
