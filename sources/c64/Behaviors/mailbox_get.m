;
;	mailbox_get.m
;
;	Action code for the receiving of mail from a mailbox operation.
;	This is the 'get' behavior for the mailbox.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters returned by the READMAIL request
define READMAIL_MOREMAIL = 0
define READMAIL_SUCCESS = 1

	actionStart

	lda in_hand_noid
	if (zero) {		; Hand must be empty
		doMyAction ACTION_GO	; My GO walks to this object
		waitWhile animation_wait_bit ; Wait till we get there

		chore AV_ACT_hand_out
		sendMsg pointed_noid, MSG_READMAIL, 0	; Get a letter
		chore AV_ACT_hand_back
		getResponse READMAIL_MOREMAIL		; Any more?
		putProp pointed, MAILBOX_mailArrived	; Note if so
		newImage pointed_noid
		getResponse READMAIL_SUCCESS
		if (!zero) {
			complexSound	MAIL_OUT_OF_MAILBOX
			rts
		}
	}
	chainTo v_beep		; Beep on error

	actionEnd
