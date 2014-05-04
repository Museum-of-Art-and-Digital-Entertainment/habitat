;
;	phone_booth_get.m
;
;	Action code for the answer-or-pickup pay phone operation.
;	This is the 'get' behavior for phone booth objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	jsr	v_adjacency_check
	if (!carry) {
	    lda #PHONE_ACTIVE
	    chainTo v_answer_or_unhook
	}
	chainTo v_beep

	actionEnd
