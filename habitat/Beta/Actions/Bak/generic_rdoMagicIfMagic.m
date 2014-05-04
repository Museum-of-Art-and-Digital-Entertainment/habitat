;
;	generic_rdoMagicIfMagic.m
;
;	Action code for generic conditional do-magical-thing operation.
;	This is the standard 'rdo' behavior for possibly magical objects.
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

	lda	subject_noid
	putArg	AFFECTED_OBJECT
	getProp pointed, GENERIC_isMagic
	if (!zero) {	; Only do magical function if actually magical
		complexSound	MAGIC
		chore	Av_act_point
	    	sendMsg pointed_noid, MSG_MAGIC, 1 ; Works asynch.
		rts
	}
	chainTo v_beep	; Otherwise complain
	actionEnd

