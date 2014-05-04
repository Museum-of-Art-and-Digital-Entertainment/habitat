;
;	parking_meter_EXPIRE.m
;
;	Action code for the asynchronous parking meter expiration operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	lda #PARKING_METER_EXPIRED
	putProp actor, PARKING_METER_state
	newImage actor_noid
	rts

	actionEnd
