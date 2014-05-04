;
;	elevator_talk.m
;
;	Action code for elevator 'talk' behavior.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	6-February-1987
;
	include	"action_head.i"

; This is the parameter returned by the ZAPTO request:
define ELEVATOR_SUCCESS = 0

define ELEVATOR_BROADCAST = 11

	actionStart

	jsr	v_adjacency_check
	if (!carry) {
		; The only parameter to the ZAPTO request is the string itself
		;  which is pointed to by 'source'
		lda	input_text_length	; Length from input
		ldy	#MSG_ZAPTO		; ZAPTO request
		ldx	pointed_noid		; Sent to the machine itself
		rjsr	v_send_string		; Send the request...
		complexSound	ELEVATOR_CONF_WAIT
		waitWhile reply_wait_bit	; Wait for response
		getResponse	ELEVATOR_SUCCESS
		if (!zero) {
			complexSound	ELEVATOR_DEPARTING
			moveb	#2, region_trans_type	; teleport sounds!
			chainto	v_wait_for_region
		}
		chainTo	v_clear_text_line
	}
	doMyAction ELEVATOR_BROADCAST
	rts

	actionEnd
