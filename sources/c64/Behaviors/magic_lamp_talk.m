;
;	magic_lamp_talk.m
;
;	Action code for the magic lamp 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

define MAGIC_LAMP_BROADCAST = 10

	actionStart

	getProp pointed, MAGIC_LAMP_state	; Genie has to be there.
	if (!zero) {
		lda	input_text_length	; Length from input
		ldy	#MSG_WISH		; WISH request
		ldx	pointed_noid		; Sent to the lamp
		rjsr	v_send_string		; Send the request
		chainTo	v_clear_text_line
	}
	doMyAction MAGIC_LAMP_BROADCAST
	rts

	actionEnd
