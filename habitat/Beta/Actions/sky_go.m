;
;	sky_go.m
;
;	Action code for go-over-the-horizon operation.
;	This is the 'go' behavior for the sky.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-May-1986
;
	include	"action_head.i"

	actionStart
	rjsr	v_goXY
	lda	go_success
	if (zero) {
	    chainTo	v_beep
	}
	lda	new_region_flag
	if (plus) {			; called by 'go left or right'?
	    rts
	}
	lda	#direction_up
	chainTo	v_go_to_new_region
	actionEnd

