;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;+									     +
;+		    "OUR VERY OWN" INTERUPTABLE DISK			     +
;+				FILE FORMAT				     +
;+			       OVOID  LOADER				     +
;+			Lucasfilm Ltd. Proprietary			     +
;+			      Mar 25, 1985				     +
;+			     By Fuzzy Furry				     +
;+		       version 1.0  write sector			     +
;+		       version 1.0  read sector				     +
;+									     +
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

macro	send_to_disk	val {
    ldy	#val
    jsr	send_disk_bits
}

;----------------------------------------------------------------------
;	X = track     Y = sector
;	address of data to be = save_address
;----------------------------------------------------------------------
save_sector::
	stx	host_name_a		;save the file name
	sty	host_name_b
	movew   buffer_pointer,save_lda+1

	lda	#0x40			;save sector
	jsr	send_command

	jsr	wait_ready		;are we ready to boogy

	ldx	#0
	do	{
		bank_IO_out_y
save_lda:
		lda	x[0x4000]
		bank_IO_in_y
		jsr	host_send_byte
		inx
	} until (zero)
	rts


;----------------------------------------------------------------------
disk_quit::
	lda	#0x20			;quit
	jsr	send_command
	rts	

;----------------------------------------------------------------------
;	X = track     Y = sector
;	address of data to be = load_address
;----------------------------------------------------------------------
load_sector::
	stx	host_name_a		;save the file name
	sty	host_name_b
	movew   buffer_pointer,load_loop_a+1

	lda	#0x30			;load sector
	jsr	send_command
	jsr	wait_ready		;are we ready to boogy
	ldx	#0
	jmp	load_loop

load_file::				;send the load command
;
;	put the first two characters of the file name
;	in the X and Y registers, and put the address
;	to stuff the file contents to  load_address
;
	stx	host_name_a		;save the file name
	sty	host_name_b

	lda	#0x10			;load
	jsr	send_command
	jsr	wait_ready		;are we ready to boogy

	jsr	host_o_o_read_byte		;low byte address of file
	jsr	host_o_o_read_byte		;high byte address of file

	ldx	#0
	movew	load_address, load_loop_a+1	; self modifying code
	
load_loop:
	jsr	host_o_o_read_byte

	cmp	#0x01			;check for command from drive
	bne	load_loop_a		;not one

	jsr	host_o_o_read_byte
	cmp	#0x01			;check again, a double byte means
	beq	load_loop_a		;valid data

	cmp	#0x81			;done loading
	beq	load_loop_b

	cmp	#0x11			;error
	beq	load_loop_c

	cmp	#0x21			;done loading sector (ff_file)
	bne	serious_disk_error	;should never get one

	jsr	wait_ready
	jmp	load_loop		;wait for next sector

load_loop_a:					;store the data
	sta	x[0xffff]			;self modified code
	inx
	if	(zero) {
		inc	load_loop_a+2		;modify the code
	}
	jmp	load_loop			;return to main loop

load_loop_c:			;set carry for error
	sec
	rts

load_loop_b:				;clear carry for valid load
	jsr	host_o_o_read_byte	;LRC comming!
	sta	disk_sector_LRC
	clc
	rts

serious_disk_error:
	inc	0xd020
	jmp	load_loop_c
	

;----------------------------------------------------------------------

send_command:
	pha

	send_to_disk	0b00100010		;clean up port
	
	jsr	wait_ready

	lda	host_name_a
	jsr	host_send_byte		;first letter filename
	lda	host_name_b
	jsr	host_send_byte		;second letter
	pla
	jsr	host_send_byte		;send command
	rts

wait_ready:
	ldy	#10				;wait a little
	do	{
		dey
	} until (zero)

	lda	#0b01000000			;wait for ready
	do	{
		bit	0xdd00
	} while (zero)

	send_to_disk	0b00001010		;drive atn low

	ldy	#6				;wait for drive
	do	{				;to run ahead a little
		dey
	} until (zero)
	rts

host_o_o_read_byte:
	jsr	host_read_bit		;000000XX
	jsr	host_read_bit		;0000XX00
	jsr	host_read_bit		;00XX0000
	jsr	host_read_bit		;XX000000
	lda	host_save_reg
	rts
	
host_read_bit:
	lda	0xdd00			;rol a bit in
	rol	a
	rol	host_save_reg

	send_to_disk	0b00011010	;drive clk high

;	tya
;	pha				;why do I do this ?
;	tya				;Just wasting time
;	pla
;	tya
		
	lda	0xdd00
	rol	a
	rol	host_save_reg

	send_to_disk	0b00001010	;drive clk low

;	tya
;	tay

	rts

host_send_byte:
	sta	host_save_reg
	jsr	host_send_bit		;000000XX
	jsr	host_send_bit		;0000XX00
	jsr	host_send_bit		;00XX0000
	jsr	host_send_bit		;XX000000
	rts

host_send_bit:
	ldy	#0b00011010			;set data low
	rol	host_save_reg			;rol a bit off
	if	(carry) {
		ldy	#0b00111010		;set data high
	}
	jsr	send_disk_bits			;drive clk high

;	txa
;	tya
;	txa
;	tay

	ldy	#0b00001010			;set data low
	rol	host_save_reg
	if	(carry) {
		ldy	#0b00101010		;set data high
	}
	jsr	send_disk_bits			;drive clk low

;	txa
;	tay

	rts

send_disk_bits:					; 1s in y reg will be sent
	sei
	moveb	#0x7f, NMI_interrupt		; shut off for a sec.
	sty	bits
	lda	0xdd00
	and	#0b00000100			; preserve rs232 status
	ora	bits
	sta	0xdd00
	moveb	rs232_enable, NMI_interrupt
	cli
	rts

bits:		byte	1
host_save_reg:	byte	1
host_name_a:	byte	'E'			;block	1
host_name_b:	byte	'I'			;block	1





