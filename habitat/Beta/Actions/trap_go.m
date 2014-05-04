;
;	trap_go.m
;
;	Action code for generic go-to-trapazoid operation.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

	actionStart

	getProp	pointed, TRAP_type		; 0, 1 ,2 or ???
	clc
	adc	#TRAP_INTERNALS_OFFSET		;  get internal goto behavour
	jmp	v_issue_nested_command		;  DO IT!

	actionEnd
