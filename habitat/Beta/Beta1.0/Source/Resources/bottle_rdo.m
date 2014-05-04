;
;	bottle_rdo.m
;
;	Action code for the bottle 'rdo' behavior.
;
;	This file should be assembled as position independent code.
;
;	A bottle 'rdo' is a command to pour the bottle on the indicated
;	 object/location.  Of course, this only works if the bottle is filled.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	1-May-1986
;

; This is the parameter returned by the POUR request
define POUR_SUCCESS = 0

	include	"action_head.i"
	include "class_equates.m"

	actionStart
	moveb	#-1, prevent_region_trans	; no changing regions ya know!
	moveOb subject, pointed		; For goto
	doMyAction ACTION_GO		; Walk to object
	waitWhile animation_wait_bit	; Wait till we get there
	lda in_hand_noid		; Restore pointed from hand...
	jsr v_get_subject_object	; ...but restore into subject
	getProp	subject, BOTTLE_filled		; Is the bottle filled?
	if (!zero) {
		chore AV_ACT_hand_out
		sendMsg subject_noid, MSG_POUR, 0
		chore AV_ACT_hand_back
		getResponse POUR_SUCCESS
		if (!zero) {
			lda #FALSE			; Yes, empty it
			putProp	subject, BOTTLE_filled
			newImage subject_noid
			rts
		}
	}
	chainTo	v_beep			; No, bitch at player

	actionEnd
