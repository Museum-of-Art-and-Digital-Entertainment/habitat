;
;	teleport_PAY.m
;
;	Action code for the asynchronous pay operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

define	BUYER	=	0

	actionStart
	
	getResponse BUYER
	tax
	lda #FORTUNE_COST
	jsr v_spend
	rts

	actionEnd
