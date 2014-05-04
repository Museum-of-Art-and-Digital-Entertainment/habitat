

define	p	=	0xfb
define	cc	=	0xfd		; used only to save program

file_name:	byte	"MCM"
mif (isDefined (Q3)) {
    		byte	"G"
end_file_name:
} melse {
end_file_name:
		byte	"G"
}
save_file::				;this routine deletes the old file
					;and saves the new file
	sei
	moveb	#0x7,		0	; set	mem mask
	moveb	#0x6,		1	; set	mem
	movew	#0xea31,	0x0314	; irq
	movew	#0xfe47,	0x0318	; nmi
	cli

;	jsr	ioinit
	jsr	delete

	moveb	#0x7,		0	; set	mem mask
	moveb	#0x6,		1	; set	mem

	lda	#8
	ldx	#8
	ldy	#255
	jsr	setlfs

file_name_length:
	lda	#(end_file_name - file_name)
	ldx	#/file_name
	ldy	#?file_name
	jsr	setnam			; set file name

	movew	#begin+6,p			;start address
	lda	#p
	ldx	#/end_of_everything		;end	adress
	ldy	#?end_of_everything
	jsr	0xffd8

	inc	border_color
hello:
	jmp	hello

delete:
	lda	#0		;we do not need a name
	jsr	setnam
	lda	#15		;channel #8
	ldx	#8		;device #8 drive
	tay
	jsr	setlfs		
	jsr	open
	ldx	#15		;channel #15 use as output
	jsr	chkout

	lda	#'S'		;send drive a user execute 3 command
	jsr	chrout		;this executes at 0x500
	lda	#':'
	jsr	chrout
	clearb	cc
	do {
	    ldy	cc
	    lda	y[file_name]
	    jsr	chrout
	    inc	cc
	    lda	cc
file_name_length2:
	    cmp	#(end_file_name-file_name)
	} while (!equal)
	lda	#0x0d
	jsr	chrout

	jsr	clrchn
	lda	#15
	jsr	close
	rts



