;
;	paper_do.m
;
;	Action code for the paper editing operation.
;	This is the 'do' behavior for the paper.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; This is the parameter to the READ request:
define READ_PAGE = 0
;  reply data
define	SENDMAIL_SUCCESS	=	0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (!equal) {			; Have to be holding paper
	    chainTo	v_depends
	}
	lda #ENTER_TEXT_MODE_COMMAND
	rjsr v_text_handler		; Initialize text mode

	lda #0				; Start with page zero
	putArg READ_PAGE		; Set parameter
    	sendMsg pointed_noid, MSG_READ, 1 ; Read the page

	lda #(TEXT_EXITABLE_MODE | TEXT_WRITEABLE_MODE |
		RECEIVE_PAGE_COMMAND)	; Paper modes
	rjsr v_text_handler		; Do it

	pha				; save incase mailed
	and #TEXT_WRITTEN_BIT		; Test for change
	if (!zero) {			; If changed...
		newImage pointed_noid, 1
		ldx pointed_noid	; Write to this paper!
		ldy #0			; Page #0 (always)
		lda #TRANSMIT_PAGE_COMMAND
		rjsr v_text_handler	; ...send the changes off
		getResponse SENDMAIL_SUCCESS
		if (zero) {
		    pla
		    bne		exit_paper
		}
	}
	pla
	and #TEXT_MAIL_BIT		; should I mail this
	if (!zero) {
		sendMsg		pointed_noid, MSG_PAPER_SENDMAIL,0
		getResponse	SENDMAIL_SUCCESS
		if (!zero) {
		    sound	0		; do something neat.
		} else {
		    jsr	v_beep
		}
	}
exit_paper:
	lda #EXIT_TEXT_MODE_COMMAND	; Turn off text mode
	chainTo v_text_handler

	actionEnd

