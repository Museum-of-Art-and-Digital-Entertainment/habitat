;
;	generic_test.m
;
;	Action code for dummy test object.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	12-August-1986
;
	include	"action_head.i"

	actionStart

    	sendMsg pointed_noid, 1, 0
	rts

	actionEnd

