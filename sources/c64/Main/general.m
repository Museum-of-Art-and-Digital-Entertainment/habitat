;	GENERAL SUBROUTINES


;****************************************
;	get address of object 'X'
;****************************************
get_object_address::
	lda	x[object_table_hi]			; x holds current obj
	sta	object_address+1
	lda	x[object_table_lo]
	sta	object_address
	rts

;****************************************
;	put addr of image 'Y' into prop_addr
;****************************************
get_image_address::

	movew	fred,prop_address
	inc	fred
	if (equal) {
		inc	fred+1
	}
;;	rts
	nop

	lda	#0
	jsr	GetImage
	stx	prop_address
	sty	prop_address+1

	lda	#block_data_offset
	bump	prop_address
	rts


fred:	word	0000


;****************************************
;	get class address for Object
;****************************************
get_class_address::
	ldy	#OBJECT_class_pointer
	lda	y[@object_address]
	tay
	lda	y[class_table_lo]
	sta	class_address
	lda	y[class_table_hi]
	sta	class_address+1
	rts


;****************************************
;
;	DoFill - Actual code called from Fill macro
;
;****************************************
DoFill::
	do  {
		do {
			dey
			sta	y[@temp_address]
		} while (!zero)

		dec	(temp_address+1) ; point to next page in destination
		dex			; count down in 256's
	} while (!negative)
	rts				; fill done


;****************************************
;	pass 'A' reg 0=night <>0 = day
;****************************************
change_player_color::
	inc	player_color
	ldx	player_color
set_player_color::
	bank_io_in					; get colors back
	txa
	ldy	#0
	do {
		sta	y[bitmap_colr]		; get pink back
		sta	y[bitmap_colr+256]
		sta	y[bitmap_colr+640-256]

		ldx	graphics_mode		; 6.3
		if (zero) {			; 0 bitmap 1 text
		    bit	light_level
		    if (minus) {
			sta	y[bitmap_text]
			sta	y[bitmap_text+256]
			sta	y[bitmap_text+640-256]
		    }
		} else {				; 6.3
		    sta	y[bitmap_colr-40]		; top line
		}

		dey
	} while (!equal)
	bank_io_out
	rts

player_color::	block	1


