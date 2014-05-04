;
;	tokens_rdo.m
;
;	Action code for token payment operation.
;	This is the 'rdo' behavior for tokens.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	To pay some money, you must be holding a token object (which, in this
;	 case, is guaranteed since this is an 'rdo' behavior).
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters to the PAY request
define PAY_TARGET = 0
define PAY_AMOUNT = 1
; scratch
define SAVE_POINT = 2

; These are the parameters returned by the PAY request
define PAY_SUCCESS = 0
define PAY_PRICE = 1
define PAY_NEW_TOKEN = 3

	actionStart

	getProp subject, OBJECT_class_pointer
	cmp #CLASS_AVATAR
	if (!equal) {
	    chainTo	v_beep
	}
	lda	pointed_noid			; 
	sta	SAVE_POINT			; this is all for adj check
	moveb	subject_noid, pointed_noid	; 
	jsr	v_set_up_pointed_pointers	; point to avatar for adja
	jsr	v_adjacency_check
	if (!carry) {				; adjacent
		getProp subject, OBJECT_contents+AVATAR_HAND
		if (!zero) {
			chainto	v_beep
		}
	} else {
	    chainTo v_beep
	}
	lda	SAVE_POINT
	sta	pointed_noid
	jsr	v_set_up_pointed_pointers
	getProp pointed, TOKENS_denomination	; Create a phoney longword...
	putArg 0				; ...using the denomination...
	iny
	getProp pointed
	putArg 1				; ...bytes for padding
	lda #0					; ...byte plus 2 more zero...
	putArg 2
	putArg 3
	movew #arguments, printf_parameters	; This is for prompt's sake
	rjsr v_select_denomination		; How much to pay?
	if (zero) {				; If no money chosen
		chainTo v_beep			; ...bag it
	}

	lda select_value
	putArg PAY_AMOUNT			; Set it
	lda select_value+1
	putArg PAY_AMOUNT+1			; Set it
	lda subject_noid			; Get the target
	putArg PAY_TARGET			; Set it
	chore AV_ACT_hand_out
	sendMsg pointed_noid, MSG_PAY, 3	; Tell host to pay
	chore AV_ACT_hand_back
	getResponse PAY_SUCCESS			; Did it work?
	cmp	#SUCCESS_VALUE
	if (!equal) {				; Nope, bail out
		chainTo v_beep_or_boing
	}

	ldx	actor_noid
	getResponse	PAY_PRICE+1
	pha
	getResponse	PAY_PRICE
	tay
	pla
	jsr	v_spend				; take away from me

	addwwb response_data, response_data, #PAY_NEW_TOKEN
	lda	#0				; container (not really)
	chainTo	v_unpack_contents_vector

	actionEnd

