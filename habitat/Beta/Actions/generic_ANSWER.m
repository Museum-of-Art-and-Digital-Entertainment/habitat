;
;	generic_ANSWER.m
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

; These are the parameters used in the ANSWER message:
define ANSWER_WHO = 0
define ANSWER_SUCCESS = 1

	actionStart

	getResponse ANSWER_SUCCESS
	if (!zero) {
		lda #PHONE_TALKING
		putProp actor, TELEPHONE_state
		/* sound effect of silence */
		rts
	}
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
	rts

	actionEnd
