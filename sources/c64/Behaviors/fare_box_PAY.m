;
;	fare_box_PAY.m
;
;	Action code for the asynchronous pay-for-the-bus operation.
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
	chainTo	v_spend

	actionEnd
