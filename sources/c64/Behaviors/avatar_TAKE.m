;
;	avatar_TAKE.m
;
;	Action code for the asynchronous pill taking operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	getProp actor, DRUGS_count		; Get count
	tax
	dex					; Decrement
	if (zero) {				; If all gone...
		lda actor_noid
		chainTo v_delete_object		; Nuke it
	}
	putProp actor			; Otherwise just note new count
	rts

	actionEnd

