;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;++									   ++
;++		   CRUMMYDORK DEVELOPEMENT SYSTEM	[CDS]		   ++
;++			   SLAVE COMMUNICATIONS				   ++
;++			Included communications program			   ++
;++			Lucasfilm Ltd. Proprietary			   ++
;++			    	  2/18/86				   ++
;++				Kevin Fuzzy				   ++
;++				Ron Gilbert				   ++
;++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

macro		c_ack_low {
			lda	0xdd00
			and	#0b11111011
			ldy	0xdd0d
			sta	0xdd00
		}
macro		c_ack_high {
			lda	0xdd00
			ora	#0b00000100
			ldy	0xdd0d
			sta	0xdd00
		}
macro		c_wait_ack {
			lda	#0x10
			do	{
				bit	0xdd0d
			} while	(zero)
		}

mif (debug_mode) {

define c_pointer = 0x02
define c_num	 = 0x02
define a_hold	 = 0x04
define x_hold	 = 0x05
define y_hold	 = 0x06
define s_hold	 = 0x07
define p_hold	 = 0x08
define PCH_hold	 = 0x09
define PCL_hold	 = 0x0A
define PCH_shadow= 0x0B
define PCL_shadow= 0x0C
define halt_flag = 0x0D
define c_jmp_address = 0x0E

com_init::
	lda	#0b00111111
	sta	0xdd02			; get ready for output

	lda	#0b10001110
	sta	0xdd00			; set ack high

	moveb	#0b00000000,	0xdd03	;lets set up for input
 	moveb	#0b01111111,	0xdd0d	;kill all NMI ints
 	moveb	#0b10010000,	0xdd0d	;enable FLAG NMI int

	moveb	#0,halt_flag
	movew	#c_nmi_continue,c_jmp_address

	rts

c_NMI::					; no dammage done
	sta	a_hold
	stx	x_hold
	sty	y_hold
	pla
 	sta	p_hold
	pla
	sta 	PCL_hold
	pla
	sta	PCH_hold
	tsx
	stx	s_hold

	lda	IO_reg
	sta	NMI_save_IO
	bank_IO_in

	lda	hold_interrupt

	lda	#0b01111111		; turn off ints
	sta	0xdd0d

	lda	halt_flag
	if (zero) {			; we are halted
	    lda  PCL_hold
	    sta  PCL_shadow
	    lda  PCH_hold
	    sta  PCH_shadow				
	}

c_NMI_LOOP:
;	ldx	fastlink_on
;	cpx	#0xff
;	if (equal) {
;	    dec	fastlink_on
;	    ldx	#0x1b
;	} else {
	    ldx	0xdd01			;read_byte
;	}
;	stx	0xd020

cont_NMI_loop:
	c_ack_low
	c_wait_ack
	moveb	#-1,	0xdd03		;output

	c_ack_high
	c_wait_ack
	stx	0xdd01			;send byte

	c_ack_low
	c_wait_ack
	moveb	#0x55,	0xdd01		;clear data on port #55
	moveb	#0,	0xdd03		;input

	c_ack_high

	cpx	#0x1b			;check for command
	if	(zero) {
		jsr	c_read_write_byte		;get data byte
		cpx	#0x1b
		if	(!zero) {		;is a command byte
			lda	x[command_lo]
			sta	c_jmp_address
			lda	x[command_hi]
			sta	c_jmp_address+1
			jmp	c_nmi_continue
		}
	}

	jmp	@c_jmp_address		;self modifing code

c_nmi_continue:
	c_wait_ack			;check for next byte
	jmp	c_nmi_loop		;continue on 

c_read_write_byte:
	c_wait_ack

	ldx	0xdd01			;read_byte
;	stx	0xd020

	c_ack_low
	c_wait_ack
	moveb	#-1,	0xdd03		;output

	c_ack_high
	c_wait_ack
	stx	0xdd01			;send byte

	c_ack_low
	c_wait_ack
	moveb	#0x55,	0xdd01		;clear data on port
	moveb	#0,	0xdd03		;input

	c_ack_high
	rts

c_load:
	c_wait_ack

	ldx	0xdd01			;read_byte
;	stx	0xd020
	if (!zero) {			; is it a NULL
	    jmp cont_NMI_loop
	}

	c_ack_low
	c_wait_ack
	moveb	#-1,	0xdd03		;output

	c_ack_high
	c_wait_ack

	Bank_IO_out
	ldy #0x00
	lda y[@c_pointer]
	inc c_pointer
	if (zero) {
	    inc c_pointer+1
	}
	pha
	Bank_IO_in
	pla
	sta	0xdd01			;send data byte

	c_ack_low
	c_wait_ack
	moveb	#0x55,	0xdd01		;clear data on port
	moveb	#0,	0xdd03		;input

	c_ack_high
	jmp c_load

c_store:
	bank_io_out
	txa
	ldy	#0
	sta	y[@c_pointer]
	bank_io_in

	lda	c_pointer
	clc
	adc	#1
	sta	c_pointer
	if	(carry) {
		inc	c_pointer+1
	}
	jmp	c_nmi_continue

c_low_address:
	stx	c_pointer
	jmp	c_nmi_continue

c_high_address:
	stx	c_pointer+1
 	jmp	c_nmi_continue

c_halt_main:
	lda halt_flag
	if (!zero) {			; allready halted
	    jmp c_nmi_continue
	}
	moveb #1,halt_flag
	lda #/halt_trap
	sta PCL_hold
	lda #?halt_trap
	sta PCH_hold
	jmp c_NMI_exit

c_halt_all:
	lda halt_flag
	if (!zero) {			; allready halted
	    jmp c_nmi_continue
	}
	moveb #1,halt_flag
 	lda #/halt_trap1
	sta PCL_hold
	lda #?halt_trap1
	sta PCH_hold
	jmp c_NMI_exit

c_halt_cont:
	lda halt_flag
	if (zero) {
	    jmp c_nmi_exit
	}
	moveb #0,halt_flag
	lda PCL_shadow
	sta PCL_hold
	lda PCH_shadow
	sta PCH_hold
	jmp c_nmi_exit

halt_trap1:
	sei
halt_trap:
	jmp halt_trap

c_jumpsub:
	ldx	s_hold
	txs
	lda	PCL_shadow
	sec
	sbc	#1
	lda	PCH_shadow
	sbc	#0
	pha
	lda	PCL_shadow
	sec
	sbc	#1
	pha
	tsx
	stx	s_hold
c_jump:
	lda c_pointer
	sta PCL_hold
	lda c_pointer+1
	sta PCH_hold
c_NMI_EXIT:
	moveb	#0b10010000,0xdd0d	;enable NMI FLAG int
	moveb	#0b00000000,0xdd03	;setup for input

	lda	NMI_save_IO
	sta	IO_reg			; IO restored

	ldx	s_hold
	txs				; restore stack
	lda 	PCH_hold		; push new hi
	pha
	lda	PCL_hold		; push new lo
	pha
	lda	p_hold			; restore flag
	pha				; push new flags


	ldx	x_hold
	ldy	y_hold
	lda	a_hold
	rti

command_lo:
	byte	/c_nmi_continue
	byte	/c_store
	byte	/c_low_address
	byte	/c_high_address
	byte	/c_jump
	byte	/c_load
	byte	/c_nmi_continue
	byte	/c_nmi_exit
	byte	/c_halt_main
	byte	/c_halt_all
	byte	/c_halt_cont
	byte	/c_jumpsub

command_hi:
	byte	?c_nmi_continue
	byte	?c_store
	byte	?c_low_address
	byte	?c_high_address
	byte	?c_jump
	byte	?c_load
	byte	?c_nmi_continue
	byte	?c_nmi_exit
	byte	?c_halt_main
	byte	?c_halt_all
	byte	?c_halt_cont
	byte	?c_jumpsub
end_data:
}


