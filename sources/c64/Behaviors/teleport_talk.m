;
;	teleport_talk.m
;
;	Action code for teleport 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	22-May-1986
;
	include	"action_head.i"

; This is the parameter returned by the ZAPTO request:
define TELEPORT_SUCCESS = 0

define TELEPORT_BROADCAST = 12

	actionStart

	jsr	v_adjacency_check
	if (!carry) {
	; The only parameter to the ZAPTO request is the string itself,
	;  which is pointed to by 'source'
	getProp pointed, TELEPORT_state
	cmp #TELEPORT_ACTIVE
	if (equal) {			; If teleport is active...
		lda	input_text_length	; Length from input
		ldy	#MSG_ZAPTO		; ZAPTO request
		ldx	pointed_noid		; Sent to the machine itself
		rjsr	v_send_string		; Send the request...
		complexSound	TELEPORT_CONF_WAIT
		waitWhile reply_wait_bit	; Wait for response
		getResponse	TELEPORT_SUCCESS
		if (!zero) {
			complexSound	TELEPORT_DEPARTING
			lda #TELEPORT_READY
			putProp pointed, TELEPORT_state
			moveb	#2, region_trans_type	; teleport sounds!
			chainto	v_wait_for_region
		}
		jsr	v_clear_text_line
		complexSound	TELEPORT_ACTIVATES
		rts
	}
	}
	doMyAction TELEPORT_BROADCAST
	rts

	actionEnd
