	include	"diskmacros.m"

; 	init	stuff

counter:	byte	0

farmers_init::

	sei

	moveb	#0b00101111,	data_direction
	moveb	#0b00100101,	IO_reg

	bank_io_in

	jsr	clear_zpage			; clear all zpage

	movew	#customize_hold_area, source
	movew	#customize_target, destination
	movew	#0x800, length
	jsr	block_move

	moveb	#Black,		border_color
	moveb	#black,		background_color

	fill	start_variables,(end_variables-start_variables-1),0
	fill	OBUFFS,512,0
	fill	RSINBF,192,0
	fill	request_buffers,512,0
	fill	qlink_message_text, 186, 0

	moveb	#0xff,cursor_lock
	sta	last_response_processed
	sta	response_buffer_number
	sta	text_left_hand_bound

	lda 	#0		; Turn off TEST, RINGMOD, and SYNC
	sta	0xd400+0x04	;  bits for osc 0,1,2 (no SFX ever sets
	sta	0xd400+0x0B	;  these bits in Habitat); also GATE off
	sta	0xd400+0x12	;  and waveform selects off to avoid
				;  leakage while idle.
	sta	0xd400+0x17	; Set filter resonance to 0, unfilter oscs
	sta	0xd400+0x15	; Set filter freq to 0 (unnec.?)
	sta	0xd400+0x16	;
				;
	lda	#0x0F		; Set volume to maxplus, turn off filter
	sta	0xd400+0x18	;  outputs

	lda	blue
	sta	background_color_1
	sta	background_color_2
	sta	background_color_3

	fill    color_ram,9*40,black			; top 9 lines black
	fill	color_ram,40,white			; top line white
	fill	text_ram_1,9*40,0x00			; text window

	fill	color_ram+9*40,(16*40),color_sky
	fill	text_ram_1+9*40,(16*40),color_cyan*16+color_black

	fill	bitmap_screen_1-320,320,0xff		; interrupt space
	fill	bitmap_screen_2-320,320,0xff

	moveb	#0x00,	sprite_enable

	clearb	expand_sprite_x
	sta	multicolor_sprite
	sta	expand_sprite_y
	sta	sprite_x_msb		; no mult for now...
	sta	sprite_priority

	moveb	#black, multicolor_0
	moveb	#red, multicolor_1

	moveb	#((sprite-vic_bank_start)/64),counter
	ldx	#15
	ldy	#7
	do {
	    lda	counter
	    sta	y[sprite_pointers]
;	    sta	y[sprite_pointers+0x2000]
	    lda	#black
	    sta	y[sprite_colors]
	    sta	x[sprite_position-1]
	    sta	x[sprite_position]
	    inc	counter
	    dex
	    dex
	    dey
	} while (plus)

	moveb	#color_pink,	player_color
	moveb	#130,		cursor_y
	moveb	#156,		cursor_x
	lda	#normal_cursor
	jsr	set_cursor_state

init_keyboard::
	lda	#0xff
	sta	kb_buffer_pointer
	sta	kb_buffer_end
	sta	text_cursor
	jsr	clear_text_line
	moveb	#32,	text_line_prestart

	jsr	init_vblank			; setup raster stuff
	jsr	rs232_open

	bank_io_out

	ldy	#0				; we gonna fake out the sounds
	lda	#0
	tax
	jsr	save_sound
	iny
	lda	#/(title_music_v1-title_music_start)
	ldx	#?(title_music_v1-title_music_start)
	jsr	save_sound
	iny
	lda	#/(title_music_v2-title_music_start)
	ldx	#?(title_music_v2-title_music_start)
	jsr	save_sound
	iny
	lda	#/(title_music_v0_pw-title_music_start)
	ldx	#?(title_music_v0_pw-title_music_start)
	jsr	save_sound
	iny
	lda	#/(title_music_v1_pw-title_music_start)
	ldx	#?(title_music_v1_pw-title_music_start)
	jsr	save_sound
	iny
	lda	#/(title_music_v2_pw-title_music_start)
	ldx	#?(title_music_v2_pw-title_music_start)
	jsr	save_sound

	sei
	ldy	#5		; effect: 5 4 3 2 1 0
	ldx	#6		; voice:  6 5 4 2 1 0
	do {
	    tya
	    jsr	que_sound_effect
	    dex
	    cpx #3
	    if (equal) {
		dex
	    }
	    dey
	} while (plus)
	cli

	ldx	#39
	do {
	    lda	x[greetings]
	    sta	x[text_screen_address]
;;	    sta	x[text_screen2_address]
	    dex
	} while (plus)

	ldy	#5
	jsr	wait
	dec	p_send_packet_lock
	jsr	send_bad_packet		; get host to NAK on a bad pkt
	ldx	rs232_send_buffer_end
	dex
	dex
	dex
	dec	x[rs232_output]		; corrupt CRC
	clearb	p_send_packet_lock
	jsr	zoom
	ldy	#1
	jsr	wait

	moveb	#'0', desired_disk		;  '0' Habitat beta disk
	movew	#insert_disk_message,	instructions
	jsr	swap_disk			; does local init stuff
        fill	text_ram_1+40, text_window_size*40, 0x0
	rts

greetings:
	byte	0,0,0,0,0,0,0,0
	byte	"(c) 1987 Lucasfilm Ltd."
	byte	0,0,0,0,0,0,0,0,0

insert_disk_message:
	string	"Insert imagery disk, press any key."

define	baud_300		=	0b00000110
define	Kernal_control_reg	=	0x293
define	Kernal_half_time	=	0x295
define	Kernal_timing		=	0x299

rs232_open::
	moveb	Kernal_control_reg, rs232_control
	and	#baud_300
	cmp	#baud_300		; slower modem, faster throttle
	if (equal) {
		moveb	#/(Default_throttle_decrement/3),throttle_selfmod+1
		moveb	#?(Default_throttle_decrement/3),throttle_selfmod+3
		moveb	#/(Default_throttle_increment/3),throttle_selfmod2+1
		moveb	#?(Default_throttle_increment/3),throttle_selfmod2+3
	}
	movew	Kernal_half_time, rs232_half_time
	movew	Kernal_timing, rs232_timing

	ldy	#00
	sty	rs232_enable
	sty	rs232_status			; clear status
	sty	rs232_command
	ldx	#9				; bits ?
	stx	rs232_bit_count
	ldx	#0xff
	stx	rs232_start_bit_flag
	stx	rs232_output_bit

	moveb	rs232_rcv_buffer_end,rs232_rcv_buffer_start
	moveb	rs232_send_buffer_end,rs232_send_buffer_start

	movew	#rs232_input,rs232_input_buffer
	movew	#rs232_output,rs232_output_buffer

	lda	#0b10010000
	jsr	rs232_init_port

	lda	rs232_timing
	sta	timer_a
	lda	rs232_timing+1
	sta	timer_a+1			; setup output timer
	lda	#0b00010001
	sta	NMI_timer_a

	rts

save_zpage::				; and pages 2 & 3 as at bootime
	ldy	#0			; & copy music into heap
	do {
	    lda	y[hold_zpage]
	    sta y[where_music_goes]
	    lda	y[0x0000]
	    sta	y[hold_zpage]

	    lda	y[hold_page_2]
	    sta y[where_music_goes_1]
	    lda	y[0x0200]
	    sta	y[hold_page_2]

	    lda	y[hold_page_3]
	    sta y[where_music_goes_2]
	    lda	y[0x0300]
	    sta	y[hold_page_3]

	    lda	y[hold_page_3+0x100]		; music slightly > 3 pages
	    sta y[where_music_goes_3]

	    dey
	} while (!zero)
	rts
	
;****************************************
;	clear zpage except fastload locs
;****************************************
clear_zpage::
	lda	#0				; clear zpage down to start
	ldy	#start_zpage
	do {
		sta	y[0x00]
		iny
	} until (equal)
	rts

save_sound:
	clc
	adc	#/(where_music_goes-BLOCK_data_offset)
	sta	y[sound_table_lo]
	txa
	adc	#?(where_music_goes-BLOCK_data_offset)
	sta	y[sound_table_hi]
	rts

define	comet_start_y	=	140 + 8

comet_x_pos:	byte	24
comet_y_pos:	byte	comet_start_y
comet_y_inc:	byte	10
comet_x_inc:	byte	10

zoom:					; The Comet, By Kevin Furry
	bank_io_in
	moveb	#0b00000001,sprite_enable		; turn on sprite 0
	sta	sprites_enabled
	sta	sprite_priority				; priority
	sta	0xd027					; color equals white

	ldy	#63
	do	{
		lda	y[0x41c0]
		sta	y[customize_hold_area]
		lda	#0
		sta	y[0x41c0]
		dey
	} until (minus)

	moveb	#0b00100001,0x41c1		; draw sprite
	moveb	#0b00100110,0x41c2

	moveb	#0b10000100,0x41c3
	moveb	#0b01000100,0x41c4
	moveb	#0b01011111,0x41c5

	moveb	#0b00010000,0x41c7
	moveb	#0b10010110,0x41c8

move_comet:
	do	{
		dec	comet_x_inc
		if	(zero)	{			; can we move
			moveb	#200,comet_x_inc	; restore counter
			dec	comet_y_inc		; can we move y
			if	(zero)	{
				moveb	#20,comet_y_inc	; restore counter
				inc	comet_y_pos	; ok move it
				ldy	comet_y_pos
			}
			inc	comet_x_pos		; is x over 255
			if	(zero)	{
				moveb	#0b00000001,0xd010 ; set its msb
			}
			moveb	comet_x_pos,0xd000	; move sprite
			moveb	comet_y_pos,0xd001
			cmp	#comet_start_y+16	; are we done yet ?
		}
	} until	(zero)

	clearb	sprite_enable
	sta	sprites_enabled
	sta	sprite_priority
	sta	0xd010
	sta	0xd000
	sta	0xd001
	ldy	#63				; recover sprite
	do	{
		lda	y[customize_hold_area]
		sta	y[0x41c0]
		dey
	} until (minus)
	bank_io_out

	rts

wait::				; in y = number of loops
	do {
	    ldx	#0
	    do {
		lda	#0
		do {
		    sec
		    sbc	#1
		} while (!zero)
		dex
	    } while (!zero)
	    dey
	} while (!zero)
	rts

resume_communications::
	jmp	Im_alive

