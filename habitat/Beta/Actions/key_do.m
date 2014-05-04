;
;	Key_do.m
;
;	Action code for Key identifier query operation.
;	This is the behavior for keys.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"
	include "class_equates.m"

	actionStart

	lda in_hand_noid
	cmp pointed_noid
	if (equal) {
		getProp pointed, KEY_key_number_hi ; Create a fake longword
		putArg 0			; ...using the number...
		getProp pointed, KEY_key_number_lo ; Create a fake longword
		putArg 1			; ...bytes for padding
		lda #0				; ...byte plus 3 more zero...
		putArg 2
		putArg 3
		movew #arguments, printf_parameters
		jsr v_balloon_printf
		string "Key number: #"
		rts
	}
	chainTo v_beep			; ...bag it if not holding

	actionEnd

