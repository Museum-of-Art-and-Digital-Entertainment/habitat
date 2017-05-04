;
;	generic_changeState.m
;
;	Action code for generic do-thing operation.
;	This is the standard 'do' behavior for things that change.
;
;	This file should be assembled as position independent code.
;
;
	include	"action_head.i"

;  reply
define	NEW_STATE	=	0

	actionStart

	sendMsg pointed_noid, MSG_MAGIC, 0
	complexSound	MAGIC
	getResponse	NEW_STATE
	newImage	pointed_noid		; the rest is async
	rts

	actionEnd
