;
;	coke_machine_put.m
;
;	Action code for the buy-a-coke operation.
;	This is the 'put' behavior for the coke machine.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;

	include	"action_head.i"

define COINOP_success = 0

	actionStart

	doMyAction	COKE_COINOP
	getArg	COINOP_success
	if (!zero) {
	    complexSound	STINGY_COKE_MACHINE
	}
	rts

	actionEnd
