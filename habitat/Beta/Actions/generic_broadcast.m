;
;	generic_broadcast.m
;
;	Action code for broadcast operation.
;	This is the almost universal default 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Originally coded by Randy Farmer
;	Prettified by Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
	include	"action_head.i"

; This is the parameter returned by the TALK message:
define TALK_ESP_ON = 0

	actionStart
	ldx	#0			; Send to everybody
	rjsr	v_talk
	getResponse TALK_ESP_ON		; Did the host declare ESP mode?
	if (!zero) {
		sound	ESP_ACTIVATES, actor_noid
ESP_loop:
		rjsr	v_get_ESP_text
		ldx	#0
		rjsr	v_ESP_talk	; (Sends off a message & waits)
		sound	ESP_MESSAGE_SENT, actor_noid
		getResponse TALK_ESP_ON	; Did the host continue ESP mode?
		bne	ESP_loop
		sound	ESP_DEACTIVATES, actor_noid
;		rts
	}
;	addwwb	source, response_data, #1
;	chainTo v_balloonMessage
	rts

	actionEnd
