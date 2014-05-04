;
;	magic_lamp_RUB.m
;
;	Action code for the asynchronous magic lamp rub operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

define RUB_MESSAGE = 0

	actionStart

	sound	GENIE_APPEARS, actor_noid
	lda #MAGIC_LAMP_GENIE
	putProp actor, MAGIC_LAMP_state
	newImage actor_noid
;	addwwb source, response_data, #RUB_MESSAGE
	movew response_data, source
	chainTo v_balloonMessage

	actionEnd

