;
;	transit_region.m
;
;	Action code to que region transit sounds effects.
;
;	This file should be assembled as position independent code.
;
; NOTE : Transition sounds come in pairs: 0&1 2&3 etc.
; 	where the lower number is the 'in-flight' sound
; 	and the other is the arrival sound.
; 
;	Originally coded by Randy Farmer
;	Lucasfilm Ltd.
;	6-August-86
;
	include	"action_head.i"

	actionStart

	jsr	v_all_sfx_off
	ldx	region_trans_type
	if (zero) {			; 0 = walking (default)
		sound	REGION_CHANGE_MUSIC_0,#THE_REGION_NOID
		sound	REGION_CHANGE_MUSIC_1,#THE_REGION_NOID
		sound	REGION_CHANGE_MUSIC_2,#THE_REGION_NOID
		rts
	}
	dex				; 1 = walking arrival (none)

	dex				; 2 = teleport transit 
	if (zero) {
		complexSound	TELEPORT_PART_0,#THE_REGION_NOID
		complexSound	TELEPORT_PART_1,#THE_REGION_NOID
		sound		TELEPORT_PART_2,#THE_REGION_NOID
		rts	
	}
	dex				; 3 = teleport arrival
	if (zero) {
		complexSound	REGION_TELEPORT_ARRIVAL,#THE_REGION_NOID
		rts	
	}

	rts

	actionEnd
