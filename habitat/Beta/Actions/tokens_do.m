;
;	tokens_do.m
;
;	Action code for token balance/split query operation.
;	This is the do behavior for tokens.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

; These are the parameters to the SPLIT request
define SPLIT_AMOUNT = 0

; These are the parameters returned by the SPLIT request
define SPLIT_SUCCESS = 0
define SPLIT_NEW_VALUE = 1

	lda in_hand_noid
	cmp pointed_noid
	if (!equal) {
bail_out:
		chainTo v_beep			; ...bag it if not holding
	}
	getProp pointed, TOKENS_denomination	; Create a fake longword
	putArg 0				; ...using the denomination...
	iny
	getProp	pointed				; high
	putArg 1				; ...bytes for padding
	lda #0					; ...byte plus 2 more zero...
	putArg 2
	putArg 3
	movew #arguments, printf_parameters
	rjsr	v_select_denomination
	beq	bail_out

	lda select_value
	putArg SPLIT_AMOUNT			; Set it
	lda select_value+1
	putArg SPLIT_AMOUNT+1			; Set it
	chore AV_ACT_unpocket
	sendMsg pointed_noid, MSG_SPLIT, 2	; Tell host to split
	chore AV_ACT_stand
	getResponse SPLIT_SUCCESS		; Did it work?
	cmp	#SUCCESS_VALUE
	if (!equal) {				; Nope, bail out
		chainTo v_beep_or_boing
	}
	rts

	actionEnd				; created async





