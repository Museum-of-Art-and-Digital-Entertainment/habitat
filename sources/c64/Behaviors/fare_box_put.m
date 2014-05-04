;
;	fare_box_put.m
;
;	Action code for the pay-for-the-bus operation.
;	This is the 'put' behavior for the fare box.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda #BUS_FARE
	chainTo	v_pay_coinop_or_drop

	actionEnd
