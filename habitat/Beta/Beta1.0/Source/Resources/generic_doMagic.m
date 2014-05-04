;
;	generic_doMagic.m
;
;	Action code for generic do-magical-thing operation.
;	This is the standard 'do' behavior for magical objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

; send
define	AFFECTED_OBJECT	=	0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to perform magic
		complexSound	MAGIC
		lda	actor_noid
		putArg	AFFECTED_OBJECT
	    	sendMsg pointed_noid, MSG_MAGIC, 1	; Works asynchronously
		rts
	}
	chainTo v_depends	; In not holding, punt to 'depends'
	actionEnd

