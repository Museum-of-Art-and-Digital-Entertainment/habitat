;
;	jukebox_talk.m
;
;	Action code for the jukebox item selection behavior.
;	This is the 'talk' behavior of jukebox objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; This is the parameter returned by the SELECT request:
define SELECT_SUCCESS = 0

	actionStart

	getProp pointed, JUKEBOX_playsToGo	; There must be plays to go
	if (!zero) {
		; The only parameter to the SELECT request is the
		;  string itself, which is pointed to by 'source'
		lda	input_text_length	; Length from input
		ldy	#MSG_SELECT		; SELECT request
		ldx	pointed_noid		; Sent to the jukebox
		jsr	v_send_string		; Send the request...
		jsr	v_balloonMessage	; ...and echo it locally

		;waitFor reply_wait_bit		; Wait for response

		lda	switcher		; appears to be debug code
		cmp	reply_wait_bit
		beq	jukebox_next
		lda	0xd020
		pha
		lda	reply_wait_bit
		sta	0xd020
jukebox_wait:
		lda	switcher
		cmp	reply_wait_bit
		bne	jukebox_wait
		pla
		sta	0xd020

jukebox_next:
		jsr	v_clear_text_line
		getResponse SELECT_SUCCESS
		if (!zero) {			; If it worked...
			lda	#0
			putProp pointed, JUKEBOX_playsToGo
			rts
		}
	}
	chainTo v_beep			; Complain on failure

	actionEnd
