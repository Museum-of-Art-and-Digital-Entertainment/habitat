;
;	boomerang_rdo.m
;
;	Action code for the throw the boomerang operation.
;	This is the 'rdo' behavior for the boomerang object.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	chore AV_ACT_throw
	sendMsgN pointed_noid, MSG_THROW, 1
	chore AV_ACT_hand_back
	lda pointed_noid
	chainTo v_delete_object

	actionEnd
