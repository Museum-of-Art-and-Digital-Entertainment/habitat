;
;	sensor_SCAN.m
;
;	Action code for the asynchronous sensor scan operation.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include	"action_head.i"

; This is the parameter of the SCAN message
define SCAN_DETECTION = 0

	actionStart

	getResponse SCAN_DETECTION
	newImage actor_noid
	getResponse SCAN_DETECTION
	if (zero) {
	    sound	SENSOR_DIDNT_FIND_IT, actor_noid
	    rts
	}
	sound	SENSOR_FOUND_IT, actor_noid
	rts

	actionEnd

