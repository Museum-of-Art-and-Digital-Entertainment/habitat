;
;	avatar_talk.m
;
;	Action code for the avatar 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;	3-August-1986 add ESP (Chip)
;
	include	"action_head.i"

; This is the parameter returned by the TALK message:
define TALK_ESP_ON = 0

	actionStart

	ldx	pointed_noid
	jsr	v_talk			; (Sends off a message & waits)
	getResponse TALK_ESP_ON		; Did the host declare ESP mode?
	if (!zero) {
		sound	ESP_ACTIVATES
ESP_loop:
		rjsr	v_get_ESP_text
		ldx	pointed_noid
		jsr	v_ESP_talk	; (Sends off a message & waits)
		sound	ESP_MESSAGE_SENT
		getResponse TALK_ESP_ON	; Did the host continue ESP mode?
		bne	ESP_loop
		sound	ESP_DEACTIVATES
	}
	rts

	actionEnd
