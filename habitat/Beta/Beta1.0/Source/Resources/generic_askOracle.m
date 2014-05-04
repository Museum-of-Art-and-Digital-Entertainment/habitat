;
;	generic_askOracle.m
;
;	Action code for oracle 'talk' behaviors.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

	actionStart

	; The only parameter to the ASK request is the string itself, which is
	;  pointed to by 'source'
	lda	input_text_length	; Length from input
	ldy	#MSG_ASK		; ASK request
	ldx	pointed_noid		; Sent to the oracle itself
	rjsr	v_send_string		; Send the request
	chainTo	v_clear_text_line

	actionEnd
