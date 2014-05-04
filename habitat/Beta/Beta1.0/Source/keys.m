fastlink_on::			byte	0

;-------------------------------------------------------------------
;
; 	KEYS:	Interruptable Joystick / Keyboard Input System
;		custom version for Habitat  FRF/CRK  4/22/87
;
;	read_joystick:	updates joystick dependent variables.
;			called from mainline program.
;
;	read_keyboard:	returns buffered key in A register.
;			returns zero if buffer is empty.
;			called from mainline program.
;
;	vblank_keys:	reads hardware and buffers keyboard,
;			also reads and latches both joysticks.
;			called from vblank, once per jiffy.
;
;	2-key rollover version:  4/20/87 by Charlie Kellner
;	    Copyright (C) 1987 Lucasfilm Games Division
;		   CONFIDENTIAL AND PROPRIETARY
;

define	key_buffer_pointer	=	kb_buffer_pointer
define	key_buffer_end		=	kb_buffer_end
define	key_buffer		=	kb_buffer
define	key_buffer_length	=	kb_buffer_length

macro	check_for_repeat_keys {		; check for specific repeat keys
	cmp	#delete_key
	beq	vblank_keys_repeat
	cmp	#space_key
	beq	vblank_keys_repeat
}

define	keys_Data_Port_A	= 0xDC00	; joystick/keyboard port A
define	keys_Data_Port_B	= 0xDC01	; joystick/keyboard port B
define	keys_Data_Direction_A	= 0xDC02	; data direction register A
define	keys_Data_Direction_B	= 0xDC03	; data direction register B

define	start_repeat_value	= 60/1		; initial repeat delay time
define	cont_repeat_value	= 60/20		; continuous repeat interval
define	key_left_shift		= 0b00111001	; key matrix bits: left shift
define	key_right_shift		= 0b00100110	; key matrix bits: right shift
define	key_ctrl		= 0b00010111	; key matrix bits: ctrl
;define	delete_key		= 0xFE		; ascii value for delete
define	space_key		= 0x20		; ascii value for space

;
;	mainline subroutine to read joystick
;
read_joystick::
	ldx	#0xff
	stx	stick_is_up			; reset direction flags
	stx	stick_is_down
	stx	stick_is_left
	stx	stick_is_right
	stx	trigger_is_pressed
	lda	joystick_1_latch		; read joystick latch
	stx	joystick_1_latch		; and reset it for next time
	sta	joystick_state			; update the current state
	inx					; clear X register to zero
	lsr	a
	if (not_carry) {
		stx	stick_is_up		; up
	}
	lsr	a
	if (not_carry) {
		stx	stick_is_down		; down
	}
	lsr	a
	if (not_carry) {
		stx	stick_is_left		; left
	}
	lsr	a
	if (not_carry) {
		stx	stick_is_right		; right
	}
	lsr	a
	if (not_carry) {
		stx	trigger_is_pressed	; trigger
	}
	rts


;
;	mainline subroutine to get keys from buffer
;
;	returns result in A register
;	preserves X and Y registers
;
read_keyboard::
	sty	read_keyboard_y_save		; save Y register
	lda	#0				; set A register to zero
	ldy	key_buffer_end			; get end of buffer pointer
	cpy	key_buffer_pointer		; compare to insert pointer
	if (not_equal) {
		iny				; if they're different,
		cpy	#key_buffer_length	; increment the end pointer
		if (carry) {
			ldy	#0		; wrap pointer if necessary
		}
		lda	y[key_buffer]		; get the next buffer entry
		sty	key_buffer_end		; update end of buffer
	}
	ldy	read_keyboard_y_save		; restore Y register
	cmp	#0				; set condition flags
	rts


;
;	vblank subroutine to read hardware and put keys in buffer
;
;	mungs A, X and Y registers
;
vblank_keys::
	lda	#0				; first check the joystick:
	sta	keys_Data_Direction_A		; turn off all data strobes
	sta	keys_Data_Direction_B		; (both row and column)
	sta	keys_Data_Port_A
	sta	keys_Data_Port_B
	lda	keys_Data_Port_B		; now read port B
	sta	joystick_1_active		; if any bits are zero,
	and	joystick_1_latch		; it must be the joystick
	sta	joystick_1_latch
	lda	keys_Data_Port_A		; check port A for activity
	and	joystick_1_active		; if either stick is active,
	cmp	#0xFF				; better ignore the keyboard
	bne	vblank_keys_exit_jmp		; because it messes it up

	lda	#0x80				; ok, check the keyboard:
	sta	keys_Data_Direction_B		; set port B for single column
	ldx	#7
	do {
		lda	keys_Data_Port_A	; get one column of key data
		beq	vblank_keys_exit_jmp	; check for joystick hit
		sta	x[key_input_data]	; store it in the input array
		lsr	keys_Data_Direction_B	; scan next column of keyboard
		dex
	} while (positive)
	ldy	#3				; try debounce 3 times
vblank_keys_debounce:
	dey					; decrement debounce counter
	bmi	vblank_keys_exit_jmp		; if too many times, give up
	lda	#0x80
	sta	keys_Data_Direction_B		; set up single column
	ldx	#7
	do {
		lda	keys_Data_Port_A	; re-check keyboard column
		beq	vblank_keys_exit	; watch for joystick hit
		cmp	x[key_input_data]	; compare to original data
		sta	x[key_input_data]	; update input image
		bne	vblank_keys_debounce	; if it's different, reject
		lsr	keys_Data_Direction_B
		dex
	} while (positive)
	lda	keys_Data_Port_A		; check one more time for
	and	keys_Data_Port_B		; interference from joysticks
	cmp	#0xFF				; (particularly from port B)
	if (not_equal) {
vblank_keys_exit_jmp:
		jmp	vblank_keys_exit
	}

	lda	#0				; interpret keyboard data:
	sta	key_count			; clear keystroke counter
	ldx	#7				; scan from column 7 to col 0
	do {
		lda	x[key_input_data]	; compare against memory image
		cmp	x[keyboard_image]
		if (not_equal) {			; if they don't match,
			sta	key_data_bits		; examine it bit by bit
			ldy	#7			; starting with bit 7
			eor	x[keyboard_image]
			sta	key_difference_bits	; 1=different, 0=same
			do {
				if (negative) {		; interpret new bits
					jsr	vblank_keys_changed
				}
				dey			; advance to next row
				asl	key_data_bits	; until no more 1 bits
				asl	key_difference_bits
			} while (not_zero)
			lda	x[key_input_data]	; update memory image
			sta	x[keyboard_image]	; to match input data
		}
		dex				; until all rows are scanned
	} while (positive)
	lda	key_count			; if we detected one key,
	cmp	#1				; and exactly one key,
	if (equal) {
		lda	key_detected		; then if it's not zero,
		bne	vblank_keys_insert	; stuff it in the buffer
	} else {
		lda	key_repeat_char
		check_for_repeat_keys		; (macro defined above)
	}

vblank_keys_exit:
	ldy	#0xFF				; reset data direction regs
	sty	keys_Data_Direction_A		; for C64 ROM keyboard routine
	iny
	sty	keys_Data_Direction_B
	rts					; end of vblank_keys

vblank_keys_repeat:
	dec	key_repeat_timer		; custom key repeat routine:
	bne	vblank_keys_exit		; count down the repeat timer
	ldy	#cont_repeat_value		; when it goes to zero,
	sty	key_repeat_timer		; reset timer and stuff key

vblank_keys_insert:
	ldy	key_buffer_pointer		; insert A reg into buffer:
	iny
	cpy	#key_buffer_length		; increment and wrap pointer
	if (carry) {
		ldy	#0
	}
	cpy	key_buffer_end			; check for end of buffer
	if (not_equal) {
		sta	y[key_buffer]		; if not, stuff the key and
		sty	key_buffer_pointer	; update the buffer pointer
	}
	jmp	vblank_keys_exit

vblank_keys_changed:
	sty	key_y_index			; a keyboard bit has changed:
	txa
	asl	a				; X reg contains column number
	asl	a				; Y reg contains row number
	asl	a
	ora	key_y_index			; key = (X * 8) + Y
	cmp	#key_left_shift
	if (not_equal) {			; check for left or right shift
		cmp	#key_right_shift
	}
	if (equal) {
		lda	key_shift_flag			; shift key:
		bit	key_data_bits
		if (positive) {
			inc	key_shift_count		; down:  count += 1
			ora	#0b01000000		; set shift flag bit
		} else {
			dec	key_shift_count		; up:  count -= 1
			if (zero) {			; if it goes to zero,
				and	#0b10111111	; clear shift flag bit
			}
		}
		sta	key_shift_flag
		jmp	vblank_keys_changed_nr
	}
	cmp	#key_ctrl			; check for ctrl key
	if (equal) {
		lda	key_shift_flag			; ctrl key:
		bit	key_data_bits
		if (positive) {
			ora	#0b10000000		; down:  set ctrl bit
		} else {
			and	#0b01111111		; up:  clear ctrl bit
		}
		sta	key_shift_flag
		jmp	vblank_keys_changed_nr
	}
	bit	key_data_bits			; any regular key going down:
	if (positive) {
		ora	key_shift_flag		; add in shift & ctrl bits
		cmp	#0xC0			; but lock out shift+ctrl
		if (not_carry) {
			inc	key_count		; we got another one
			tay
			lda	y[ascii_table]		; translate to ascii
			sta	key_detected		; save new key value
			sta	key_repeat_char		; save repeat key
			ldy	#start_repeat_value	; and start timer
			sty	key_repeat_timer
mif (debug_mode) {
			cmp	#'/'
			if (equal) {
				lda	#0xff
				sta	fastlink_on
				sta	border_color
				jsr	com_init
			}
			cmp	#'+'
			if (equal) {
				lda	#0
				sta	fastlink_on
				sta	border_color
			}
}
			ldy	key_y_index		; restore Y register
		}
		rts					; end of changes
	}

vblank_keys_changed_nr:
	lda	#0				; clear repeat character
	sta	key_repeat_char
	rts					; end of changes


;
;	C64 to ascii translation table
;
;	special characters in the character set:
;	D = Down U = Up L = Left R = Right C = Center
;
;define	return_key		= 0x81
;define	control_key		= 0x82
;define	shift_right		= 0x83
;define	shift_left		= 0x84
;define	quit_key		= 0x91		; ctrl Q
;define	function_key_1		= 0x92
;define	function_key_2		= 0x93
;define	function_key_3		= 0x94
;define	function_key_4		= 0x95
;define	function_key_5		= 0x96
;define	function_key_6		= 0x97
;define	function_key_7		= 0x98
;define	function_key_8		= 0x99
;define	gesture_key_1		= 0x9a
;define	gesture_key_2		= 0x9b
;define	gesture_key_3		= 0x9c
;define	gesture_key_4		= 0x9d
;define	gesture_key_5		= 0x9e
;define	gesture_key_6		= 0x9f
;define	gesture_key_7		= 0xa1
;define	gesture_key_8		= 0xa2
;define	gesture_key_9		= 0xa3
;define	gesture_key_0		= 0xa4
;define	gesture_max		= gesture_key_0
;define	Diag_DR		=	9
;define	Diag_DL		=	31		;10 is linefeed!
;define	Diag_UL		=	11
;define	Diag_UR		=	12
;define	Box_DR		=	13
;define	Box_DL		=	14
;define	Box_UL		=	15
;define	Box_UR		=	16
;define	Circ_DR		=	17
;define	Circ_DL		=	18
;define	Circ_UL		=	19
;define	Circ_UR		=	20
;define	Box_CR		=	21
;define	Box_CL		=	22
;define	Box_CU		=	23
;define	Box_CD		=	24
;define	Box_C		=	25
;define	Line_UD		=	26
;define	Line_LR		=	27
;define	Ball		=	28
;define	Ball_filled	=	29
;define	Ball_alternate	=	30
;define	Arrow_U		=	124
;define	Arrow_D		=	125
;define	Arrow_L		=	126
;define	Arrow_R		=	127
;define	Black_char	=	96

ascii_table:
	byte	delete_key,"3579+",Ball,"1"			; no_shift
	byte	return_key,"wryip*",Arrow_L
	byte	Arrow_R,"adgjl;",control_key
	byte	function_key_7,"4680-",0,"2"
	byte	function_key_1,"zcbm.",shift_right," "
	byte	function_key_3,"sfhk:=",0
	byte	function_key_5,"etuo@",Arrow_U,"q"
	byte	Arrow_D,shift_left,"xvn,/",0

	byte	delete_key,"#%')+",Ball_filled,"!"		; shift
	byte	return_key,"WRYIP*",Arrow_L
	byte	Arrow_L,"ADGJL]",control_key
	byte	function_key_8,"$&(0",Squiggle,clr_key,34	; 34 = quote
	byte	function_key_2,"ZCBM>",shift_right," "
	byte	function_key_4,"SFHK[=",0
	byte	function_key_6,"ETUO@",Arrow_U,"Q"
	byte	Arrow_U,shift_left,"XVN<?",quit_key

	byte	delete_key,gesture_key_3,gesture_key_5,gesture_key_7,
		gesture_key_9,Box_C,Ball_alternate,gesture_key_1
	byte	return_key,Box_CL,Box_CD,Diag_DL,Circ_DL,0,0,Arrow_L
	byte	Arrow_L,Box_DR,0,Diag_UR,Circ_UR,0,0,control_key
	byte	function_key_8,gesture_key_4,gesture_key_6,gesture_key_8,
		gesture_key_0,Line_LR,0,gesture_key_2
	byte	function_key_2,Box_UR,Line_LR,Line_UD,0,0,shift_right,
		Black_char
    	byte	function_key_4,Box_DL,0,Diag_UL,Circ_UL,0,0
mif (dump_enabled) {
	byte	dump_key
} melse {
	byte 0
}
	byte	function_key_6,Box_CU,Diag_DR,Circ_DR,0,0,Arrow_U,Box_CR
	byte	Arrow_U,shift_left,Box_UL,0,0,0,0,0

;
;	joystick and keyboard variables
;	    (for internal use only)
;
joystick_1_active:	byte	0		; instantaneous joystick status
joystick_1_latch:	byte	0		; latched joystick status
read_keyboard_y_save:	byte	0		; Y register save area

keyboard_image:		byte	0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
key_input_data:		byte	0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF
key_data_bits:		byte	0		; row data to shift around
key_difference_bits:	byte	0		; 1 if bit changed, 0 if same
key_y_index:		byte	0		; Y register save area
key_shift_flag::	byte	0		; 0x40=shift, 0x80=ctrl
key_shift_count:	byte	0		; how many shift keys down
key_detected:		byte	0		; key that just went down
key_count:		byte	0		; how many keys went down
key_repeat_char:	byte	0		; character to repeat
key_repeat_timer:	byte	0		; repeat interval timer

;key_buffer_pointer:	byte	0		; points to latest buffer entry
;key_buffer_end:	byte	0		; points to last entry read out
;key_buffer:		block	key_buffer_length

