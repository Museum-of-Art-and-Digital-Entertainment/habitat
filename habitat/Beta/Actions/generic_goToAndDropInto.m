;
;	generic_goToAndDropInto.m
;
;	Action code for generic go-to-object-and-drop-something-into-it
;		operation.
;	This is the most common 'put' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

define SAVE_TARGET = 0
	actionStart

	lda	in_hand_noid
	if (zero) { chainTo v_beep }		; Hand must NOT be empty
	cmp	pointed_noid
	if (equal) {chainTo v_beep}
	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there
	lda	pointed_noid
	putArg SAVE_TARGET
	chore AV_ACT_bend_over
	waitWhile animation_wait_bit
	getArg SAVE_TARGET
	rjsr v_putInto
	chore AV_ACT_bend_back
	rts

	actionEnd
