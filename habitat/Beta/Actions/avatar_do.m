;
;	avatar_do.m
;
;	Action code for the avatar 'do' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	19-May-1986
;
; 	Modified 11-17-86 F.R.F
; 
;	If we are pointing at ourselves, we want to 'do' with whatever is in
;	 hand (and beep if hand is empty).  If it is somebody else, we want
;	 to try to touch them or punt to 'depends'.
;
	include	"action_head.i"
	include "class_equates.m"

define	AVATAR_TOUCHED	=	0
define	TOUCH_CHORE	=	1

	actionStart

	lda	pointed_noid
	putArg	AVATAR_TOUCHED
	cmp	me_noid
	if (!equal) {				; If not me, depends...
	    lda	in_hand_noid
	    if (zero) {
		jsr	v_punt_if_not_adjacent	; punt to depends if not near
		lda	#AV_ACT_hand_out
		putArg	TOUCH_CHORE
		jsr	v_set_actor_chore
		sendMsg	actor_noid,MSG_TOUCH,2	; tell host,it'll know
		rts
	    } else {
		chainto	v_depends
	    }
	} else {
	    lda	in_hand_noid
	    if (!zero)	{			; Hand must not be empty
		jsr	v_get_subject_object	;; Try this
		moveOb	subject, pointed	;;
		lda	#ACTION_DO		; Perform in_hand's 'do'
		chainTo v_issue_nested_command
	    }
	}
	chainTo v_beep

	actionEnd
