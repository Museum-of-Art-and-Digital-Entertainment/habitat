;
;	generic_patternSwap.m
;
;	Action routine to swap a customization pattern between an avatar and
;		an object.
;
;	This file should be assembled as position independent code.
;
;	Chip Morningstar
;	Lucasfilm Ltd.
;	24-May-1986
;
; Swap pattern between avatar customization and pointed object
;	SWAP_OBJECT_OFFSET = offset into clothing object to find pattern
;	SWAP_AVATAR_OFFSET = offset into avatar to set pattern
;	SWAP_MASK = mask to screen pattern for extraneous bits
;
	include	"action_head.i"

; These are temp variables
define SWAP_OBJECT_OFFSET = 0x10
define SWAP_AVATAR_OFFSET = 0x11
define SWAP_MASK = 0x12
define SWAP_MASK_COMP = 0x13
define SWAP_TEMP = 0x14

	actionStart

	getArg SWAP_MASK		; First, make a complementary mask
	eor #0xFF
	putArg SWAP_MASK_COMP

	getArgY SWAP_OBJECT_OFFSET	; Get the pattern from the object
	getProp pointed	
	andArg SWAP_MASK		; Mask off the extra bits
	putArg SWAP_TEMP		; Save the masked pattern

	getArgY SWAP_AVATAR_OFFSET	; Get the current customization value
	getProp actor

	getArgY SWAP_OBJECT_OFFSET	; Save the avatar's old pattern in obj
	putProp pointed	

	andArg SWAP_MASK_COMP		; Mask junk out of present value
	orArg SWAP_TEMP			; OR in new value

	getArgY SWAP_AVATAR_OFFSET	; Set avatar pattern
	putProp actor

	rts
