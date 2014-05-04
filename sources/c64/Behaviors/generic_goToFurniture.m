;
;	generic_goToFuniture.m
;
;	Action code for generic go-to-or-sit-in-or-get-up-from operation.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

	actionStart

;  parameters for sit_or_get_up
define	SIT_OR_GET_UP		=	0
define	SEAT_NOID		=	1

; values 
define	GET_UP			=	0
define	SIT_DOWN		=	1

; returned by host
define	SIT_SUCCESS		=	0
define	SIT_SLOT		=	1

; This is the parameter used in the request MSG_POSTURE
define NEW_POSTURE = 0

	lda	last_command_selected
	cmp	#ACTION_GO		; was this a goto ONLY?
	if (!equal) {
    		jsr	v_find_goto_coords
		stx	desired_x
		sty	desired_y
		chainTo	v_goXY
	}

	lda	Im_sitting
	if (!zero) {				; sitting, try to get up!
		lda	#GET_UP
		putarg	SIT_OR_GET_UP
		lda	pointed_noid
		putarg	SEAT_NOID
		sendMsg	actor_noid,MSG_SIT_OR_GET_UP, 2
		getResponse	SIT_SUCCESS
		if (zero) {
			chainTo	V_beep
		}
		lda	actor_noid
		jsr	v_get_subject_object
    		jsr	v_find_goto_coords
		txa
		pha
		tya
		ora	#0x80
		tay
		pha
		lda	#THE_REGION_NOID
		rjsr	v_change_containers
		pla
		putProp	actor, AVATAR_destination_y
		pla
		putProp	actor, AVATAR_destination_x
		chore	AV_ACT_stand
		clearb	Im_sitting
		rts
	}
	jsr	v_adjacency_check
	if (carry) {				; fail!
		jsr	v_find_goto_coords
		stx	desired_x
		sty	desired_y
		chainTo	v_goXY
	}
	lda	#SIT_DOWN
	putarg	SIT_OR_GET_UP
	lda	pointed_noid
	putarg	SEAT_NOID
	sendMsg actor_noid , MSG_SIT_OR_GET_UP, 2
	getResponse	SIT_SUCCESS
	if (!zero) {
		inc	Im_sitting
		lda	actor_noid
		jsr	v_get_subject_object
		ldx	#0			; where he will 'talk' from
		getResponse	SIT_SLOT
		tay
		lda	pointed_noid
		rjsr	v_change_containers

		ldy	#Object_style_pointer
		lda	y[@pointed_object]
		and	#1
		if (zero) {			; side view
			lda	#AV_ACT_sit_front
		} else {
			lda	#AV_ACT_sit_chair
		}
		putArg	NEW_POSTURE
		jsr	v_set_actor_chore
		sendMsg actor_noid, MSG_POSTURE, 1	; so host knows!
		rts
	}
	chainTo	v_beep

	ActionEnd
