;
;	answering_machine_TAKEMESSAGE.m
;
;	Action code for asynchronous answering machine activation operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

	actionStart

	newImage actor_noid, ANSWERING_MACHINE_ON
	lda #TRUE
	putProp actor, ANSWERING_MACHINE_messageWaiting
	rts

	actionEnd
