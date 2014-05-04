;
;	sex_changer_do.m
;
;	Action code for sex changer operation.
;	This is the 'do' behavior for sex changers.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	27-July-1986
;
	include	"action_head.i"

	actionStart

	jsr	v_punt_if_not_adjacent		; Must be next to machine
	chore	AV_ACT_operate
	waitWhile animation_wait_bit
	newImage pointed_noid, 1
	sendMsg pointed_noid, MSG_SEXCHANGE, 0	; Tell host about it
	getProp actor, OBJECT_orientation	; Get present sex bit...
	eor	#SEX_BIT			; ...toggle it...
	putProp actor				; ...and put it back.
	chore	AV_ACT_hand_back		; Make it show on screen
	waitWhile animation_wait_bit
	complexSound	SEX_CHANGER
	newImage pointed_noid, 0
	lda	#AV_ACT_get_shot
	chainTo v_set_actor_chore

	actionEnd
