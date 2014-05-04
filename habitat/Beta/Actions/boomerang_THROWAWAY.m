;
;	boomerang_THROWAWAY.m
;
;	Action code for the asynchronous throw the boomerang operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	getProp actor, OBJECT_contained_by
	jsr v_get_subject_object

	lda actor_noid
	jsr v_delete_object
	
	moveOb subject, actor
	chore AV_ACT_throw
	asyncAnimationWait
	chore AV_ACT_hand_back

	rts

	actionEnd
