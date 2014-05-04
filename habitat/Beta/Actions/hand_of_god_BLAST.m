;
;	hand_of_god_BLAST.m
;
;	Action code for the asynchronous zap.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

; This is the parameter to the BLAST message:
define BLAST_TARGET = 0

	actionStart

	lda #GOD_FIRING				; Put into blast mode
	putProp actor, HAND_OF_GOD_state
	getResponse BLAST_TARGET		; Zap the TARGET, not me!
	chainTo v_delete_object			; Do it!
	/* we need animation here */

	actionEnd
