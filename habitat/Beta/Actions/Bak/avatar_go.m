;
;	avatar_go.m
;
;	Action code for the avatar 'go' behavior.
;
;	This file should be assembled as position independent code.
;
;	Interpretation of 'go' when pointing at an avatar is as follows: if
;	 the avatar pointed at is not yourself, then treat it as an ordinary
;	 goTo operation.  Otherwise, treat it as a command to change your own
;	 posture.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

; This is the parameter used in the request MSG_POSTURE
define NEW_POSTURE = 0

	actionStart

	lda	pointed_noid
	cmp	me_noid
	if (!equal) {				; If not me, then goTo him/her
		jsr	v_find_goto_coords
		stx	desired_x
		sty	desired_y
		chainTo	v_goXY			; Will actually execute move
	} else {
		lda	new_region_flag
		if (plus) {			; changing regions?
			chainTo	v_goXY
		}
		getProp pointed, AVATAR_background_activity
		cmp	#AV_act_stand
		if (equal) {
			lda	#AV_act_sit_floor
		} else {
			lda	#AV_act_stand
		}
		putArg	NEW_POSTURE
		jsr	v_set_actor_chore
		sendMsg pointed_noid, MSG_POSTURE, 1
		rts
	}
	actionEnd
