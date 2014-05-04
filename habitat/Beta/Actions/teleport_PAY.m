;
;	generic_PAY.m
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
define	COST	=	1

	actionStart
	
	complexSound	TELEPORT_ACTIVATES, actor_noid
	lda	#TELEPORT_ACTIVE
	putProp actor, TELEPORT_state
	getResponse BUYER
	tax
	getResponse COST
	tay
	getResponse COST+1
	chainTo v_spend

	actionEnd
