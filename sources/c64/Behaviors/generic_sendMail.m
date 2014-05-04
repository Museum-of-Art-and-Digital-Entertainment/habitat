;
;	generic_sendMail.m
;
;	Action code for the generic send mail from a mailbox operation.
;	This is the 'put' behavior for mailbox type objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the SENDMAIL request:
define SENDMAIL_SUCCESS = 0

	actionStart

	lda in_hand_noid
	if (!zero) {		; Hand must not be empty
		getProp in_hand, OBJECT_class_pointer
		cmp #CLASS_PAPER
		if (equal) {	; Must be holding paper
			doMyAction ACTION_GO	; My GO walks to this object
			waitWhile animation_wait_bit ; Wait till we get there
			chore AV_ACT_hand_out
			sendMsg pointed_noid, MSG_SENDMAIL, 0
			getResponse SENDMAIL_SUCCESS
			if (!zero) {
				complexSound	MAIL_INTO_MAILBOX
				lda #AV_ACT_hand_back
				jsr v_set_actor_chore
				lda in_hand_noid
				chainTo v_delete_object	; Paper goes away
			}
		}
	}
	chainTo v_beep		; Beep on error

	actionEnd
