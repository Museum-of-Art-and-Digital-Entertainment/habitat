;
;	magic_lamp_WISH.m
;
;	Action code for the asynchronous magic lamp WISH operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	This occurs when someone else makes a wish.  The lamp disappears.
;
	include	"action_head.i"

; This is the parameter of the WISH request (a string)
define WISH_MESSAGE = 0

	actionStart

;	addwwb	source, response_data, #WISH_MESSAGE
	movew	response_data, source	; (since WISH_MESSAGE is 0)
	jsr	v_balloonMessage
	sound	GENIE_OUT, actor_noid
	lda	actor_noid
	chainTo v_delete_object		; Nuke the lamp

	actionEnd

