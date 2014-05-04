; 	cursor


define	shadow_sprite		=	4
define	shadow_position		=	shadow_sprite * 2 + sprite_position
define	sticky_time_limit	=	120	; in jiffies

command_selected::	byte	0xff
old_joystick_state:	byte	0
sticky_time:		byte	0

cursor::
	lda	throttle_running
	if (minus) {
	    dec	throttle_count
	    if (zero) {
		dec	throttle_count+1
		if (minus) {
		    inc	throttle_running	; throttle off.
		}
	    }
	}
	dec	quip_timeout
	if (zero) {
kill_quip::
	    moveb	#0,xpos
	    jmp		balloon_quip		; timeout!
	}

	lda	command_selected	; don't allow anything! (busy)
	if (plus) {jmp	maintain_flashing}
	lda	detach_from_stick	; cursor FREEZE (really freeze)
	ora	have_been_ported	; 6.4 No New Commands!
	if (!zero) {jmp	maintain_flashing}

	lda	flashing
	ora	cursor_lock		; no new commands for these reasons
	if (!zero) {
	    jmp	skip_trigger_check
;	    bit	trigger_is_pressed		; 6.1, if button is down
;	    if (plus) {jmp maintain_flashing}	; user is anticipating
	}

	ldy	cursor_state
	bit	trigger_is_pressed
	if (minus) {
	    cpy	#normal_cursor				; trigger not pressed
	    if (!equal) {
	    	cpy	#pen_cursor
		if (!equal) {
		    lda	joystick_state
		    and	#0b00001111
		    cmp	#0b00001111
		    if (!equal) {rts}			; frozen, no move-o
		    ldx	cursor_state
		    stx	last_icon
		    lda	x[state_to_command]
		    sta	command_selected		; do,get,put WHAT?
		    jsr	start_cursor_flashing
		}
	    }
	} else {
	    cpy	#pen_cursor
	    if (equal) {rts}
	    lda	joystick_state
	    cmp	old_joystick_state
	    if (equal) {			; has stayed the same
		lda	sticky_time
		if (!zero) {			; timer is running
		    dec	sticky_time
		    if (zero) {			; timer has expired!
			lda	#stop_cursor
			jsr	set_cursor_state
		    }
		}
		rts			; cursor no change-o
	    }
	    sta	old_joystick_state
	    and	#0b00001111
	    tay
	    lda	y[cursor_point_table]
	    cmp	#stop_cursor		; want to change to stop?
	    if (equal) {
		ldy	cursor_state
		cpy	#normal_cursor	; from normal, do it now
		if (!equal) {
		    ldx	#sticky_time_limit
		    stx	sticky_time	; otherwise, stick here a sec
		    rts
		}
	    }
	    jsr	set_cursor_state
	    rts
	}

skip_trigger_check::
	clearb	old_joystick_state
	ldx	cursor_x
	lda	stick_is_right
	if (zero) {
	    cpx	#cursor_right_bound
	    if (!equal) {
		inc	cursor_x
	    }
	}
	lda	stick_is_left
	if (zero) {
	    cpx	#cursor_left_bound
	    if (!equal) {
		dec	cursor_x
	    }
	}

	ldy	cursor_y
	lda	stick_is_up
	if (zero) {
	    cpy	#cursor_top_bound
	    if (geq) {
		dec	cursor_y
;		cpy	#quip_y+1
;		if (equal) {
;		    dec	cursor_y
;		}
;		cpy	#cursor_over_interrupt
;		if (equal) {
;		    lda	#opcode_nop
;		    sta	interrupt_delay
;		    sta	interrupt_delay+1
;		    sta	interrupt_delay+2
;		}
;		cpy	#cursor_top_interrupt
;		if (equal) {
;		    lda	#opcode_jmp
;		    sta	top_interrupt_delay	; allow cursor to cross int
;		    movew	#bitmap_on_start,top_interrupt_delay+1
;		}
	    }
	}

	lda	stick_is_down
	if (zero) {
	    cpy	#cursor_bottom_bound
	    if (leq) {
		inc	cursor_y
;		cpy	#quip_y-1
;		if (equal) {
;		    inc	cursor_y
;		}
;		cpy	#cursor_over_interrupt-1
;		if (equal) {
;		    lda	#opcode_jmp
;		    sta	interrupt_delay		; allow cursor to cross int
;		    movew	#bitmap_off_start,interrupt_delay+1
;		}
;		cpy	#cursor_top_interrupt-1
;		if (equal) {
;		    lda	#opcode_nop
;		    sta	top_interrupt_delay
;		    sta	top_interrupt_delay+1
;		    sta	top_interrupt_delay+2
;		}
	    }
	}

	lda	cursor_y
	ldy	graphics_mode
	if (minus) {
	    and	#0b11111000			; clamp on text mode
	}
	sta	cursor_position + 1
	ldy	cursor_state
	cpy	#pen_cursor
	if (equal) {				; no shadows for pen
	    lda	#0
	}
	sta	shadow_position + 1

	lda	cursor_x
	ldy	graphics_mode
	if (minus) {
	    and	#0b11111100			; clamp on text mode
	}
	asl	a			; * 2
	sta	cursor_position
	sta	shadow_position

	lda	sprite_x_msb
	if (carry) {
	    ora	#0b00110000
	} else {
	    and	#0b11001111
	}
	sta	sprite_x_msb

maintain_flashing:
	ldy	cursor_state
	lda	y[icon_colors]
	tax
	lda	flashing
	if (minus) {
	    dec	flash_count
	    lda	flash_count
	    and	#flash_rate
	    if (!zero) {
		ldx	#Black
	    }
	}
	stx	(sprite_colors + cursor_sprite)
	rts

set_cursor_state::
	sta	cursor_state
	ldx	#0
	cmp	#pen_cursor
	if (equal) {
	    ldx	#0b00110000
	}
	save_and_bank_io_in
	stx	multicolor_sprite
	ldy	cursor_state
	lda	y[icon_colors]
	sta	(sprite_colors + cursor_sprite)		; color the sprite
	lda	y[icon_table]
	sta	sprite_pointers+cursor_sprite
;	sta	sprite_pointers+cursor_sprite+0x2000
	lda	y[shadow_table]
	sta	sprite_pointers+shadow_sprite
;	sta	sprite_pointers+shadow_sprite+0x2000
	clearb	sticky_time
	restore_io
	rts

start_cursor_flashing::
	movew	throttle_duration, throttle_count
	dec	throttle_running			; start the delay.
	dec	flashing
	rts

cursor_point_table:
	byte	-1,-1       ,-1       ,-1
	byte	-1,do_cursor,go_cursor,get_cursor
	byte	-1,do_cursor,go_cursor,put_cursor
	byte	-1,do_cursor,go_cursor,stop_cursor

state_to_command:
	byte	command_STOP,command_DO,command_GO,command_STOP,
		command_GET,command_PUT

icon_colors:
	byte	gray_3,yellow,light_green,white,light_red,light_blue,brown


throttle_table::
	byte	0x00,0x00,0x01,0x02,0x02,0x03,0x04
throttle_table_lo::
	byte	0xb4,0xb4,0x68,0x1c,0xd0,0x84,0x38
