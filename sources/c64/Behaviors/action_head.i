;
;	action_head.i
;
;	General purpose header file for object behavior routines.
;
;	Originally coded by Randy Farmer
;	Prettified and enhanced by Chip Morningstar
;	Lucasfilm Ltd.
;	4-May-1986
;
	include "../Obj/macros.m"
	include	"../Obj/ronmacros2.m"
	include	"../Obj/datamacros.m"
	include "../Obj/equates.m"
	include "../Obj/dataequates.m"
	include "../Obj/farmers_equates.m"
	org	start_zpage
	include "../Obj/zpage.m"

	include	"../Obj/page4_space.m"
	include	"vectors.m"		; jump vectors into mainline
	include "messages.i"

; These are sounds:
define ERROR_BEEP = 0
define REGION_BOING = 1
define FOOTSTEPS = 2
define TELEPORT_PART_0 = 3
define TELEPORT_PART_0_PW = 4
define TELEPORT_PART_1 = 5
define TELEPORT_PART_1_PW = 6
define TELEPORT_PART_2 = 7
define REGION_TELEPORT_ARRIVAL = 8
define REGION_TELEPORT_ARRIVAL_PW = 9
define REGION_CHANGE_MUSIC_0 = 10
define REGION_CHANGE_MUSIC_1 = 11
define REGION_CHANGE_MUSIC_2 = 12

define AVATAR_INJURED = 0
define AVATAR_INJURED_PW = 1
define AVATAR_KILLED= 2
define AVATAR_KILLED_PW = 3
define AVATAR_INTO_STONE = 4
define AVATAR_OUT_OF_STONE = 5
define ESP_ACTIVATES = 6
define ESP_MESSAGE_SENT = 7
define ESP_MESSAGE_RECIEVED = 8
define ESP_DEACTIVATES = 9
define CLOTHES_DONNED = 10
define CLOTHES_DOFFED = 11


define DIGGING	= 0

define MONEY_INTO_ATM = 0
define MONEY_INTO_ATM_PW = 1
define MONEY_OUT_OF_ATM = 2
define MONEY_OUT_OF_ATM_PW = 3
define ATM_THINKING = 4

define	CONTAINER_OPENING	=	0	;true for ALL containers
define	CONTAINER_CLOSING	=	1	;ditto

define	CHANGOMATIC	=	0

define	STINGY_COKE_MACHINE	=	6	;A coinop
define	STINGY_COKE_MACHINE_PW	=	7

define	COIN_ACCEPTED		=	0
define	COIN_ACCEPTED_PW	=	1
define	COIN_DEPOSITED		=	2
define	COIN_DEPOSITED_PW	=	3
define	COIN_REJECTED		=	4
define	COIN_REJECTED_PW	=	5

define	CRYSTAL_BALL		=	0
define	CRYSTAL_BALL_PW		=	1

define	ELEVATOR_CONF_WAIT	=	0
define	ELEVATOR_CONF_WAIT_PW	=	1
define	ELEVATOR_DEPARTING	=	2
define	ELEVATOR_DEPARTING_PW	=	3
define	ELEVATOR_ARRIVAL	=	4
define	ELEVATOR_ARRIVAL_PW	=	5

define	EXIT_OPENING		=	0	;doors & gates
define	EXIT_CLOSING		=	1

define	ESCAPE_DEVICE_ACTIVATES	=	0
define	ESCAPE_DEVICE_USED_UP	=	1

define	FORTUNE_DISPENSED	=	6	;a coin op device
define	FORTUNE_DISPENSED_PW	=	7
define	PARKING_METER_CRANK	=	8
define	PARKING_METER_CRANK_PW	=	9

define	GARBAGE_FLUSH		=	0

define	PAWN_MUNCH		=	0
define	PAWN_MUNCH_PW		=	1

define	GENIE_APPEARS		=	0
define	GENIE_OUT		=	1

define	GUN_SAFETY_ON		=	0
define	GUN_SAFETY_OFF		=	1
define	GUNSHOT			=	2

define	JOKE_GUNSHOT		=	2
define	JOKE_GUNSHOT_PW		=	3

define	STUN_GUN_FIRE		=	2
define	STUN_GUN_FIRE_PW	=	3
define	STUN_GUN_HIT		=	4
define	STUN_GUN_HIT_PW		=	5
define	STUN_GUN_MISS		=	6

define	HAND_O_GOD_FLAME	=	0
define	HAND_O_GOD_LIGHTNING	=	1
define	HAND_O_GOD_LIGHTNING_PW	=	2

define	INSTANT_OBJECT_PILL	=	0

;define	KNIFE_HITS_AVATAR	=
;define	KNIFE_HITS_AVATAR_PW	=
;define	KNIFE_HITS_OBJECT	=

define	MAGIC			=	0
define	MAGIC_PW		=	1

define	MAIL_INTO_MAILBOX	=	0
define	MAIL_INTO_MAILBOX_PW	=	1
define	MAIL_OUT_OF_MAILBOX	=	2
define	MAIL_OUT_OF_MAILBOX_PW	=	3

define	SEX_CHANGER		=	0
define	SEX_CHANGER_PW		=	1

define	SWITCHED_ON		=	0	;for securDev, camera,stereo
define	SWITCHED_OFF		=	1

define	SENSOR_SCANNING		=	0
define	SENSOR_DIDNT_FIND_IT	=	1
define	SENSOR_FOUND_IT		=	2

define	SPRAY			=	0

define	SWITCH_CLICK		=	0	;generic for lamps

define	TELEPORT_ACTIVATES = 6			;coinop stuff first
define	TELEPORT_ACTIVATES_PW = 7
define	TELEPORT_CONF_WAIT = 8
define	TELEPORT_CONF_WAIT_PW = 9
define	TELEPORT_DEPARTING = 10
define	TELEPORT_DEPARTING_PW = 11
define	TELEPORT_ARRIVAL = 12
define	TELEPORT_ARRIVAL_PW = 13

define	VENDO_CHANGING		=	6	; anoth coinop
define	VENDO_DISPENSING	=	7
define	VENDO_DISPENSING_PW	=	8

define	WINDING_UP_TOY		=	0
define	WINDING_UP_TOY_PW	=	1

;define	WATER_POURING 		=
;define	SMALL_EXPLOSION		=
;define	MEDIUM_EXPLOSION	=
;define	BIG_EXPLOSION		=

; These are the image state definitions
define ANSWERING_MACHINE_OFF = 0
define ANSWERING_MACHINE_ON = 1
define ANSWERING_MACHINE_BLINK = 2

define PARKING_METER_grSTATE	=	2	;state of fortune machine

define ACTION_DO	= 0
define ACTION_RDO	= 1
define ACTION_GO	= 2
define ACTION_STOP	= 3
define ACTION_GET	= 4
define ACTION_PUT	= 5
define ACTION_TALK	= 6
define ACTION_DESTROY	= 7

define TRAP_INTERNALS_OFFSET =	8		;added to trap type
define HEAD_INTERNAL_PUT = 8
define TOKENS_INTERNAL_THROW = 8
define COKE_COINOP = 9
define FORTUNE_COINOP = 9
define VENDO_COINOP = 10
define TELEPORT_COINOP = 11
define JUKEBOX_COINOP = 10
define AVATAR_PATTERN_SWAP = 31
define TORSO_WEAR_ACTION = 8
define LEGS_WEAR_ACTION = 8

; These should come from someplace else:
define ACTIVITY_SITTING  = 1
define ACTIVITY_LAYING   = 2
define ACTIVITY_STANDING = 3

define FISH_GONE = 0
define FISH_SWIMMING = 1
define FISH_FEEDING = 2		/* Not defined yet */
define FISH_DEAD = 3		/* Not defined yet */

define FAKE_GUN_READY = 0
define FAKE_GUN_FIRED = 1

define GOD_DORMANT = 0
define GOD_FIRING = 1

define HEAD_OFF = 2

define MAGIC_LAMP_WAITING = 0
define MAGIC_LAMP_GENIE = 1

define PARKING_METER_EXPIRED = 0
define PARKING_METER_TICKING = 1

define PHONE_READY = 0
define PHONE_RINGING = 1
define PHONE_ACTIVE = 2
define PHONE_TALKING = 3
define PHONE_LINE_RING = 4
define PHONE_LINE_BUSY = 5
define PHONE_OFF_HOOK = 6

define TELEPORT_READY = 0
define TELEPORT_ACTIVE = 1

define WINDUP_WOUND = 1

define COKE_COST = 5
define FORTUNE_COST = 5
define BUS_FARE = 25
define JUKEBOX_COST = 10
define PARKING_COST = 5
define TELEPORT_COST = 50
define PHONE_CALL_COST = 10

; These control the text handler
define ENTER_TEXT_MODE_COMMAND	= 0x00
define EXIT_TEXT_MODE_COMMAND	= 0x01
define RECEIVE_PAGE_COMMAND	= 0x02
define TRANSMIT_PAGE_COMMAND	= 0x03
define TEXT_WRITEABLE_MODE	= 0x04
define TEXT_WRITTEN_BIT		= 0x04
define TEXT_MULTIPAGE_MODE	= 0x08
define TEXT_EXITABLE_MODE	= 0x10
define TEXT_EXITED_BIT		= 0x10

define BOOK_NEXT_PAGE		= 0x00
define BOOK_RANDOM_ACCESS_BIT	= 0x08
define TEXT_MAIL_BIT		= 0x20
define TEXT_ERASE_BIT		= 0x40
define TEXT_REPLY_BIT		= 0x80

define OPEN_BIT = 1
define UNLOCKED_BIT = 2

define ON = 1
define OFF = 0

define THE_REGION_NOID = 0


macro rjsr	subroutine {
	sta	save_accumulator
	php
	pla	
	sta	save_status
	movew	#subroutine, target_routine
	jsr	v_caller
}

macro txy {
	txa
	tay
}

macro tyx {
	tya
	tax
}

macro inca {
	clc
	adc #1
}

macro deca {
	sec
	sbc #1
}

macro chainTo	addr {
	jmp	addr			; Equivalent to jsr followed by rts
}

macro actionStart {
	org	0x1000			; Fake org for pic code
}

macro actionEnd {
}

macro doMyAction	act {
	lda	current_action_number
	pha
	lda	#act
	rjsr	v_issue_nested_command
	pla
	sta	current_action_number
mif (act==ACTION_GO) {
	lda	go_success		;check for failure 
	if (zero) {
		chainTo	v_beep
	}
}
}

macro waitWhile	bits {
	lda	#bits
	rjsr	v_wait_for_something
}

macro putArg	dataOffset {
	sta	arguments+dataOffset
}

macro cmpArg	dataOffset {
	cmp	arguments+dataOffset
}

macro subArg	dataOffset {
	sec
	sbc	arguments+dataOffset
}

macro addArg	dataOffset {
	clc
	adc	arguments+dataOffset
}

macro orArg	dataOffset {
	ora	arguments+dataOffset
}

macro andArg	dataOffset {
	and	arguments+dataOffset
}

macro getArg	dataOffset {
	lda	arguments+dataOffset
}
macro getArgY	dataOffset {
	ldy	arguments+dataOffset
}
macro getArgX	dataOffset {
	ldx	arguments+dataOffset
}

macro getResponse	dataOffset {
	mif (isDefined(dataOffset)) {
		ldy	#dataOffset
	}
	lda	y[@response_data]
}

macro putResponse	dataOffset {
	mif (isDefined(dataOffset)) {
		ldy	#dataOffset
	}
	sta	y[@response_data]
}

macro subResponse	dataOffset {
	mif (isDefined(dataOffset)) {
		ldy	#dataOffset
	}
	sec
	sbc	y[@response_data]
}

macro addResponse	dataOffset {
	mif (isDefined(dataOffset)) {
		ldy	#dataOffset
	}
	clc
	adc	y[@response_data]
}

macro getProp	obj, propOffset {
	mif (isDefined(propOffset)) {
		ldy	#propOffset
	}
	lda	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro putProp	obj, propOffset {
	mif (isDefined(propOffset)) {
		ldy	#propOffset
	}
	sta	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro cmpProp	obj, propOffset {
	mif (isDefined(propOffset)) {
		ldy	#propOffset
	}
	cmp	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro incProp	obj, propOffset {
	mif (isDefined(propOffset)) {
		ldy	#propOffset
	}
	inc	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro getPropC	obj, propOffset {
	mif (isDefined(propOffset)) {
		pha
		lda #propOffset
		clc
		adc symbolLookup(strcat(symbolName(obj), "_variables_offset"))
		tay
		pla
	}
	lda	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro putPropC	obj, propOffset {
	mif (isDefined(propOffset)) {
		pha
		lda	#propOffset
		clc
		adc	symbolLookup(strcat(symbolName(obj), "_variables_offset"))
		tay
		pla
	}
	sta	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro cmpPropC	obj, propOffset {
	mif (isDefined(propOffset)) {
		pha
		lda	#propOffset
		clc
		adc	symbolLookup(strcat(symbolName(obj), "_variables_offset"))
		tay
		pla
	}
	cmp	y[@symbolLookup(strcat(symbolName(obj), "_object"))]
}

macro sendMsg	toObjNoid, msgNumber, argCount {
	lda	#argCount
	ldy	#msgNumber
	ldx	toObjNoid
	rjsr	v_send_arguments
	waitWhile reply_wait_bit
}

macro sendMsgN	toObjNoid, msgNumber, argCount {
	lda	#argCount
	ldy	#msgNumber
	ldx	toObjNoid
	clc
	rjsr	v_send_arguments
}

macro changeContainers	xPos, yPos, newObjNoid {
	ldx	#xPos
	ldy	#yPos
	lda	newObjNoid
	rjsr	v_change_containers
}

macro newImage obj, newState {
	ldx	obj
	mif (isDefined(newState)) {
		lda	#newState
	}
	jsr	v_init_state_animation
}

macro chore act {
	lda	#act
	jsr	v_set_actor_chore
}

macro moveOb	from, to {
	moveb	symbolLookup(strcat(symbolName(from), "_noid")),
		symbolLookup(strcat(symbolName(to), "_noid"))
	movew	symbolLookup(strcat(symbolName(from), "_object")),
		symbolLookup(strcat(symbolName(to), "_object"))
	movew	symbolLookup(strcat(symbolName(from), "_class")),
		symbolLookup(strcat(symbolName(to), "_class"))
	moveb	symbolLookup(strcat(symbolName(from), "_variables_offset")),
		symbolLookup(strcat(symbolName(to), "_variables_offset"))
}

macro containerAbort {
;	getProp pointed, OBJECT_contained_by		; commented out FRF
;	if (!zero) {					; aug 20 1986
;		chainTo v_beep
;	}
}

macro swapPatterns objectOffset, avatarOffset, mask, swapAction {
	lda #objectOffset
	putArg SWAP_OBJECT_OFFSET
	lda #AVATAR_customize + avatarOffset
	putArg SWAP_AVATAR_OFFSET
	lda #mask
	putArg SWAP_MASK
	doMyAction swapAction
}

macro incLight {
	lda	#1
	jsr	v_change_light_level
}
macro decLight {
	lda	#-1
	jsr	v_change_light_level
}

macro sound	soundNumber,objNoid {
mif (isdefined(objNoid)) {
	ldy objNoid
} melse {
	ldy pointed_noid
}
	lda #soundNumber
	jsr v_do_a_sound
}
macro complexSound	soundNumber, objNoid {
mif (isdefined(objNoid)) {
	ldy objNoid
} melse {
	ldy pointed_noid
}
	lda #soundNumber
	jsr v_do_a_complex_sound
}


; SUBLLB - long dst = long src0 - byte src1
;	works for all addressing modes EXCEPT (post y zzz)
macro	subllb	dst, src0, src1 {
	sec
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	sbc	src1
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	sbc	#0
	sta	makeSecondByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeNthByteImmediate(src0, 3)
	} melse {
		lda	makeNthByte(src0, 3)
	}
	sbc	#0
	sta	makeNthByte(dst, 3)
	mif (isImmediateMode(src0)) {
		lda	makeNthByteImmediate(src0, 4)
	} melse {
		lda	makeNthByte(src0, 4)
	}
	sbc	#0
	sta	makeNthByte(dst, 4)
}

; ADDLLB - long dst = long src0 + byte src1
;	works for all addressing modes EXCEPT (post y zzz)
macro	addllb	dst, src0, src1 {
	clc
	mif (isImmediateMode(src0)) {
		lda	makeFirstByteImmediate(src0)
	} melse {
		lda	makeFirstByte(src0)
	}
	adc	src1
	sta	makeFirstByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeSecondByteImmediate(src0)
	} melse {
		lda	makeSecondByte(src0)
	}
	adc	#0
	sta	makeSecondByte(dst)
	mif (isImmediateMode(src0)) {
		lda	makeNthByteImmediate(src0, 3)
	} melse {
		lda	makeNthByte(src0, 3)
	}
	adc	#0
	sta	makeNthByte(dst, 3)
	mif (isImmediateMode(src0)) {
		lda	makeNthByteImmediate(src0, 4)
	} melse {
		lda	makeNthByte(src0, 4)
	}
	adc	#0
	sta	makeNthByte(dst, 4)
}

macro asyncAnimationWait {
	jsr	v_ASYNC_animation_wait
}

macro ifNotAdjacentFail {
	jsr	v_adjacency_check
	if (carry) {
		jmp	v_beep
	}
}
