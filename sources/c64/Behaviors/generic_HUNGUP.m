;
;	generic_HUNGUP.m
;
;	Action code to handle the HUNGUP asynchronous message.
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

	getProp actor, TELEPHONE_state
	cmp #PHONE_TALKING
	if (equal) {
		/* sound effect of line thump */
		getProp actor, OBJECT_class_pointer
		cmp #CLASS_PHONE_BOOTH
		if (equal) {
			lda #PHONE_OFF_HOOK
		} else {
			lda #PHONE_ACTIVE
		}
		putProp actor, TELEPHONE_state
		/* sound effect of dial tone */
	} else {
		lda #PHONE_READY
		putProp actor
	}
	rts

	actionEnd
