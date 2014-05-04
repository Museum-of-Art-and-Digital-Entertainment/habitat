;
;	answering_machine_do.m
;
;	Action code for the play-a-message answering machine operation.
;	This is the 'do' behavior for answering machine objects.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-May-1986
;
	include	"action_head.i"

; These are the parameters returned by the PLAYMESSAGE request:
define ANSWERING_MACHINE_MORE_MESSAGES = 0
define ANSWERING_MACHINE_MESSAGE = 1

	actionStart

	jsr	v_punt_if_not_adjacent

		getProp pointed, ANSWERING_MACHINE_messageWaiting
		if (!zero) {		; If there are messages...
			newImage pointed_noid, ANSWERING_MACHINE_BLINK
			sendMsg pointed_noid, MSG_PLAYMESSAGE, 0
			getResponse ANSWERING_MACHINE_MORE_MESSAGES
			putProp pointed, ANSWERING_MACHINE_messageWaiting
			newImage pointed_noid
			incw response_data
			movew response_data, source
			chainTo	v_balloonMessage
		}
		chainTo v_beep

	actionEnd

