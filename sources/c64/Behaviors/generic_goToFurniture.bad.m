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

; values 
define	GET_UP			=	0
define	SIT_DOWN		=	1

; returned by host
define	SIT_SUCCESS		=	0

	lda	Im_sitting
	if (!zero) {				; sitting, try to get up!
		lda	actor_noid
		jsr	v_get_subject_object
		jsr	v_get_furniture_xy	; in xy
		lda	#THE_REGION_NOID
		jsr	v_change_containers
		chore	av_act_stand
		lda	#GET_UP
		putarg	SIT_OR_GET_UP
		sendMsgN	actor_noid,MSG_SIT_OR_GET_UP, 1
		clearb	Im_sitting
		rts
	}
	jsr	v_adjacency_check
	if (carry) {				; fail!
		jsr	v_get_furniture_xy	; in xy
		stx	desired_x
		sty	desired_y
		chainTo	v_goXY
	}
	lda	#SIT_DOWN
	putarg	SIT_OR_GET_UP
	sendMsg actor_noid , MSG_SIT_OR_GET_UP, 1
	getResponse	SIT_SUCCESS
	if (zero) {
		inc	Im_sitting
		lda	pointed_noid
		jsr	v_putInto
		ldy	#Object_style
		lda	y[@pointed_object]
		and	#1
		if (zero) {				; side view
			lda	#AV_ACT_sit
		} else {
			lda	#AV_ACT_sit_front
		}
		chainto	v_set_chore
	}
	chainTo	v_beep

	ACTionEnd
