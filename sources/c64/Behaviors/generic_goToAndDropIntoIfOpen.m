;
;	generic_goToAndDropIntoIfOpen.m
;
;	Action code for generic go-to-object-and-drop-something-into-it
;		operation.
;	This is the common 'put' for closeable containers.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
	include	"action_head.i"


define SAVE_TARGET = 0

	actionStart

	lda	in_hand_noid
	if (zero) {				; Hand must NOT be empty
		chainTo v_beep
	}
	cmp	pointed_noid
	if (equal) {chainTo v_beep}
	containerAbort
	doMyAction ACTION_GO		; My GO walks to this object
	waitWhile animation_wait_bit	; Wait till we get there
	getPropC pointed, CONTAINER_flags
	and #OPEN_BIT
	if (zero) {			; If closed, fail
		chainTo v_beep
	}
	lda	pointed_noid
	putArg SAVE_TARGET
	chore AV_ACT_bend_over
	waitWhile animation_wait_bit
	getArg SAVE_TARGET
	rjsr v_putInto
	chore AV_ACT_bend_back
	rts

	actionEnd
