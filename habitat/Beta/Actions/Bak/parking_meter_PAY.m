;
;	parking_meter_PAY.m
;
;	Action code for the asynchronous pay-for-parking operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda #PARKING_METER_TICKING
	putProp actor, PARKING_METER_state
	newImage actor_noid
	lda #PARKING_COST
	chainTo	v_spend

	actionEnd
