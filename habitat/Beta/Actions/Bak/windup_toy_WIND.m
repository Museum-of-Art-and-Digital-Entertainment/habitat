;
;	windup_WIND.m
;
;	Action code for the asynchronous windup toy wind operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	5-May-1986
;
	include	"action_head.i"

	actionStart

	getProp actor, WINDUP_TOY_windLevel
	inca			; Increment wind count
	cmp #4
	if (geq) {		; Clamp at 4
		lda #4
	}
	putProp actor		; Save new count
	lda #WINDUP_WOUND
	newImage actor_noid
	rts

	actionEnd

