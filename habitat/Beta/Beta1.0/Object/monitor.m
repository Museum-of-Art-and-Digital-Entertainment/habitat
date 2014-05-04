monitor_memory::
	ldy	#15
	do {
	    lda	y[0xd000]
	    cmp	y[d000_space]
	    sta	y[d000_space]
	    if (!equal) {
		jsr	mem_hit
	    }
	    lda	y[0xdc00]
	    cmp	y[dc00_space]
	    sta	y[dc00_space]
	    if (!equal) {
		jsr	mem_hit
	    }
	    lda	y[0xdd00]
	    cmp	y[dd00_space]
	    sta	y[dd00_space]
	    if (!equal) {
		jsr	mem_hit
	    }
	    dey
	} while (plus)
	rts

mem_hit:
	inc_border_color
	rts

d000_space:	block	16
dc00_space:	block	16
dd00_space:	block	16
