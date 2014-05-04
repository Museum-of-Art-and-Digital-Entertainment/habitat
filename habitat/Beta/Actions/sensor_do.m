;
;	sensor_do.m
;
;	Action code for the sensor scan operation.
;	This is the 'do' behavior for the sensor.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
;	To  operate the sensor you have to be holding it, otherwise we punt
;	 to 'depends' as usual.
;
	include	"action_head.i"

define SENSOR_ON = 1
define SENSOR_BLINKING = 2

; This is the parameter returned by the SCAN request
define SCAN_DETECTION = 0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding object to do this
		sound	SENSOR_SCANNING
		newImage pointed_noid, SENSOR_ON
		sendMsg pointed_noid, MSG_SCAN, 0
		getResponse SCAN_DETECTION
		if (!zero) {
			sound	SENSOR_FOUND_IT
			lda #SENSOR_BLINKING
		} else {
			sound	SENSOR_DIDNT_FIND_IT
			lda	#0
		}
		newImage pointed_noid
		rts
	}
	chainTo v_depends			; If not holding

	actionEnd

