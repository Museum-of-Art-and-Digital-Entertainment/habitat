;
;	generic_UNHOOK.m
;
;	Action code to handle the UNHOOK asynchronous message.
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
		lda #PHONE_OFF_HOOK
	} else {
		lda #PHONE_READY
	}
	putProp actor, TELEPHONE_state
	/* sound effect of click-clunk */
	/* sound effect of dial tone */
	rts

	actionEnd
