;
;	generic_rdoMagic.m
;
;	Action code for generic do-magical-thing operation.
;	This is the standard 'rdo' behavior for magical objects.
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

	lda	subject_noid
	putArg	AFFECTED_OBJECT
	chore	Av_act_point
	sendMsg pointed_noid, MSG_MAGIC, 1	; Works asynchronously
	complexSound	MAGIC
	rts

	actionEnd

