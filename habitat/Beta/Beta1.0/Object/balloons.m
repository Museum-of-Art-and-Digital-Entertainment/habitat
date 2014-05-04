; 	Text handler for the microcosm game

define	ram_pointer		=	temp_var_1
define	screen_pointer		=	temp_var_2
define	text_pointer		=	temp_var_3
define	message_pointer		=	temp_var_4
define	color_ram_source	=	temp_var_5
define	color_ram_destination	=	temp_var_6


define	text_window		= Text_RAM_1 + 40
define	color_window		= color_ram + 40
define	balloon_offset		= 40*(text_window_size-max_balloon_size)
define	quip_sprite		= 7			; sprite #7 for 'quip'
define	quip_position		= quip_sprite * 2 + sprite_position
define	quip_shadow		= 6
define	quip_shadow_position	= quip_shadow * 2 + sprite_position

define	left_up_char		= 1
define	left_side_char		= 2
define	left_down_char		= 3
define	right_up_char		= 4
define	right_side_char		= 5
define	right_down_char		= 6
define	left_char		= 7
define	right_char		= 8


counter:		byte	0
line_count:		byte	0
line_length:		byte	0
word_wrap_flag:		byte	0
hold:			byte	0
start_pos:		byte	0
space_at:		byte	0

message_hold:		word	0

define	balloon_work_line = balloon_work_area + (text_window_width * (max_balloon_size - 1))
define	balloon_work_line2 = balloon_work_line - text_window_width

draw_balloon::				; passed:
					; source (text pointer)
					; color (text color) 
					; x - xpos (0-160)
	lda	color
	and	#7
	tay
	lda	y[colors_8]
	sta	color
draw_balloon_2::
	save_and_bank_IO_in
	moveb	#0xff,quip_timeout	; start IRQ timer
	cpx	#0
	beq	skip_x_check
	cpx	#cursor_left_bound + 3 + 7
	if (lt) {
	    ldx	#cursor_left_bound + 3 + 7
	}
	cpx	#cursor_right_bound - 3 - 6
	if (gt) {
	    ldx	#cursor_right_bound - 3 - 6
	}
skip_x_check:
	stx	xpos
	moveb	#0x80,word_wrap_flag
	movew	source, message_hold
	do {
	    movew	message_hold,	message_pointer
	    jsr	clear_balloon
	    jsr	move_text_to_balloon
	} while (carry)			; move_text fails if carry
	jsr	balloon_border
	lda	#max_balloon_size
	sec
	sbc	line_count
	tay
	jsr	scroll_text_window

	movew	#(text_window+balloon_offset),	screen_pointer
	movew	#(color_window+balloon_offset),	ram_pointer
	movew	#balloon_work_area, 		text_pointer

	moveb	#0,counter
	do {
	    ldy	counter
	    lda	y[balloon_line_used_flag]
	    if (!zero) {
		ldy	#39
		do {
	        	lda	color
			sta	y[@ram_pointer]		; set color ram
			lda	y[@text_pointer]
			sta	y[@screen_pointer]
			dey
		} while (plus)
	    }
	    lda		#40
	    bump	text_pointer
	    lda		#40
	    bump	ram_pointer
	    lda		#40
	    bump	screen_pointer
	    inc		counter
	    lda		counter
	    cmp		#max_balloon_size
	} while (!equal)
	jsr	balloon_quip				;  put quip sprite up.
	restore_IO
	rts

balloon_quip::
	save_and_bank_IO_in
	lda	color
	sta	(sprite_colors + quip_sprite)
	lda	#quip_y
	sta	quip_position + 1
	sta	quip_shadow_position + 1
	lda	xpos
	asl	a
	sta	quip_position
	sta	quip_shadow_position
	lda	sprite_x_msb
	if (carry) {
	    ora	#0b11000000
	} else {
	    and	#0b00111111
	}
	sta	sprite_x_msb
	restore_IO
	rts

move_text_to_balloon:
	moveb	#(max_balloon_size - 1),line_count
	do {
	    ldy	line_count
	    lda	#0x80
	    sta	y[balloon_line_used_flag]		; mark line
	    jsr	move_line_to_balloon
	    if (zero) {
		clc
		rts					; no more lines!
	    }
	    jsr	scroll_balloon				; move line up
	    dec	line_count
	} while (plus)

; 	to exit this loop is an error! the text MUST fit inside the balloon
; 	Will try this: Negate wordrap, & try again (MUST WORK!)
; 	note, the SENDER is responcible to make sure no message is
; 	greater than (text_window_width-2) * (max_balloon_size) chars
; 	long!

	clearb	word_wrap_flag
	sec
	rts

move_line_to_balloon:

	moveb	#(text_window_width-2), space_at	; deafault cut point
	dec16	message_pointer			; so it will point correct
	ldy	#1

	do {
	    lda	y[@message_pointer]
	    if (zero) {
	    	sty	space_at		; for centering
		jmp	fill_to_end_of_line	; out of stuff to stuff
	    }
	    cmp	#32
	    if (equal) {
		sty	space_at		; remember last space position
	    }
	    sta	y[balloon_work_line]
	    iny
	    cpy	#(text_window_width-1)
	} while (!equal)

	lda	#(text_window_width-1)		; defualt string break
	bit	word_wrap_flag
	if (minus) {
	    ldy	space_at
	    cpy	#(text_window_width-2)		; ???
	    if (!equal) {
		jsr	force_line_fill		; fill to end with space
		inc	space_at
		lda	space_at		; break string here!
	    }
	}
	bump message_pointer

	ldy	#0
	lda	y[@message_pointer]		; could be a zero...

	if (zero) {
	    lda	line_count
	    cmp	#(max_balloon_size - 1)		;  the 38 byte word,all alone
	    if (equal) {
		ldy	#(text_window_width - 1)
		jsr	justify_balloon
	    }
	    lda	#0
	}

	rts

fill_to_end_of_line:
	lda	line_count
	cmp	#(max_balloon_size - 1)
	if (equal) {				;short, 1 line message
	    jsr	justify_balloon
	} else {
force_line_fill:
	    do {
		lda	#32
		sta	y[balloon_work_line]
		iny
		cpy	#(text_window_width-1)
	    } while (!equal)
;	    bit	word_wrap_flag
;	    if (minus) {
;		jsr	center_text_line
;	    }
	}
	lda	#0
	rts

;center_text_line:
;	lda	#(text_window_width - 1)		; cludge! (-1)
;	sec
;	sbc	space_at
;	if (plus) {
;	    lsr	a
;	    if (!zero) {
;		sta	hold		; save space count
;		ldy	space_at
;		lda	#(text_window_width - 2)
;		sec
;		sbc	hold
;		tax			;destination
;		do {
;		    dey
;		    cpy	#1
;		    if (slt) {
;			lda	#32
;		    } else {
;			lda	y[balloon_work_line]
;		    }
;		    sta	x[balloon_work_line]
;		    dex
;		} while (!zero)
;	    }
;	}
;	rts		
	
justify_balloon:
	moveb	#left_char, balloon_work_line
	moveb	#right_char, y[balloon_work_line]
	cpy	#(text_window_width - 1)
	if (equal) {rts}		; special case
	iny
	sty	line_length		; save length of balloon
	jsr	scroll_balloon		; copy line up
	lda	#blank_char
	ldy	#(text_window_width-1)
	do {
	    sta	y[balloon_work_line]
	    dey
	} while (plus)			; clear line totally!
	lda	line_length
	lsr	a			; / 2
	sta	hold
	lda	xpos
	lsr	a
	lsr	a			; giving character xpos
	sbc	hold			; giving 'centered' position
	sbc	#1			; adjust
	if (minus) {
	    lda	#0			; clip left
	}
	sta	start_pos
	inc	start_pos
	do {
	    dec	start_pos
	    lda	start_pos
	    clc
	    adc	line_length
	    cmp	#text_window_width		; clip right
	} while (gt)

	ldx	#0
	ldy	start_pos
	do {
	    lda	x[balloon_work_line2]
	    sta	y[balloon_work_line]
	    iny
	    inx
	    cpx	line_length
	} while (lt)
	rts	
	    
balloon_border:
	ldy	line_count
	cpy	#(max_balloon_size - 1)
	if (!equal) {				; don't mess with 1 liners
	    movew	#balloon_work_area, ram_pointer
	    lda	y[times_40]
	    bump ram_pointer
	    ldy	#0
	    lda	#left_up_char		; upper left
	    sta	y[@ram_pointer]
	    ldy	#39
	    lda	#right_up_char		; upper right
	    sta	y[@ram_pointer]
	    moveb	#left_down_char, balloon_work_line
	    moveb	#right_down_char, balloon_work_line+(text_window_width-1)
	}
	rts

scroll_balloon:
	movew	#balloon_work_area,destination
	movew	#(balloon_work_area + text_window_width), source
	movew	#(text_window_width * (max_balloon_size - 1)), length
	jsr	block_move
	rts
	
clear_balloon:
	movew	#balloon_work_area,	ram_pointer
	ldx	#(max_balloon_size - 1)
	do {
	    clearb	x[balloon_line_used_flag]

	    ldy	#(text_window_width - 1)
	    lda	#right_side_char
	    sta	y[@ram_pointer]
	    dey

	    lda	#blank_char
	    do {
		sta	y[@ram_pointer]
		dey
	    } while (!zero)

	    lda		#left_side_char
	    sta		y[@ram_pointer]		; left side

	    lda		#text_window_width
	    bump	ram_pointer
	    dex
	} while (plus)
	rts

scroll_text_window:			; # of lines passed in Y
	lda	#/text_window
	sta	destination
	sta	color_ram_destination

	clc
	adc	y[times_40]
	sta	source
	sta	color_ram_source

	lda	#?text_window
	sta	destination + 1
	clc
	adc	y[times_40_hi]
	sta	source + 1

	lda	#?color_window
	sta	color_ram_destination + 1
	adc	y[times_40_hi]
	sta	color_ram_source + 1

	lda	#/(40 * text_window_size)
	sec
	sbc	y[times_40]
	sta	length
	lda	#?(40 * text_window_size)
	sbc	y[times_40_hi]
	sta	length+1		;  how many bytes to move
	jsr	block_move
	movew	color_ram_source,source
	movew	color_ram_destination,destination
	jsr	block_move
	rts
	
times_40::
	byte	0,40,80,120,160,200,240
	byte	24,64,104,144,184,224
	byte	8,48,88,128
times_40_hi::
	byte	0,0,0,0,0,0,0
	byte	1,1,1,1,1,1
	byte	2,2,2,2

colors_8:
	byte	cyan,light_green,yellow,orange
	byte	gray_2,purple,light_red,light_blue
