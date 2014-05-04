;
;	generic_wearHead.m
;
;	Action code for generic get-or-wear a head operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	13-May-1986
;
	include	"action_head.i"

; This is the parameter to the 'wearOrGet' call
define WEAR_WHERE = 0x10

	actionStart

	lda #AVATAR_HEAD
	putArg WEAR_WHERE
	doMyAction HEAD_WEAR_ACTION
	rts

	actionEnd

