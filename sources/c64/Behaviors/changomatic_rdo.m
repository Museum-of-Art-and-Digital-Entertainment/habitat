;
;	changomatic_rdo.m
;
;	Action code for changomatic operation
;	This is the 'rdo' behavior for changomatic.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	20-June-1986
;
	include	"action_head.i"
	include "class_equates.m"

; This is the parameter to the CHANGE request
define CHANGE_TARGET = 0
; This is the parameter returned by the CHANGE request
define CHANGE_SUCCESS = 0
define CHANGE_NEW_ORIENTATION = 1

	actionStart

	lda subject_noid			; Get the target
	putArg CHANGE_TARGET			; Set it
	chore AV_ACT_shoot1
	sound CHANGOMATIC
	sendMsg pointed_noid, MSG_CHANGE, 1	; Tell host to change it
	chore AV_ACT_shoot2
	getResponse CHANGE_SUCCESS
	if (zero) {				; Did it work?
		chainTo v_beep			; Nope!
	}
	getResponse CHANGE_NEW_ORIENTATION	; Set new orientation
	putProp subject, OBJECT_orientation
	moveb #1, background_render	; If so, tell renderer to redo
	rts

	actionEnd

