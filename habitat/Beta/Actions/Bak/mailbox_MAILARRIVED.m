;
;	mailbox_MAILARRIVED.m
;
;	Action code for asynchronous mail arrival.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	lda #TRUE
	putProp actor, MAILBOX_mailArrived
	newImage actor_noid
	rts

	actionEnd
