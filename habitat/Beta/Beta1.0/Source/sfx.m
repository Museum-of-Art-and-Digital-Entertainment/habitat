
define	filter_voice		=	3

define	SID			=	0xd400
define	SID_freq		=	SID+0x0
define	SID_pulse_width		=	SID+0x2
define	SID_voice_control	=	SID+0x4
define	SID_attack_decay	=	SID+0x5
define	SID_sustain_release	=	SID+0x6
define	SID_filter_freq		=	SID+0x15
define	SID_resonance		=	SID+0x17	; & filter flags
define	SID_volume_and_filter	=	SID+0x18	; filter type
define	SID_osc3_output		=	SID+0x1b
define	SID_env3_output		=	SID+0x1c

define	gate_bit	=	0b00000001
define	sync_bit	=	0b00000010
define	ring_bit	=	0b00000100
define	test_bit	=	0b00001000
define	triangle_wave	=	0b00010000
define	sawtooth_wave	=	0b00100000
define	pulse_wave	=	0b01000000
define	noise_wave	=	0b10000000

define	filter_voice1	=	0b00000001
define	filter_voice2	=	0b00000010
define	filter_voice3	=	0b00000100

define	low_pass	=	0b00010000
define	band_pass	=	0b00100000
define	high_pass	=	0b01000000
define	voice3_off	=	0b10000000

sound_effect_number:	byte	-1,-1,-1,-1,-1,-1,-1

; ***	end registers

temp_y:			byte	0

que_sound_effect::
	sta	x[sound_effect_number]
	sta	x[sfx_number]			; save for posterity
	rts

maintain_sounds::
	lda	moving_memory
	if (!zero) {
	    lda	save_block_type
	    cmp	#type_sound
	    if (equal) {
		rts			; memory is not safe, DO NOT PLAY
	    }
	}

	bank_IO_out			; will bank in when needed

	ldx	#6			; are there any sounds to start?
	do {
	    lda	x[sound_effect_number]
	    cmp	#0xff
	    if (!equal) {
		jsr	start_sound_effect
	    }
	    dex
	} while (plus)

	lda	sfx_voices_active	; are there any ACTIVE sounds?
	if (zero) {
	    jmp	sfx_exit
	}

	ldx	#6			; OK, update the active sounds
	do {
	    lda	sfx_voices_active
	    and	x[voice_bit]
	    if (!zero) {
		jsr	update_ramps
		ldx	voice
	    }
	    dex
	} while (plus)

	ldx	#6			; Now gate voices
	do {
	    stx	voice
	    lda	sfx_voices_active
	    and	x[voice_bit]
	    if (!zero) {
		jsr	set_voice_control
	    }
	    ldx	voice
	    dex
	} while (plus)
sfx_exit:
	bank_IO_in			; this is how it comes in
	rts

start_sound_effect:				; A = effect #
	tay					; X = voice
	moveb	#0xff,x[sound_effect_number]	; clear voice que
	lda	#0
	sta	x[loop_count]

chain_sound_effect:				; alternate entry point

	lda	#0xff
	cpx	#filter_voice
	if (plus) {
		lda	#0
	}
	sta	voice_flag		; set voice flag
	stx	voice

	lda	y[sound_table_lo]
	sta	sfx_sound
	lda	y[sound_table_hi]
	sta	sfx_sound+1

	lda	#BLOCK_data_offset
	sta	x[sfx_address_lo]
	lda	#0
	sta	x[sfx_address_hi]

	ldy	#0xff

init_voice_exit:
	jsr	ready_next_ramp
	lda	sfx_voices_active
	ora	x[voice_bit]
	sta	sfx_voices_active
	jsr	next_ramp
	rts

configure_filter_stuff:
	lda	y[@sfx_sound]		; resonance
	ora	resonance_and_flags
	tax
	stx	resonance_and_flags

	iny
	lda	y[@sfx_sound]		; volume & filter type
	pha
	sta	volume_and_filter

	bank_IO_in
	stx	SID_resonance
	pla
	sta	SID_volume_and_filter
	bank_IO_out
	rts

ready_next_ramp:
	ldx	voice
	iny
	tya
	clc
	adc	x[sfx_address_lo]
	sta	x[sfx_address_lo]
	if (carry) {
	    inc	x[sfx_address_hi]
	}
	rts

update_ramps:
	lda	#0xff
	cpx	#filter_voice
	if (plus) {
		lda	#0
	}
	sta	voice_flag		; 0 if not voice 0-2

	stx	voice
	lda	x[duration_lo]
	sec
	sbc	#1
	sta	x[duration_lo]
	if (!carry) {
	    lda	x[duration_hi]
	    sbc	#0
	    sta	x[duration_hi]
	    if (!carry) {
		jsr	next_ramp		; duration over! next please!
		jmp	update_ramps_exit
	    }
	}

	lda	x[freq_lo]			; add ramp inc to freq
	clc
	adc	x[ramp_increment_lo]
	sta	x[freq_lo]
	lda	x[freq_hi]
	adc	x[ramp_increment_hi]
	sta	x[freq_hi]

update_ramps_exit:
	jsr	change_voice			; move to the registers
	rts

zap_duration:				; for immediate frequency and
	moveb	#0,x[duration_lo]	; commands that don't specify
	sta	x[duration_hi]		; a ramp
	sta	x[ramp_increment_lo]
	sta	x[ramp_increment_hi]
	rts

next_ramp:
	ldx	voice
	lda	x[sfx_number]
	tay
	lda	x[sfx_address_lo]
	clc
	adc	y[sound_table_lo]
	sta	sfx_sound
	lda	y[sound_table_hi]
	if (zero) {
	    ldx	voice
	    jmp	terminate_voice
	}
	adc	x[sfx_address_hi]
	sta	sfx_sound+1

	ldy	#0
	lda	y[@sfx_sound]			; command byte
	sta	x[voice_command]
	sta	new_command
	sta	now_flag

	bit	voice_flag
	lsr	new_command			; check gate bit (1)
	if (overflow) {				; voices only
		lda	x[voice_control]
		if (carry) {
		    ora	#gate_bit
		} else {
		    and	#~(gate_bit)
		}
		sta	x[voice_control]	; gate bit set properly
	}

	lsr	new_command			; check for end effect (2)
	if (carry) {
	    jsr	terminate_voice
	    ldy	#1
	    lda	y[@sfx_sound]			; link to sound #
	    if (!zero) {
		tay
	    	jmp	chain_sound_effect
	    }
	    rts
	}

	lsr	new_command		; new freq ramp (4)
	bit	now_flag		; set overflow bit if SHORT version
	if (carry) {			; set new freq ramp
	    iny
	    lda	y[@sfx_sound]
	    sta	x[freq_lo]
	    iny
	    lda	y[@sfx_sound]
	    sta	x[freq_hi]
	    if (!overflow) {		; this IS a ramp
		iny
		lda	y[@sfx_sound]
		sta	x[duration_lo]
		iny
		lda	y[@sfx_sound]
		sta	x[duration_hi]
		iny
		lda	y[@sfx_sound]
		sta	x[ramp_increment_lo]
		iny
		lda	y[@sfx_sound]
		sta	x[ramp_increment_hi]
	    } else {
	    	jsr	zap_duration
	    }
	} else {
	    jsr	zap_duration
	}

	bit	voice_flag
	lsr	new_command		; adsr change (8)
	if (overflow) {			; voices only
		if (carry) {
		    sty	temp_y
		    lda	x[voice_control]
		    and	#~(gate_bit)
		    sta	x[voice_control]
		    jsr	set_voice_control	; start release
	
		    ldy	temp_y
		    ldx	voice
		    iny
		    lda	y[@sfx_sound]
		    sta	x[attack_decay]
		    iny
		    lda	y[@sfx_sound]
		    sta	x[sustain_release]
		    lda	x[voice_command]
		    and #gate_bit
		    ora x[voice_control]
		    sta	x[voice_control]	; set up gate
		}
	}

	lsr	new_command		; command avail (16)
	if (carry) {
	    iny
	    lda	y[@sfx_sound]		; get extended command
	    sta	extend_command
	    
	    bit	voice_flag		; overflow if voice
	    lsr	extend_command		; set pulse width if voice (1)
	    if (overflow) {
		if (carry) {
		    iny

		    lda	x[voice_offset+4]	; into pulse territory
		    tax			; get offset for PW
		    lda	y[@sfx_sound]	; get new freq lo
		    pha
		    bank_IO_in
		    pla
		    sta	x[SID_freq]	; throw at SID
		    bank_IO_out

		    iny
		    lda	y[@sfx_sound]
		    pha
		    bank_IO_in
		    pla
		    sta	x[SID_freq+1]
		    bank_IO_out
		    ldx	voice
		}
	    }
	    
	    lsr	extend_command		; set filter freq (2)
	    if (carry) {
		iny
		jsr	configure_filter_stuff

		iny
		lda	y[@sfx_sound]	; get new freq lo
		tax
		bank_IO_in
		stx	SID_filter_freq
		bank_IO_out

		iny
		lda	y[@sfx_sound]
		tax
		bank_IO_in
	    	stx	SID_filter_freq+1
		bank_IO_out
	    }
	    
	    lsr	extend_command		; set duration only (4)
	    if	(carry)	{
		jsr	zap_duration	; kill ramp
		iny
		lda	y[@sfx_sound]	; get duration lo
		sta	x[duration_lo]
		iny
		lda	y[@sfx_sound]	; get duration hi
		sta	x[duration_hi]
	    }
	}

	lsr	new_command		; change waveform (32)
	if (carry) {
	    lda	x[voice_control]
	    and	#0x0f
	    iny
	    ora	y[@sfx_sound]
	    sta	x[voice_control]
	}


	lsr	new_command			; now_flag (64)

	lsr	new_command			; loopback (128)
	if (carry) {
	    lda	x[loop_count]			; loop in progress?
	    cmp	#1
	    if (equal) {
	    	dec	x[loop_count]
		iny
		iny				; loop finished, skip 2
		jsr	ready_next_ramp
	    } else {
		iny
		lda	x[sfx_address_lo]
		sec
		sbc	y[@sfx_sound]
		sta	x[sfx_address_lo]
		if (!carry) {
		    dec	x[sfx_address_hi]	; move pointer back
		}
		iny
		lda	x[loop_count]
		if (zero) {
		    lda	y[@sfx_sound]
		    sta	x[loop_count]		; new, start loop
		} else {
		    dec	x[loop_count]		; continue loop
		}
	    }
	    jmp	next_ramp			; pick up back aways
	}		

	jsr	ready_next_ramp			; save y reg & stuff
	rts

change_voice:
	bank_IO_in
	lda	x[voice_offset]
	tay
	moveb	x[freq_lo],		y[SID_freq]
	moveb	x[freq_hi],		y[SID_freq+1]
	cpx	#filter_voice
	if (minus) {
	    moveb	x[attack_decay],	y[SID_attack_decay]
	    moveb	x[sustain_release],	y[SID_sustain_release]
	}
	bank_IO_out
	rts

set_voice_control:
	bank_IO_in
	cpx	#filter_voice
	if (minus) {
	    lda	x[voice_offset]
	    tay
	    lda	x[voice_control]
	    sta	y[SID_voice_control]
	}
	bank_IO_out
	rts

terminate_voice:
	    jsr	set_voice_control		; terminate sound if desired
	    lda	sfx_voices_active
	    and	x[voice_bit_mask]
	    sta	sfx_voices_active
	    cpx	#filter_voice
	    if (lt) {				; terminate approp pw
	        clearb	x[sound_started]
		txa
		pha
		inx
		inx
		inx
		inx
		lda	sfx_voices_active
		and	x[voice_bit_mask]
		sta	sfx_voices_active
		pla
		tax
	    }
	rts

voice_offset:
	byte	0,7,14,21,2,9,16
voice_bit::
	byte	1,2,4,8,16,32,64
voice_bit_mask:
	byte	~1,~2,~4,~8,~16,~32,~64

