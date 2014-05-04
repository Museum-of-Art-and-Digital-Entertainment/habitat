;
;	credit_card_rdo.m
;
;	Action code for credit card payment operation.
;	This is the 'rdo' behavior for the credit card.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	To pay some money, you must be holding the credit card (which, in this
;	 case, is guaranteed since this is an 'rdo' behavior).  You can only
;	 pay to another avatar, since only avatars have bank accounts (this
;	 may change!).
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters to the PAYTO request
define PAYTO_TARGET = 0
define PAYTO_AMOUNT = 1
; This is the parameter returned by the PAYTO request
define PAYTO_SUCCESS = 0

	actionStart

	getProp subject, OBJECT_class_pointer
	cmp #CLASS_AVATAR		; Are we paying an avatar?
	if (equal) {			; Yes
		lda subject_noid	; Get the target
		putArg PAYTO_TARGET	; Set it
		movew #bank_account_balance, printf_parameters
		rjsr v_select_denomination ; How much to pay?
		putArg PAYTO_AMOUNT	; Set it
		if (zero) {		; If no money chosen
			chainTo v_beep	; ...bag it
		}
		chore AV_ACT_hand_out
		sendMsg pointed_noid, MSG_PAYTO, 2 ; Tell host to pay
		chore AV_ACT_hand_back
		getResponse PAYTO_SUCCESS ; Did it work?
		if (!zero) {		; Yup, do the transaction
			subllb bank_account_balance, bank_account_balance,
				arguments+PAYTO_AMOUNT
			rts		; All done, bye-bye
		}
	}
	chainTo v_beep				; Complain on failure

	actionEnd

