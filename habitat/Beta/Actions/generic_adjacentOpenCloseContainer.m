;
;	generic_adjacentOpenCloseContainer.m
;
;	Action code for generic open/close container operation.
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

; This is the parameter returned by the OPENCONTAINER request to the host
define OPEN_SUCCESS = 0
define OPEN_CONTENTS = 1
; This is the parameter returned by the CLOSECONTAINER request to the host
define CLOSE_SUCCESS = 0
; This is a scratch variable
define have_key = 0x10

	actionStart


	getProp	pointed, OBJECT_contained_by
	if (!zero) {
	    chainTo	v_beep
	}

	jsr	v_punt_if_not_adjacent

	lda #FALSE
	putArg have_key
	lda in_hand_noid
	if (!zero) {
	    getProp in_hand, OBJECT_class_pointer
	    cmp	#CLASS_KEY
	    if (equal) {
		getProp	in_hand, KEY_key_number_hi
		cmpPropC pointed, CONTAINER_key_hi
		if (equal) {
		    getProp in_hand, KEY_key_number_lo
		    cmpPropC pointed, CONTAINER_key_lo
		    if (equal) {
			lda #TRUE
			putArg have_key
		    }
		}
	    }
	}
	getPropC pointed, CONTAINER_flags
	and #OPEN_BIT
	if (!zero) {					; If door is open...
	    chore AV_ACT_bend_over
	    sendMsg pointed_noid, MSG_CLOSECONTAINER, 0	; Close it
	    chore AV_ACT_bend_back

	    getResponse CLOSE_SUCCESS
	    if (!zero) {				; Non-zero is success
		sound	CONTAINER_CLOSING
		getArg have_key
		if (zero) {				; Don't have key
		    getPropC pointed, CONTAINER_flags
		    and	#~OPEN_BIT			; Close it
		    ora	#UNLOCKED_BIT			; But don't lock it
		} else {				; Have key
		    getPropC pointed, CONTAINER_flags
		    and	#~(OPEN_BIT | UNLOCKED_BIT)	; Close AND lock it
		}
		putProp pointed
		and #OPEN_BIT		; Only want open/close for imagery
		newImage pointed_noid
		lda pointed_noid
		chainTo v_purge_contents		; Flush its contents
	    } else {
		chainTo v_boing				; Complain on failure
	    }
	    rts
	}				; else container is closed
	    getPropC pointed, CONTAINER_flags
	    and #UNLOCKED_BIT
	    if (zero) {					; If it's locked...
		getArg have_key
		beq	its_locked
;		if (zero) {				; And we're keyless
;		    chainTo v_beep			; Bag it.
;		}
	    }
	    chore AV_ACT_bend_over
	    sendMsg pointed_noid, MSG_OPENCONTAINER, 0	; Open it
	    chore AV_ACT_bend_back

	    getResponse OPEN_SUCCESS
	    cmp	#SUCCESS_VALUE
	    if (equal) {				; If it opened
		sound	CONTAINER_OPENING
		lda #(OPEN_BIT | UNLOCKED_BIT)		; Open it here too
		putPropC pointed, CONTAINER_flags
		and #OPEN_BIT	; Only want open/close for imagery
		newImage pointed_noid
		addwwb response_data, response_data, #OPEN_CONTENTS
		lda	pointed_noid
		chainTo v_unpack_contents_vector
	    } else {
		chainTo v_beep_or_boing			; Else complain
	    }
	rts

its_locked:
	jsr	v_balloon_printf
	string	"It's locked."
	rts

	actionEnd
