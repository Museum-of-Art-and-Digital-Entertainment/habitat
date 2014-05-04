;
;	generic_adjacentOpenClose.m
;
;	Action code for generic open/close door or gate operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	30-April-1986
;
;	If we are standing next to the door or gate in question, then we wish
;	 to open or close it.  Otherwise, it's just a 'depends' (i.e., punt
;	 to reverse-do) operation.
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter returned by the OPEN request to the host
define OPEN_SUCCESS = 0
; This is the parameter returned by the CLOSE request to the host
define CLOSE_SUCCESS = 0
; This is a scratch variable
define have_key = 0x10

	actionStart

	moveb	#6, pointed_at_cel_number	; prevent walking thru

	getProp in_hand, OBJECT_class_pointer
	cmp	#CLASS_CHANGOMATIC
	if (equal) {chainTo	v_depends}

	doMyAction	ACTION_GO		; walk to it.
	waitWhile	animation_wait_bit

	jsr	v_punt_if_not_adjacent
	jsr	v_face_cursor

	lda #FALSE
	putArg have_key
	lda in_hand_noid
	if (!zero) {
	    getProp in_hand, OBJECT_class_pointer
	    cmp	#CLASS_KEY
	    if (equal) {
		getProp	in_hand, KEY_key_number_hi
		cmpProp pointed, DOOR_key_hi
		if (equal) {
		    getProp in_hand, KEY_key_number_lo
		    cmpProp pointed, DOOR_key_lo
		    if (equal) {
			lda #TRUE
			putArg have_key
		    }
		}
	    }
	}
	getProp	pointed, DOOR_flags
	and #OPEN_BIT
	if (!zero) {					; If door is open...
	    chore AV_ACT_hand_out
	    sendMsg pointed_noid, MSG_CLOSE, 0		; Close it
	    chore AV_ACT_hand_back

	    getResponse CLOSE_SUCCESS
	    if (!zero) {				; Non-zero is success
		sound	EXIT_CLOSING
		getArg have_key
		if (zero) {				; Don't have key
		    getProp pointed, DOOR_flags
		    and	#~OPEN_BIT			; Close it
		    ora	#UNLOCKED_BIT			; But don't lock it
		} else {				; Have key
		    getProp pointed, DOOR_flags
		    and	#~(OPEN_BIT | UNLOCKED_BIT)	; Close AND lock it
		}
		putProp pointed
		and #OPEN_BIT
		newImage pointed_noid
	    } else {
		chainTo v_boing				; Complain on failure
	    }
	} else {					; If door is closed...
	    getProp pointed, DOOR_flags
	    and #UNLOCKED_BIT
	    if (zero) {					; If it's locked...
		getArg have_key
		beq	its_locked
;		if (zero) {				; And we're keyless
;		    chainTo v_beep			; Bag it.
;		}
	    }
	    chore AV_ACT_hand_out
	    sendMsg pointed_noid, MSG_OPEN, 0		; Open it
	    chore AV_ACT_hand_back

	    getResponse OPEN_SUCCESS
	    if (!zero) {				; If it opened
		sound	EXIT_OPENING
		lda #(OPEN_BIT | UNLOCKED_BIT)		; Open it here too
		putProp pointed, DOOR_flags
		and #OPEN_BIT
		newImage pointed_noid
	    } else {
		chainTo v_beep				; Else complain
	    }
	}
	rts

its_locked:
	jsr	v_balloon_printf
	string	"It's locked."
	rts

	actionEnd
