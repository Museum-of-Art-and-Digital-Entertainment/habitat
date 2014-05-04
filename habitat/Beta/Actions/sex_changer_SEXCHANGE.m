;
;	sex_changer_SEXCHANGE.m
;
;	Action code for asynchronous sex changer operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	27-July-1986
;
	include	"action_head.i"

; This is the parameter of the SEXCHANGE* request:
define SEXCHANGE_TARGET = 0

	actionStart

	moveOb actor, pointed
	getResponse SEXCHANGE_TARGET		; Whom are we changing?
	sta	actor_noid
	jsr	v_set_up_actor_pointers		; Make avatar accessible
	chore	AV_ACT_operate
	asyncAnimationWait
	newImage pointed_noid, 1
	getProp actor, OBJECT_orientation	; Get present sex bit...
	eor	#SEX_BIT			; ...toggle it...
	putProp actor				; ...and put it back
	chore	AV_ACT_hand_back		; Make it show on screen
	asyncAnimationWait
	complexSound	SEX_CHANGER
	newImage pointed_noid, 0
	lda	#AV_ACT_get_shot
	chainTo v_set_actor_chore

	actionEnd
