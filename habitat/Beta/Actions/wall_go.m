;
;	wall_go.m
;
;	Action code for go to wall operation.
;	This is the 'go' behavior for back wall objects.
;
;	This file should be assembled as position independent code.
;
;	The idea is we want to walk to the base of the wall at the indicated
;	 spot.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	18-May-1986
;
	include	"action_head.i"

	actionStart
	getProp pointed, OBJECT_y_position
					; Clamp walk y-coord at wall base
	sta desired_y
	chainTo	v_goXY			; Cursor is default motion target!
	actionEnd

