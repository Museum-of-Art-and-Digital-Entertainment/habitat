;
;	avatar_SITORGETUP.m
;
;	Action code for generic go-to-or-sit-in-or-get-up-from operation.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Lucasfilm Ltd.
;	9 - august - 86
;
	include	"action_head.i"

	actionStart

;  parameters from host
define	SIT_OR_GET_UP		=	0
define	SEAT_NOID		=	1
define	SEAT_SLOT		=	2

; values 
define	GET_UP			=	0
define	SIT_DOWN		=	1

	getResponse	SIT_OR_GET_UP
	cmp	#SIT_DOWN
	if (!equal) {				; sitting, try to get up!
		lda	actor_noid
		jsr	v_get_subject_object
		getResponse	SEAT_NOID
		tay
		jsr	v_get_furniture_xy
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
		chore	av_act_stand
		rts
	}

	lda	actor_noid
	jsr	v_get_subject_object
	getProp	actor, AVATAR_destination_x
	putProp	actor, OBJECT_x_position
	getProp	actor, AVATAR_destination_y
	putProp	actor, OBJECT_y_position
	asyncAnimationWait
	ldx	#0
	getResponse	SEAT_NOID
	pha
	getResponse	SEAT_SLOT
	tay
	pla
	rjsr	v_change_containers

	getResponse	SEAT_NOID
	jsr	v_get_subject_object
	ldy	#Object_style_pointer
	lda	y[@subject_object]
	and	#1
	if (zero) {			; side view
		lda	#AV_ACT_sit_front
	} else {
		lda	#AV_ACT_sit_chair
	}
	chainto	v_set_actor_chore

	actionEnd
