;
;	generic_adjacentDoMagic.m
;
;	Action code for generic do-magical-thing operation.
;	This is the standard 'do' behavior for magical objects.
;
;	This file should be assembled as position independent code.
;
;
	include	"action_head.i"

;  reply
define	NEW_STATE	=	0
; send
define	AFFECTED_OBJECT	=	0

	actionStart

;	jsr	v_punt_if_not_adjacent

	doMyAction	ACTION_GO		; walk to it.
	waitWhile	animation_wait_bit

	lda	actor_noid
	putArg	AFFECTED_OBJECT
	chore	AV_ACT_operate
	waitWhile	animation_wait_bit
	sendMsg pointed_noid, MSG_MAGIC, 1
	complexSound	MAGIC
	getResponse	NEW_STATE
	newImage	pointed_noid		; the rest is async
	chore	AV_ACT_hand_back
	rts

	actionEnd

