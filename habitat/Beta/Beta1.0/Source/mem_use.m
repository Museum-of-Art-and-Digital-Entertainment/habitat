;****************************************
;	display memory used
;****************************************
define	mem_table	=	temp_var_2

display_mem_usage::
mif (0) {
	lda	give_memory
	if (zero) {
	    rts
	}
	clearb	mem_use
	sta	mem_use+1

	ldx	#0
	do {
		lda	x[class_table_ref]
		and	#0x3f
		if (!equal) {
			ldy	x[class_table_lo]
			lda	x[class_table_hi]
			jsr	mem_add
		}
		lda	x[image_table_ref]
		if (!equal) {
			ldy	x[image_table_lo]
			lda	x[image_table_hi]
			jsr	mem_add
		}
		lda	x[sound_table_ref]
		if (!equal) {
			ldy	x[sound_table_lo]
			lda	x[sound_table_hi]
			jsr	mem_add
		}
		lda	x[action_table_ref]
		if (!equal) {
			ldy	x[action_table_lo]
			lda	x[action_table_hi]
			jsr	mem_add
		}
		lda	x[object_table_hi]
		if (!equal) {
			ldy	x[object_table_lo]
			jsr	mem_add
		}
		dex
	} until (equal)
	movew	#mem_use, printf_parameters
	jsr	balloon_printf
	string	"#"
	rts

mem_add:
	sty	mem_table			; y passed low addr
	sta	mem_table+1			; a passed high addr

	ldy	#0
	lda	y[@mem_table]
	clc
	adc	mem_use
	sta	mem_use
	iny
	lda	y[@mem_table]
	adc	mem_use+1
	sta	mem_use+1
	rts
mem_use::		word	0
			word	0
} melse {
	rts
}

