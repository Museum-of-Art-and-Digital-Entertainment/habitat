;
;	generic_coinOp.m
;
;	Action code for the pay-for-coin-operated device operation.
;	This is used by the 'put' behavior of coin operated objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

; Parameter to this routine
define COINOP_SUCCESS = 0

; Returned by PAY message
define	PAY_SUCCESS	=	0
define	PAY_PRICE	=	1

	doMyAction ACTION_GO		; First, go to the object
	waitWhile animation_wait_bit	; Wait till we get there
	lda in_hand_noid
	if (zero) {			; If not holding something...
		lda #FALSE
		putArg COINOP_SUCCESS
		rts
	}
	getProp in_hand, OBJECT_class_pointer
	cmp	#CLASS_TOKENS	; ...it should be tokens
	bne	coinOpFail
	chore		AV_ACT_operate
	waitWhile	animation_wait_bit
	complexSound	COIN_DEPOSITED
	sendMsg		pointed_noid, MSG_PAY, 0
	chore		AV_ACT_hand_back
	getResponse	PAY_SUCCESS
	putArg		COINOP_SUCCESS
	if (!zero) {			; If successful...
		complexSound	COIN_ACCEPTED
		ldx		actor_noid	; who's spending
		getResponse	PAY_PRICE+1
		pha
		getResponse	PAY_PRICE
		tay				; lo
		pla				; hi
		chainTo		v_spend
	}
	complexSound COIN_REJECTED

coinOpFail:
	lda #FALSE
	putArg COINOP_SUCCESS
	rts

	actionEnd
