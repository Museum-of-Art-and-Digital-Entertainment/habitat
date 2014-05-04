;
;	answering_machine_talk.m
;
;	Action code for answering machine 'talk' behaviors.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	; The only parameter to the SETANSWER request is the string itself,
	;  which is pointed to by 'source'
	lda	input_text_length	; Length from input
	ldy	#MSG_SETANSWER		; SETANSWER request
	ldx	pointed_noid		; Sent to the machine itself
	clc				; No response expected
	jsr	v_send_string		; Send the request...
	chainTo	v_balloonMessage	; ...and echo it locally

	actionEnd
