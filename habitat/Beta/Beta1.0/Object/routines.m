Block_move::			; length from source to destination
	lda	length
	pha				; save length of last page
	ldx	length+1		; # pages to move
	do {
	    if (!zero) {
		moveb	#0, length	; move a complete page
	    } else {
		pla
		sta	length		; move the last page portion
		beq	blk_all_done
	    }
	    ldy	#0
	    do {
		lda	y[@source]
		sta	y[@destination]
		iny
		cpy	length
	    } while (!equal)
	    inc	source + 1
	    inc	destination + 1
	    dex
	} while (plus)
blk_all_done:
	rts

small_block_move::			; 'a' bytes for source to destination
	sta	length
	ldy	#0
	do {
	    lda	y[@source]
	    sta	y[@destination]
	    iny
	    cpy	length
	} while (!equal)
	rts

fGet_Object::
	lda y[Object_table_lo]
	tax
	lda y[Object_table_hi]
	rts
fGet_Action::
	lda y[Action_table_lo]
	tax
	lda y[Action_table_hi]
	rts
fGet_Image::
	lda y[Image_table_lo]
	tax
	lda y[Image_table_hi]
	rts
fGet_Sound::
	lda y[Sound_table_lo]
	tax
	lda y[Sound_table_hi]
	rts
fGet_Class::
	lda y[Class_table_lo]
	tax
	lda y[Class_table_hi]
	rts

read_into_cache::
    txa
    pha
    tya
    pha
    lda	hereis_flag
    if (zero) {
	ldx	directory_start
	ldy	directory_start+1
	lda	#0
	jsr	load_cache
	ldx	directory_start
	inx
	ldy	directory_start+1
	lda	#1
	jsr	load_cache
    }
    pla
    tay
    pla
    tax
    rts

