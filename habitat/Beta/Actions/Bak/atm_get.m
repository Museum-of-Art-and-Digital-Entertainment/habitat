;
;	atm_get.m
;
;	Action code for the ATM withdrawal operation.
;	This is the 'get' behavior for the ATM.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the WITHDRAW request
define WITHDRAW_AMOUNT = 0
define SAVE_FOR_LATER = 0x10
; This is the parameter returned by the WITHDRAW request
define ACTUAL_WITHDRAWAL = 0
define WITHDRAWAL_SUCCESS = 2

	actionStart

	lda in_hand_noid
	putArg	SAVE_FOR_LATER
	lda in_hand_noid
	if (!zero) {
		getProp in_hand, OBJECT_class_pointer
		cmp #CLASS_TOKENS
		if (!equal) {
		    chainTo v_beep			; Hand must be empty
		}
	}
	doMyAction ACTION_GO			; My GO walks to the ATM
	waitWhile animation_wait_bit		; Wait till we get there

	movew #bank_account_balance, printf_parameters
	rjsr v_select_denomination		; How much to withdraw?
	if (zero) {				; If no money chosen...
	    chainTo v_beep			; ...abort now
	}
	lda select_value
	putArg WITHDRAW_AMOUNT				; Set it
	lda select_value+1
	putArg WITHDRAW_AMOUNT+1			; Set it

	chore AV_ACT_operate
	sound ATM_THINKING
	sendMsg pointed_noid, MSG_WITHDRAW, 2
	complexSound MONEY_OUT_OF_ATM
	chore AV_ACT_hand_back

	getResponse	WITHDRAWAL_SUCCESS
	cmp	#SUCCESS_VALUE
	if (!equal) {
	    chainTo	v_beep_or_boing
	}

	ldy #ACTUAL_WITHDRAWAL
	sec
	lda bank_account_balance
	sbc y[@response_data]
	sta bank_account_balance
	iny
	lda bank_account_balance+1
	sbc y[@response_data]
	sta bank_account_balance+1
	lda bank_account_balance+2
	sbc	#0
	sta bank_account_balance+2
	lda bank_account_balance+3
	sbc	#0
	sta bank_account_balance+3

	ldy	arguments+SAVE_FOR_LATER ; was there a token orig in my hand?
	if (zero) {
	    rts
	}

	getProp in_hand, OBJECT_class_pointer
	cmp #CLASS_TOKENS
	if (equal) {
		ldy	#TOKENS_denomination
		clc
		lda	y[@in_hand_object]
		adc	arguments+ACTUAL_WITHDRAWAL
		sta	y[@in_hand_object]
		iny
		lda	y[@in_hand_object]
		adc	arguments+ACTUAL_WITHDRAWAL+1
		sta	y[@in_hand_object]
	}
	rts				; New money appears asynchronously

	actionEnd

