;
;	magic_lamp_do.m
;
;	Action code for the magic lamp rub operation.
;	This is the 'do' behavior for the magic lamp.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	To rub the lamp you have to be holding it, and the genie cannot have
;	 already emerged.
;
	include	"action_head.i"

; These are the parameters returned by the RUB request
define RUB_SUCCESS = 0
define RUB_MESSAGE = 1

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to do this
		getProp pointed, MAGIC_LAMP_state
		if (zero) {	; If genie not yet emerged, proceed
			sendMsg pointed_noid, MSG_RUB, 0
			getResponse RUB_SUCCESS
			if (!zero) {	; Non-zero encodes success
				lda #MAGIC_LAMP_GENIE
				putProp pointed, MAGIC_LAMP_state
				newImage pointed_noid
				sound	GENIE_APPEARS
				addwwb source, response_data, #RUB_MESSAGE
				moveb pointed_noid, actor_noid
				chainTo v_balloonMessage
			}
		}
		chainTo v_beep			; Gripe on failure
	}
	chainTo v_depends			; If not holding

	actionEnd

