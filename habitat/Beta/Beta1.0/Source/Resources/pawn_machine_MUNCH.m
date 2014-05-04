;
;	pawn_machine_MUNCH.m
;
;	Asynch code for the pawn machine operation.
;	This is the asynch behavior for pawn machines.
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

; sent by host
define	MUNCHER_NOID	=	0		; avatar 'do'ing the machine

	moveb		actor_noid, subject_noid
	complexSound	PAWN_MUNCH, actor_noid
	getResponse	MUNCHER_NOID
	sta		actor_noid
	jsr		v_set_up_actor_pointers
	chore		AV_ACT_operate
	newImage 	subject_noid, 1
	asyncAnimationWait
	chore		AV_ACT_hand_back
	asyncAnimationWait
	newImage	subject_noid, 0
	rts

	actionEnd
