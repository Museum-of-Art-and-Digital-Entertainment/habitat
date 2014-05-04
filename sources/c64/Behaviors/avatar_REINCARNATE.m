;
;	avatar_REINCARNATE.m
;
;	Action code for asynchronous event when an avatar is resurrected.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	11-August-86
;
	include	"action_head.i"

	actionStart

	moveb #2, region_trans_type
	chainTo v_wait_for_region

	actionEnd

