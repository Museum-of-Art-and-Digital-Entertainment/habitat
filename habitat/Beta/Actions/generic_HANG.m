;
;	generic_HANG.m
;
;	Action code to handle the ANSWER asynchronous message.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	getProp actor, OBJECT_class_pointer
	cmp #CLASS_PHONE_BOOTH
	if (equal) {
		getProp actor, TELEPHONE_state
		cmp #PHONE_LINE_BUSY
		beq busy
		cmp #PHONE_LINE_RING
		if (equal) {
busy:			/* sound effect of phone jangle */
			lda #PHONE_CALL_COST
			jsr v_refund
		}
	}
	/* sound effect thump of phone hanging up */
	/* sound of silence */
	lda #PHONE_READY
	putProp actor, TELEPHONE_state
	rts

	actionEnd
