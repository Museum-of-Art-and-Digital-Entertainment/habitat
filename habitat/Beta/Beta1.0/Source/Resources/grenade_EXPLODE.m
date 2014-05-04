;
;	grenade_EXPLODE.m
;
;	Action code for the asynchronous grenade explosion.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
	include	"action_head.i"

	actionStart

	/* Create an explosion on the screen */
	complexSound	0,actor_noid		; BOOM!
	lda actor_noid
	chainTo v_delete_object		; Nuke the grenade itself

	actionEnd

