;
;	changomatic_CHANGE.m
;
;	Action code for asynchronous changomatic operation
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	20-June-1986
;
	include	"action_head.i"
	include "class_equates.m"

; These are the parameters of the CHANGE* request
define CHANGE_TARGET = 0
define CHANGE_NEW_ORIENTATION = 1

	actionStart

	sound	CHANGOMATIC, actor_noid
	getResponse CHANGE_TARGET		; What are we changing?
	jsr v_get_subject_object		; Make it accessable
	getResponse CHANGE_NEW_ORIENTATION	; Get new orientation...
	putProp subject, OBJECT_orientation	; ...and set it
	getProp subject, OBJECT_y_position	; Is object in the background?
	and #0x80				; It is if high bit is clear
	if (zero) {
		moveb #1, background_render	; If so, tell renderer to redo
	}
	rts

	actionEnd

