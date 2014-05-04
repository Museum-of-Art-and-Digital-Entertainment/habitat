rs232_timeout_counter:		byte	0
rs232_save_rcv_buffer_end:	byte	0

rs232_NMI::
	lda	data_port_b
	and	#0x01
	sta	rs232_input_bit

	lda	hold_interrupt
	and	rs232_enable		;  1/xmit 2/rcv 16/wait
	tax
	and	#0x10
	if (!zero) {			; EDGE! set up stuff fast!

		lda	rs232_half_time+1
		sta	timer_b+1

		lda	rs232_half_time
		sta	timer_b

		lda	#0b00010001
		sta	NMI_timer_b

		lda	rs232_timing
		sta	timer_b
		lda	rs232_timing+1
		sta	timer_b+1

		txa
		ora	NMI_interrupt
		and	rs232_enable
		tax

		lda	rs232_enable
		and	#0xef
		ora	#0x82
		sta	rs232_enable
	
		lda	#8
		sta	rs232_input_bit_count
	}
	txa
	and	#0x01
	if (!zero) {
	    lda	data_port_a
	    and	#0b11111011		;fb
	    ora	rs232_output_bit
	    sta	data_port_a		; send the bit
;lda rs232_output_bit
;jsr junky

	    lda	rs232_output_bit_count	; QL
	    if (!zero) {
		dec	rs232_output_bit_count
		if (!zero) {
		    lsr	rs232_output_byte
		    if (!carry) {
			lda	#0
			beq	rs232_store_bit
		    }
		}
		lda	#0x04
rs232_store_bit::
		sta	rs232_output_bit
	    } else {
		sta	rs232_output_bit
		lda	#0x09
		sta	rs232_output_bit_count
		ldy	rs232_send_buffer_start
		cpy	rs232_send_buffer_end		; finished?
		if (equal) {
		    moveb	#0x10, NMI_timer_a
		    lda	rs232_enable
		    and	#0xfe
		    ora	#0x80
		    sta	rs232_enable
		} else {
;lda #0xff
;jsr junky
		    lda	y[@rs232_output_buffer]
		    sta	rs232_output_byte
;jsr junky
		    inc	rs232_send_buffer_start
		}
	    }
	}

	txa
	and	#0x02
	beq	rs232_exit
	ldx	rs232_start_bit_flag
	if (equal) {
		lsr	rs232_input_bit
		ror	rs232_input_byte
		dec	rs232_input_bit_count
		bne	rs232_exit
		ldy	rs232_rcv_buffer_end		; have a full byte!
		iny
		cpy	rs232_rcv_buffer_start
		if (!equal) {
			sty	rs232_rcv_buffer_end
			dey
			lda	rs232_input_byte
			sta	y[@rs232_input_buffer]
		} else {
			lda	#0x04
			ora	rs232_status
			sta	rs232_status
		}
	} else {
	    lda	rs232_input_bit
	    if (zero) {
		sta	rs232_start_bit_flag
		beq	rs232_exit
	    }
	}
	lda	#0x02
	sta	NMI_interrupt

	lda	rs232_enable
	and	#0xfd
	ora	#0x90
	sta	rs232_enable

	sta	rs232_start_bit_flag
rs232_exit::
	lda	rs232_enable
	sta	NMI_interrupt

	jmp	standard_interrupt_exit

;rs232_get::
;	ldy	rs232_rcv_buffer_start
;	cpy	rs232_rcv_buffer_end
;	if (!equal) {
;	    lda	y[@rs232_input_buffer]
;	    inc	rs232_rcv_buffer_start
;	    sec
;	    rts
;	}
;	clc
;	rts


rs232_put::
	lda	rs232_enable
	lsr	a
	if (!carry) {
;		lda	#0b00010000
;		sta	NMI_timer_a
		sei
		lda	#0x7f
		sta	NMI_interrupt			; prevent interfere
		dec	rs232_transmitting
		lda	#0
		sta	rs232_output_bit
		ldx	#9
		stx	rs232_output_bit_count

		ldy	rs232_send_buffer_start
		lda	y[@rs232_output_buffer]
		sta	rs232_output_byte
		inc	rs232_send_buffer_start

		lda	#0b10000001
		ora	rs232_enable
		sta	rs232_enable

		lda	#0b00010001
		sta	NMI_timer_a
		lda	rs232_enable
		sta	NMI_interrupt
		cli
	}
	rts


rs232_init_port::
		sta	NMI_interrupt
		eor	rs232_enable
		ora	#0b10000000
		sta	rs232_enable
		sta	NMI_interrupt
		rts

;junky:
;pha
;inc16 junky2+1
;pla
;junky2::
;sta	0xdfff
;rts
rs232_transmitting::		byte	0
