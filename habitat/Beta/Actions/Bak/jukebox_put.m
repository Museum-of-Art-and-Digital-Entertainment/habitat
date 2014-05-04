;
;	jukebox_put.m
;
;	Action code for the pay-for-a-song operation.
;	This is the 'put' behavior for the jukebox.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
; This is the value returned by the coinop function
define COINOP_SUCCESS	=	0

	include	"action_head.i"

	actionStart

	doMyAction	JUKEBOX_COINOP
	getArg COINOP_SUCCESS
	if (!zero) {
		lda	#1
		putProp	pointed, JUKEBOX_playsToGo	; active
	}
	rts

	actionEnd
