;
;	generic_doMagicIfMagic.m
;
;	Action code for generic conditional do-magical-thing operation.
;	This is the standard 'do' behavior for possibly magical objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;
	include	"action_head.i"

define	AFFECTED_OBJECT	=	0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to perform magic
		getProp pointed, GENERIC_isMagic
		if (!zero) {	; Only do magical function if actually magical
			complexSound	MAGIC
			lda	actor_noid
			putArg	AFFECTED_OBJECT
		    	sendMsg pointed_noid, MSG_MAGIC, 1 ; Works asynch.
			rts
		}
		chainTo v_beep	; Otherwise complain
	}
	chainTo v_depends	; If not holding, punt to 'depends'

	actionEnd

