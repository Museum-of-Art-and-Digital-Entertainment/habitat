;
;	escape_device_do.m
;
;	Action code for the escape device activation operation.
;	This is the 'do' behavior for the escape device.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	2-May-1986
;
;	To use the escape device you must be holding it.  It has a finite
;	 charge and once this charge is used up it disappears.  As usual, if
;	 you are not holding it, the 'do' operation punts to 'depends'.
;	 Actual teleport out of the region will occur asynchronously.
;
	include	"action_head.i"

;This is the parameter returned by the BUGOUT request
define BUGOUT_SUCCESS = 0

	actionStart

	lda	in_hand_noid
	cmp	pointed_noid
	if (equal) {		; Have to be holding device to use it
		sound	ESCAPE_DEVICE_ACTIVATES
	    	sendMsg pointed_noid, MSG_BUGOUT, 0
		getResponse BUGOUT_SUCCESS
		if (!zero) {				; Non-zero is success
			moveb	#2, region_trans_type	; teleport sounds!
			chainTo v_wait_for_region
		}
		chainTo v_boing	; Complain if we failed
	}
	chainTo v_depends	; If not holding

	actionEnd

