;
;	avatar_PAID.m
;
;	Action code for asynchronous token payment operation.
;	This happens when you are paid some amount.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters of the PAID message
define PAID_PAYER = 0
define PAID_AMOUNT = 1
define PAID_TOKEN = 3

	actionStart

	getResponse	PAID_PAYER
	tax
	getResponse	PAID_AMOUNT+1
	tay
	getResponse	PAID_AMOUNT
	jsr		v_spend				; make him pay!
	addwwb response_data, response_data, #PAID_TOKEN
	lda	#0				; pretend its the region
	rjsr v_unpack_contents_vector
	rts

	actionEnd

