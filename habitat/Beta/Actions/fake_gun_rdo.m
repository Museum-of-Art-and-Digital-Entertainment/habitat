;
;	fake_gun_rdo.m
;
;	Action code for the fake gun "shoot" operation.
;	This is the 'rdo' behavior for fake guns.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	3-May-1986
;
;	You shoot the fake gun just like a regular gun, but instead of
;	 attacking the target we pop out the "BANG!" flag.
;

; This is the parameter returned by the FAKESHOOT request
define FAKESHOOT_SUCCESS = 0

	include	"action_head.i"

	actionStart

	getProp pointed, FAKE_GUN_state
	if (zero) {			; Can only fire if not fired already.
		chore AV_ACT_shoot1
	    	sendMsg pointed_noid, MSG_FAKESHOOT, 0
		chore AV_ACT_shoot2
		getResponse FAKESHOOT_SUCCESS
		if (!zero) {
			lda #FAKE_GUN_FIRED
			putProp pointed, FAKE_GUN_state
			newImage pointed_noid
			complexSound JOKE_GUNSHOT
			rts
		}
	}
	chainTo v_beep

	actionEnd

