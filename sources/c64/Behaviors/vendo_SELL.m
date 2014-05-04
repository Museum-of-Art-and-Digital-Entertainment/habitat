;
;	vendo_SELL.m
;
;	Action code for the asynch pay-for-item-from-vendo operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	19-June-1986
;
	include	"action_head.i"

	actionStart

; This is the parameter of the SELL message
define SELL_buyer = 0
define SELL_price = 1
define VENDO_product = 3

	complexSound	VENDO_DISPENSING, actor_noid
	getResponse SELL_buyer
	tax
	getResponse SELL_PRICE+1
	pha
	getResponse SELL_PRICE
	tay
	pla
	jsr v_spend			; Spend the money
	addwwb response_data, response_data, #VENDO_PRODUCT
	lda	#0			;drop in region
	chainTo v_unpack_contents_vector

	actionEnd
