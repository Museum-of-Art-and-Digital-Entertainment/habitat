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
;;define save_x           =       0xfa
;;define save_y           =       0xfb

define	dest_addr	=	0xfc		; WARNING uses ZPAGE!!!
define	source_addr	=	0xfe

;;define	ioinit	=	0xff84
;;define	setlfs	=	0xffba
;;define	setnam	=	0xffbd
define	fopen	=	0xffc0
;;define	chkout	=	0xffc9
;;define	chrout	=	0xffd2
;;define	clrchn	=	0xffcc
;;define	close	=	0xffc3

init_disk::
	moveb	#0x7,		0	; set	mem mask
	moveb	#0x6,		1	; set	mem
	sei
	movew	#0xea31,	0x0314	; irq
	movew	#0xea31,	0x0316	; brk
	movew	#0xfe47,	0x0318	; nmi
	lda	#0xff
	sta	0xdd0d
;	lda	#0
	lda	0xdd03
	and	#32			; save online bit
	sta	0xdd03
	lda	#0x7
	sta	0xdd00
	lda	#0x3f
	sta	0xdd02

	jsr	INIT_THE_DISK

	movew	#start_source,	source_addr
	movew	#start_dest,	dest_addr

	ldx	#16				;send	# of blocks
	do	{	
		stx	save_x
		jsr	memory_write		;fopen to send
		do	{
			sty	save_y
			lda	y[@source_addr]
			jsr	chrout
			ldy	save_y
			iny
			cpy	#32
		} until (zero)
		lda	#0x0d
		jsr	chrout			;close send
		jsr	close_chan

		jsr	update_locations	;inc our addresses
		ldx	save_x
		dex
	} until (zero)

	jsr	memory_execute			;you know
	jmp	host_init

fopen_chan::
	lda	#0		;we do not need a name
	jsr	setnam
	lda	#15		;channel #8
	ldx	#8		;device #8 drive
	tay
	jsr	setlfs		
	jsr	fopen
	ldx	#15		;channel #15 use as output
	jmp	chkout

memory_execute:
	jsr	fopen_chan
	lda	#'U'		;send drive a user execute 3 command
	jsr	chrout		;this executes at 0x500
	lda	#'3'
	jsr	chrout
	lda	#0x0d
	jsr	chrout
	jmp	close_chan

memory_write:
	jsr	fopen_chan

	lda	#'M'
	jsr	chrout
	lda	#'-'
	jsr	chrout
	lda	#'W'
	jsr	chrout
	lda	dest_addr
	jsr	chrout
	lda	dest_addr+1
	jsr	chrout
	lda	#32			;max number of bytes = 42
	jsr	chrout			;incase you are wondering
	ldy	#0
	rts

INIT_THE_DISK::
	jsr	fopen_chan
	lda	#'I'
	jsr	chrout
	lda	#'0'
	jsr	chrout
	lda	#0x0d
	jsr	chrout			;incase you are wondering
	jmp	close_chan

update_locations:
	lda	source_addr		;modify the source by 32
	clc
	adc	#32
	sta	source_addr
	lda	source_addr+1
	adc	#0
	sta	source_addr+1

	lda	dest_addr		;modify the dest. by 32
	clc
	adc	#32
	sta	dest_addr
	lda	dest_addr+1
	adc	#0
	sta	dest_addr+1
	rts

close_chan:
	jsr	clrchn
	lda	#15
	jmp	close

host_init:
	lda	0xdd02
	and	#0b00000011
	ora	#0b00111100		;drive atn high
	sta	0xdd02			;send a sync byte

	lda	0xdd00
	and	#0b00000011
	ora	#0b00001100
	sta	0xdd00

	ldx	#128+64
	ldy	#0

	do	{
		do	{
			dey
		} until (zero)
		dex
	} until (zero)

	sei
	rts

start_source:

	target	0x500
define disk_track	=	0x0e
define disk_sector	=	0x0f
define save_reg	        =	0x06
define name_a	        =	0x07
define name_b	        =	0x08
define xtra	        =	0x10
define seeked	        =	0x11
define job	        =	0x09
define retry            =       0x0a

start_dest:
	jsr	slave_init

wait_for_command:

	jsr	get_command
	
	cpy	#0x20				;QUIT
	if	(zero)	{
		jmp 0xeaa0			;drives cold start
	}

	cpy	#0x30
	if	(zero)	{
		jmp	slave_load_sector
	}

	cpy	#0x40
	if	(zero)	{
		jmp	slave_save_sector
	}

slave_error:
	lda	#0b00000000		;send_ready
	sta	0x1800
	lda	#0x01
	jsr	send_byte		;command
	lda	#0x11
	jsr	send_byte		;error
	jmp	wait_for_command

;slave_test:
;	lda	#0b00000000		;send_ready
;	sta	0x1800
;	lda	#0x01
;	jsr	send_byte		;command
;	lda	#0x30
;	jsr	send_byte		;test
;	jmp	wait_for_command

found_file:
	lda	x[0x701]
	sta	disk_track
	lda	x[0x702]
	sta	disk_sector


ff_loop:

	jsr	run_job

	ldx	#-1
	lda	0x701
	sta	disk_sector			;for later use
	lda	0x700
	sta	disk_track
	if	(zero)	{
		ldx	0x701		;incase short sector
	}
	inx
	stx	xtra			;set block to send size

	ldx	#2
	jsr	send_data

	lda	0x700
	if	(!zero)	{
		lda	#0x01		;command
		jsr	send_byte
		lda	#0x20		;block still coming
		jsr	send_byte

		ldx	#0b00001000	;send busy
		stx	0x1800
		jmp	ff_loop		;we are not done yet
	}

	lda	#0x01			;command
	jsr	send_byte
	lda	#0x81			;we are done
	jsr	send_byte
	ldx	#0b00001000	;send busy
	stx	0x1800
	jmp	wait_for_command

run_job:
        ldx job
        lda #0x03			    ; 4 retries
        sta retry

run_4:
        ldy #50
        sty seeked
	
run_0:
        cli                                 ; turn on drive code
        stx 0x04
        do {
	    lda 0x04
	} until (!minus)
	cmp #0x01
	if (!equal) {
            dec seeked
	    ldy seeked
	    bmi run_4
            cpy #2
	    if (equal) {
                dec retry
		if (minus) {
                    sei                     ; turn off drive code
                    jmp slave_error
                }
		lda #0xc0
                sta 0x04
	    }
	    lda 0x16
	    sta 0x12
	    lda 0x17
	    sta 0x13
	    do {
	        lda 0x04
	    } until (!minus)
	    bpl run_0
	}
        sei                                 ; turn off drive code
        rts

;run_job:
;	lda	#5
;	sta	seeked
; 
;run_job_sub:
;	cli			;turn on drive code
;	lda	job		;job command
;	sta	0x0004		;this is our job que
;	do	{
;		lda	0x0004		;are we done yet
;	} until (positive)
; 
;	cmp	#0x01			;is everything OK
;	if	(zero) {
;		sei			;turn off drive code
;		rts
;	}
; 
;	lda	seeked			;is everything OK
;	if	(plus) {		;we had a WHOOPS ! go trk 0
;;               lda 0x16
;;		sta 0x12
;;		lda 0x17
;;		sta 0x13
;		lda	#0xb0		;BUMP
;		sta	0x0004		;this is our job que
;		do	{
;			lda	0x0004		;are we done yet
;		} until (positive)
;		dec	seeked
;		jmp	run_job_sub
;	}
;	sei				;error
;	jmp	slave_error

slave_save_sector:
	lda	#0x90			;write sector
	sta	job
	lda	name_a
	sta	disk_track
	lda	name_b
	sta	disk_sector

	ldx	#0

	lda	#0b00000000
	sta	0x1800			;send ready

	do	{
		stx	xtra
		jsr	a_read_byte	;yes send another
		ldx	xtra
		sta	x[0x700]
		inx
	} until (zero)

	ldx	#0b00001000	;send busy
	stx	0x1800

	ldx	#0
	jsr	run_job
	jmp	wait_for_command

slave_load_sector:
	lda	#0x80			;read sector
	sta	job
	lda	name_a			;get track
	sta	disk_track
	lda	name_b			;get sector
	sta	disk_sector
	jsr	run_job

	ldx	#0			;start sending from 0x00 of block
	stx	xtra
	jsr	send_data

	lda	#0x01			;command
	jsr	send_byte
	lda	#0x81			;we are done
	jsr	send_byte
	ldx	#0b00001000	;send busy
	stx	0x1800
	jmp	wait_for_command

send_data:
	lda	#0b00000000
	sta	0x1800			;send ready

	do	{
		lda	x[0x700]
		cmp	#0x01			;is it real
		if	(zero)	{
			jsr	send_byte	;yes send another
			lda	#0x01
		}
		jsr	send_byte
		inx
		cpx	xtra
	} until (zero)
	rts

get_command:
	lda	#0b00001000		;we are busy
	sta	0x1800

	cli				;let drive code run

	lda	0x1c00			;turn off motor,led
	and	#0b11110011
	sta	0x1c00

	lda	#0b00000001		;wait for ready from host
	do	{
		bit	0x1800
	} while (zero)

	sei				;stop drive code

	lda	#0b00000000		;send a ready
	sta	0x1800

	jsr	a_read_byte		;name   a
	sta	name_a
	jsr	a_read_byte		;name   b
	sta	name_b
	jsr	a_read_byte		;command
	tay
	
	lda	#0b00001000		;we are busy
	sta	0x1800

	lda	0x1c00			;turn on motor,led
	ora	#0b00001100
	sta	0x1c00
	rts

slave_init:
	sei
	ldx	#8
	do	{
		lda	#0b00000000		;tell the C64 that all
		sta	0x1800			;is OK
		do	{
			dey
		} until (zero)

		lda	#0b00010000
		sta	0x1800
		do	{
			dey
		} until (zero)
		dex
	} until (zero)

	lda	#0b00001010			;send sync byte
	sta	0x1802

	do	{				;wait for sync
		lda	0x1800
		and	#0b00000111
	} until (zero)
	rts

send_byte:
	sta	save_reg

	lda	#0b00000100
	jsr	send_bit
	jsr	send_bit
	jsr	send_bit

send_bit:
	ldy	#0b00000010		;set data high
	rol	save_reg
	if	(carry) {
		ldy	#0b00000000		;set data low
	}

	do	{
		bit	0x1800			;wait for clk to go low
	} until	(zero)
	sty	0x1800

	ldy	#0b00000010		;set data high
	rol	save_reg
	if	(carry) {
		ldy	#0b00000000			;set data low
	}

	do	{
		bit	0x1800			;wait for clk to go high
	} until	(!zero)
	sty	0x1800

	rts

a_read_byte:
	ldx	#4
	ldy	#4

read_bit:
	do	{
		tya
		do	{
			bit	0x1800		;wait for clk to go low
		} until	(!zero)
		lda	0x1800
		ror	a
		rol	save_reg

		tya
		do	{
			bit	0x1800		;wait for clk to go high
		} until	(zero)
		lda	0x1800
		ror	a
		rol	save_reg
		dex
	} until (zero)
	lda	save_reg
	rts

end_dest:

        rel
end_source:





