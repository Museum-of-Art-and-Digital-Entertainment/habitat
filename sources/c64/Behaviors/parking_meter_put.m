;
;	parking_meter_put.m
;
;	Action code for the pay-for-parking operation.
;	This is the 'put' behavior for the parking meter.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda #PARKING_COST
	jsr v_pay_coinop_or_drop
	if (carry) {
		lda #PARKING_METER_TICKING
		putProp pointed, PARKING_METER_state
		newImage pointed_noid
	}
	rts

	actionEnd
