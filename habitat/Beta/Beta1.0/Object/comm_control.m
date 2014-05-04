; 	communications control routintes
; 
; 	These are the ones to call when you want the HOST to do something.
; 
; 	F Randall Farmer

super_buffer_full:		byte	0
next_packet::			word	buffer_base
next_avail_byte::		word	buffer_base

pointed_latch:			byte	0

goto_screen_2::
	lda	screen
	if (zero) {
	    jsr	switch_pages
	}
	rts

wait_for_region::
	lda	graphics_mode
	if (minus) {
	    jsr	exit_text_mode
	}
	moveb	#0xff, command_selected	; when you get there, don't do jack.
	jsr	kill_quip
	jsr	sprites_off
	jsr	black_out_bitmap
	jsr	clear_text_line
	jsr	region_trans_sound	; start_noise
	jsr	decrement_LRUs
	inc	screen_is_off		;next IRQ to shut off screen
	lda	#0
	jsr	purge_contents		; delete this region
	jsr	setup_for_region_contents_vector
	ldy	#MESSAGE_describe	; request
	jsr	send_region_message
	inc	region_trans_type	; well got here!
	jsr	region_trans_sound
	lda	region_trans_sound_toggle
	sta	region_trans_type	; default back to walk
	moveb	#0xff, command_selected	; in case kb issued command 6.1
	clearb	have_been_ported	; 6.4 just escaped with my life!
	lda	#normal_cursor
	jsr	set_cursor_state
	dec	screen_is_off		; next IRQ to turn vic on
	jmp	here_i_am

render_region::
	lda	hereis_flag
	if (zero) {
	    movew	#rev_number,	source		;  6.4
	    moveb	#black,		color		; 
	    ldx	#0					; 
	    jsr		draw_balloon_2			; 
	    jsr		all_sfx_off
forced_render_region::
	    jsr		black_out_bitmap
	    lda		#0xff
	    eor		light_level
	    sta		old_light_level		; changed (for sure!)
	    lda		#0
	    sta		graphics_mode
	    jsr		change_light_level	; set avatar color correctly
	    jsr		render
	}
	rts

event_handler::
	lda	command_selected	; did a command occur
	if (plus) {
	    lda	pointed_latch
	    if (zero) {
		jsr	update_cursor
		sta	first_pointed_noid
		inc	pointed_latch
	    }
	    lda	throttle_running	; & is throttle off?
	    if (plus) {
		dec	cursor_lock
;;		jsr	check_all_resource_types	; LRC everything
		jsr	execute_command
		clearb	cursor_lock
		sta	pointed_latch
		sta	stack_before_execution		; not awaitng anything
		sta	last_icon
		sta	reset_to_icon
		sta	flashing
		sta	detach_from_stick
		jsr	set_cursor_state
		rts
	    }
	}
	jsr	check_for_new_response
	if (zero) {rts}
;;	jsr	check_all_resource_types		; heap LRC
	ldy	#obj_header-mid_header
	lda	y[@response_data]
	if (zero) {			; region?
	    jmp	region_special_case
	}
	    lda	region_is_ready
	    if (zero) {rts}		; ignore any 'EARLY' messages
	    ldy	#seq_header-mid_header
	    lda	y[@response_data]
	    and	#0b01011111
	    cmp	#phantom_request		; Async message?
	    if (equal) {
		iny
		lda	y[@response_data]
		sta	actor_noid
		jsr	set_up_actor_pointers
		lda	actor_object+1			; 6.3
		if (zero) {				; 
		    error missing_object		; 
		}					; 
		ldy	#req_header-mid_header
		lda	y[@response_data]		; ok, what to do...
		ldy	actor_noid
do_what_I_want::
		jsr	GetAction
		jsr	bump_vector
		lda	#async_entry
		jmp	indirect_jump
	    } else {			; this is a response to a request
		moveb	who_am_I, actor_noid
do_reply:
		jsr	set_up_actor_pointers
		ldy	#OBJECT_wait_state
		lda	y[@actor_object]
		and	#0xff-reply_wait_bit-animation_wait_bit
		sta	y[@actor_object]	; mark response ready!
		jsr	bump_vector
	    }
	rts			; this rts will return us to calling action

len_of_last_packet:	byte	0xff

check_for_new_response::
	dec	p_send_packet_lock
	lda	len_of_last_packet		; actually length of PREVIOUS
	if (plus) {				; packet
	    add16	end_of_packet_stream, #1, next_packet
	    moveb	#0xff, len_of_last_packet
	}
one_more_try:
	test16	next_packet,next_avail_byte
	if (!equal) {				; zero flag means no new event
	    lda	next_packet
	    sta	response_data
	    sta	end_of_packet_stream
	    lda	next_packet+1
	    sta	response_data+1
	    sta	end_of_packet_stream+1
	    ldy	#0
	    lda	y[@response_data]
	    if (zero) {
		movew	#buffer_base, next_packet
		jmp	one_more_try
	    }
	    sty	super_buffer_full		; got new packet,freed space
	    sta	len_of_last_packet		; # of bytes to free later
	    bump end_of_packet_stream		; addr of last byte
	    ldy	#seq_header-mid_header
	    lda	y[@response_data]
	    sta	packet_stream_seq_header	; definately non-zero
	}
exit_check:
	php
	inc	p_send_packet_lock
	plp
	rts

Get_next_packet_stream_byte::
	inc16	response_data
	lda	response_data
	cmp	end_of_packet_stream
	if (equal) {
	    lda	response_data+1
	    cmp	end_of_packet_stream+1
	    if (equal) {			; string to next response ?
		lda	packet_stream_seq_header
		and	#end_of_request_bit
		if (zero) {			; string if not end.
			do {
			    jsr	check_for_new_response
			} while (zero)		; wait for host to send.
			jsr	bump_vector
		}
	    }
	}
Get_packet_stream_byte::
	ldy	#0
	lda	y[@response_data]
	rts

bump_vector::
	lda	#req_header-mid_header+1
	bump	response_data			; point to data!
	rts

send_arguments::
	pha
	movew	#arguments,source
	pla
send_string::			; a - length
				; @source - string
				; y - request
				; x - OID
	pha
	tya
	jsr	prepare_to_send_request
	pla
	if (!zero) {		; not null...
	    tax
	    ldy	#0
	    do {
		lda	y[@source]
		jsr	send_request_byte
	    	iny
		dex
	    } while (!zero)
	}
	jsr	send_request
	rts

prepare_to_send_request::
					; X = Object ID (OID)
					; A = Request #
	sta	request_number
	stx	request_OID
	lda	sequence_number
	and	#max_req_buffers-1	; use ONLY sig bits
	sta	buffer_number
	tay

	tya				; find that buffer
	lsr	a			; /2 (used as page offset)
	pha
	lda	#0
	if (carry) {
	    lda	#0x80			; odd buffer number
	}
	clc
	adc	#/request_buffers
	sta	request_buffer
	pla
	adc	#?request_buffers
	sta	request_buffer+1	; points to proper buffer, byte 0

	lda	#mid_byte
	ldy	#mid_header
	sta	y[@request_buffer]	; start header

	lda	sequence_number
	ldy	#seq_header
	ora	#start_of_request_bit	; mark as starting packet
	sta	y[@request_buffer]
	adc	#1
	and	#0b00001111		; ring count 0-15
	sta	sequence_number

	sty	buffer_offset
	lda	request_OID
	jsr	send_request_byte
	lda	request_number
	jsr	send_request_byte	; finish off header

	rts

send_request_byte::			; put A in buffer, send if full
	sta	request_byte		; preserves x & y
	tya
	pha
	txa
	pha
	ldy	buffer_offset
	cpy	#125
	if (geq) {
		lda	request_byte
		pha
		jsr	send_continued_request	; ship this line out!

		lda	request_number
		ldx	request_OID
		jsr	prepare_to_send_request

		ldy	#seq_header
		lda	y[@request_buffer]
		and	#~start_of_request_bit	; THIS is NOT a start packet
		sta	y[@request_buffer]

		pla				; recover orig req_byte
		sta	request_byte		; OK, NOW continue
		ldy	buffer_offset
	}
	iny
	sty	buffer_offset
	ldx	request_byte
	txa
;	clc
;	adc	bandwidth_factor
;	sta	request_byte
;	cmp	#0					; no more 6.4
;	beq	Forbidden
	cmp	#13
	beq	Forbidden
;	cmp	#14
;	beq	Forbidden
	cmp	#escape_char
	beq	Forbidden
	cmp	#141
;	beq	Forbidden
;	cmp	#142
;	beq	Forbidden
;	cmp	#255
	bne	put_request_byte
Forbidden:
	lda	#escape_char
	sta	y[@request_buffer]
	iny
	lda	request_byte
	eor	#0x55				; mask forbidden byte
put_request_byte:
	sta	y[@request_buffer]
	sty	buffer_offset
	pla
	tax
	pla
	tay
	rts

send_request::
	clc
send_continued_request:
	ldy	#seq_header
	lda	y[@request_buffer]
	ora	#fixed_on_bits
	if (!carry) {
	    ora	#end_of_request_bit		; continued in next packet?
	}
	sta	y[@request_buffer]		; e1s0xxxx

	sta	HDRPFX+1
	moveb	#mid_byte,	HDRPFX		; get header bytes from buff
	lda	buffer_offset
	sec
	sbc	#9				; 'cause protocol adds 10
	sta	MESSSZ				; length
	movew	request_buffer, MSGPNT
	jsr	RS232O
	rts



handle_response::				; by the time we get here,
						;  there MUST be space
;inc_border_color

	lda	RSINBF+mid_header-1
	cmp	#mid_byte			; is it one of ours?
	bne	handle_qlink_message		; nope, its somethin special

	movew	next_avail_byte, response	; where it goes...

	ldx	#mid_header			; copy & decode buffer
	ldy	#1				; don't copy qlink jazz
	lda	x[RSINBF]
	sta	y[@response]			; copy seq_header
	inx
	iny
	clc
	do {
	    lda	x[RSINBF]
	    if (carry) {			; was esc preceeding char?
		eor	#0x55			; xor to get forbidden byte
;		sbc	bandwidth_factor
		sta	y[@response]
		clc				; esc off
	    } else {
		cmp	#escape_char		; is it escape?
		if (equal) {
		    sec				; yep, set flag for next char
		    dey				; backup 1 char in buffer
		} else {
		    cmp	#0x0d
		    if (equal) {		; end of packet?
			lda	#0		; balloons uses 0 for EOM
			sta	y[@response]	; normal char, just save it
			sty	response_length
			ldy	#128		; mark finished!
		    } else {
;			sbc	bandwidth_factor
			sta	y[@response]	; normal char, just save it
			clc
		    }
		}
	    }
	    inx
	    iny
	} while (plus)				; 0-127
;	jsr	NAK_HACK
	lda	response_length
	ldy	#0
	sta	y[@response]			; length of actual data	
	clc
	adc	#1
	bump	next_avail_byte			; for NEXT packet!
	rts

handle_qlink_message:
	ldy	#3
	do {
	    cmp	y[qlink_msg_1]
	    if (equal) {
		lda	RSINBF+mid_header
		cmp	y[qlink_msg_2]
		beq	display_qlink_message
		rts				; fail, reject
	    }
	    dey
	} while (plus)				; fall thru, reject
	rts

space_workvar:		word	0

is_there_space::				; y=size
	lda	super_buffer_full		; overide
	bne	not_enuf_space
	iny
	tya
	clc
	adc	next_avail_byte
	sta	space_workvar
	lda	#0
	adc	next_avail_byte+1
	sta	space_workvar+1
	cmp16	space_workvar,#buffer_end
	if (geq) {
		cmp16	next_avail_byte,next_packet
		if (lt) {
			jmp	not_enuf_space		; fix 6.3
		}
		movew	next_avail_byte, space_selfmod+1
		lda	#0
space_selfmod:
		sta	0xf000
		movew	#buffer_base, next_avail_byte	; reset to top
		jmp	is_there_space
	}
	cmp16	next_avail_byte,next_packet
	if (lt) {
		cmp16	space_workvar, next_packet
		if (geq) {
			inc	super_buffer_full	; jam the buffer
not_enuf_space:
			sec
			rts
		}
	}
	clc
	rts
    
display_qlink_message:
	lda	y[pack_offset]		; where is the text?
	if (zero) {			; 'SS' special case
	    inc	got_ss_packet
	    rts
	}
	clc
	adc	#/(RSINBF+mid_header)
	sta	response
	lda	#?(RSINBF+mid_header)
	adc	#0
	sta	response+1

	ldy	#98
	do {
	    lda	y[@response]
	    cmp	#0x0d
	    if (equal) {
		lda	#0
	    }
	    sta	y[qlink_message_text]		; has to be SEPERATE buffer
	    dey
	} while (plus)
	inc	qlink_message_waiting
	rts

print_any_qlink_messages::
	lda	qlink_message_waiting
	if (!zero) {
	    ldx		#0
	    movew	#qlink_message_text, source
	    moveb	#white, color
	    jsr		draw_balloon
	    dec		qlink_message_waiting
	}
	rts


qlink_msg_1:	byte	'A','O','X','S'
qlink_msg_2:	byte	'B','T','S','S'
pack_offset:	byte	12,1,1,0

mif (0) {
NAK_HACK:
			; tell the stratus to SHUT UP!
			; so we can process the message 
	ldy	#obj_header-mid_header			;  THE NAK HACK
	lda	y[@response]
	cmp	#0
	if (equal) {				; region
		iny
		lda	y[@response]
	   	cmp	#1				; DESCRIBE
	   	if (equal) {
		    ldy	#seq_header-mid_header
		    lda	y[@response]
		    and	#end_of_request_bit		; last packet?
		    if (!zero) {
			lda	nak_everything		; not yet halted
			if (zero) {
			    inc	nak_everything		; HALT COMMUNICATIONS
			    lda	host_needs_SS
			    if (!zero) {
				jsr	send_SS
			    }			
			}
		    }
		}
	}
	rts
}

send_region_message::					; request in y
	movew	#program_disk_number, source
	lda	#rev_number_end-program_disk_number	; len of rev
	ldx	#0					; noid useless
	jsr	send_string				; ask for the region
	do {
	    jsr	event_handler				; wait for reply!
	    lda	region_is_ready
	} while (zero)
	rts


black_out_bitmap::
	fill	bitmap_screen_1,5120,pat_black	; clear logo screen
	jmp	goto_screen_2
	rts

region_trans_sound::
	lda	#8
	ldy	#0
	jmp	do_what_I_want			; activate region behaviour 8
	
ask_host_for_help::
	lda	#9
	ldy	#0
	jmp	do_what_I_want			; sent a help request.

quip_on::
	lda	#0xff
	ldy	#0b11000000			; 6 & 7 on ONLY
	bne	set_switch
sprites_on::
	lda	#0
	ldy	#0xff
	bne	set_switch
sprites_off::
	lda	#0xff
	ldy	#0
set_switch:
	sta	detach_from_stick		; no see, no move!
	bank_io_in
	sty	sprites_enabled
	sty	sprite_enable
	bank_io_out
	rts

