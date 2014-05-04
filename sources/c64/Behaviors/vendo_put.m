;
;	vendo_put.m
;
;	Action code for the pay-for-item-from-vendo operation.
;	This is the 'put' behavior for the vendo.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	19-June-1986
;
	include	"action_head.i"

	actionStart

; This is the value returned by the coinop function
define COINOP_success = 0
define COINOP_price = 1
define VENDO_product = 3

	doMyAction VENDO_COINOP		; Spend the money if you can
	getArg COINOP_success		; Did it work?
	cmp	#SUCCESS_VALUE
	if (equal) {			; If so, create a new object
		complexSound	VENDO_DISPENSING
		addwwb response_data, response_data, #VENDO_PRODUCT
		lda	#0		; container = region
		chainTo v_unpack_contents_vector
	}
	chainTo v_beep_or_boing		; Complain on failure

	actionEnd
