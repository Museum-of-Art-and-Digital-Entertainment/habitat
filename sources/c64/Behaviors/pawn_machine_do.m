;
;	pawn_machine_do.m
;
;	Action code for the pawn machine 'munch and spit out token'
;	This is the 'do' behavior for pawn machines.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar/F Randall Farmer
;	Lucasfilm Ltd.
;	Sept, 1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

; returned by host
define	MUNCH_SUCCESS	=	0

	jsr	v_punt_if_not_adjacent
	chore	AV_ACT_operate
	complexSound	PAWN_MUNCH
	newImage pointed_noid, 1
	sendMsg pointed_noid, MSG_MUNCH, 0
	newImage pointed_noid, 0
	chore	AV_ACT_hand_back
	getResponse	MUNCH_SUCCESS
	cmp	#SUCCESS_VALUE
	if (equal) {
	    lda pointed_noid
	    chainTo v_purge_contents		; tokens arrive async.
	}
	chainTo	v_beep_or_boing

	actionEnd
