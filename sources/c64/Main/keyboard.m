;----------------------------------------
;
;	keyboard service routine
;

 
 
vblank_get_key::
	lda	region_is_ready		; dont do during region trans
	beq	exit_get_key
	lda	keyboard_latch		; command key pressed!
	bne	exit_get_key
	lda	loader_is_in_memory	; in init mode? No normal proc.
	bne	exit_get_key
	lda	command_selected
	bpl	exit_get_key		; don't process YET! (wait)
	lda	custom_running
	bne	exit_get_key

	ldx	text_cursor
	jsr	read_keyboard
	sta	keyboard_latch
	if (equal) {
exit_get_key:
	    rts				; no new keys to display
	}

	cmp	#function_key_1
	if (geq) {
	    cmp	#gesture_max+1
	    bcc	exit_get_key
	}

	cmp	#quit_key
	if (equal) {
	    sta	quit_flag
	    jmp	get_command_key_exit
	}

	cmp	#dump_key
	if (equal) {
	    sta	quit_flag
	    jmp	get_command_key_exit
	}

	ldy	graphics_mode
	if (minus) {
	    ldy	write_to_paper_mode
	    if (zero) {
		rts
	    }
	}

	cmp	#clr_key
	if (equal) {
	    jmp	clear_text_line
	}
	cmp	#return_key
	if (!equal) {
	    ldy #0
	    sty	keyboard_latch
	    cmp	#delete_key
	    if (!equal) {
		inx
		cpx	#(max_text_line_length - 1)
		beq	vblank_get_key			;throw away
		stx	text_cursor		    
		sta	x[text_line]
	    } else {
		cpx	text_left_hand_bound	
		if (!equal) {
		    lda	#32
		    inx
		    sta	x[text_line]		; blank out 
		    dex
		    dex
		    stx	text_cursor
		}
	    }
	    inx
	    moveb	#blank_char,x[text_line]	; put out cursor char
	    jsr	display_text_line
	    jmp	vblank_get_key
	}
	inx
	stx	input_text_length
	moveb	#0,x[text_line]			; eostring
	cpx	#0
	if (equal) {				; null message
	    stx keyboard_latch
	    jmp	vblank_get_key
	}
	rts

display_text_line::
	dec	keyboard_latch		; protect from interrupts!
	inx
	txa
	sec
	sbc	#max_text_display_length
	if (!carry) {
	    clearb	kb_counter
	} else {
	    sta		kb_counter
	}
	ldx	#0
	do {
	    ldy	kb_counter
	    lda	y[text_line]
	    sta	x[text_screen_address]
;;	    sta	x[text_screen2_address]
	    inc	kb_counter
	    inx
	    cpx	#max_text_display_length
	} while (!equal)
	inc	keyboard_latch
	rts

clear_text_line::
	dec	keyboard_latch		; so no ints will triffel!
	lda	#32
	ldx	#(max_text_line_length)
	do {
	    cpx	text_left_hand_bound		; 6.1
	    beq	clr_skip
	    sta	x[text_line]
	    dex
	} while (plus)
clr_skip:
	inx
	lda	#blank_char
	sta	x[text_line]
	dex					; ff
	stx	text_cursor
	jsr	display_text_line		; put on screen
	inc	keyboard_latch
	rts

get_key::
	lda	keyboard_latch
	cmp	#function_key_1
	if (geq) {
	    cmp	#gesture_max+1
	    if (lt) {
		jsr	que_gesture
jsr display_mem_usage
		jmp	get_command_key_exit
	    }
	}
	ldy	graphics_mode
	if (minus) {
	    ldy	write_to_paper_mode
	    if (zero) {
		jmp	write_to_page
	    }
	}
	cmp	#return_key
	if (equal) {
	    movew	#text_line, source
	    ldy		awaiting_text_input
	    if (!zero) {
		clearb	awaiting_text_input	; Got it!
	    } else {
		jsr	special_limitations
		if (!carry) {
		    moveb	#6, command_selected	; talk to object
		    jsr		start_cursor_flashing
		} else {
		    jsr		beep
		}
	    }
	}
get_command_key_exit:
	clearb	keyboard_latch
	rts
