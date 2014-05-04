;
;	atm_put.m
;
;	Action code for the ATM deposit operation.
;	This is the ATM 'put' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;

; This is the parameter to the DEPOSIT request
define TOKEN_NOID = 0
; This is the parameter returned by the DEPOSIT request
define DEPOSIT_SUCCESS = 0

	include	"action_head.i"
	include "class_equates.m"

	actionStart

	lda in_hand_noid
	if (zero) {
		chainTo v_beep			; Hand must NOT be empty
	}
	doMyAction ACTION_GO			; My GO walks to the ATM
	waitWhile animation_wait_bit		; Wait till we get there

	getProp in_hand, OBJECT_class_pointer
	cmp #CLASS_TOKENS			; If holding tokens...
	if (!equal) {
		lda	#THE_REGION_NOID	; Else drop into the region
		chainTo	v_putInto
	}
	chore AV_ACT_operate
	sound	ATM_THINKING
	waitWhile animation_wait_bit
	lda	in_hand_noid
	putArg	TOKEN_NOID
	sendMsg pointed_noid, MSG_DEPOSIT, 1
	chore AV_ACT_hand_back
	getResponse DEPOSIT_SUCCESS
	if (zero) {
		chainTo v_beep
	}
	complexSound	MONEY_INTO_ATM

	ldy #TOKENS_denomination
	clc
	lda bank_account_balance
	adc y[@in_hand_object]
	sta bank_account_balance
	iny
	lda bank_account_balance+1
	adc y[@in_hand_object]
	sta bank_account_balance+1
	lda bank_account_balance+2
	adc	#0
	sta bank_account_balance+2
	lda bank_account_balance+3
	adc	#0
	sta bank_account_balance+3

	movew #bank_account_balance, printf_parameters
	lda in_hand_noid
	jsr v_delete_object
	moveb pointed_noid, actor_noid		; provisional, cbm 1/23/87
	jsr v_balloon_printf
	string "New balance: $#"
	rts

	actionEnd
