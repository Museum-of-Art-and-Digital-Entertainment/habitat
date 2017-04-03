	include "ronmacros2.m"
	include "datamacros.m"
	include "../Bin/class_equates.m"

;  datacrunch: the database delete routines that CRUNCH memory
; 	and search for deleted blocks


define	delete_block	=	temp_var_1
define	result		=	temp_var_6

first_delete_block::	word	4		      ; reffered to indirectly
			word	static_end_of_heap	; nill point
last_link::		word	static_end_of_heap
block_size:		block	2

consolidate_delete_blocks::			; assumes they are SORTED
	movew	first_delete_block+link_offset,delete_block
	while (!zero) {
	    ldy	#size_offset
	    lda	y[@delete_block]
	    sta	block_size
	    iny
	    lda	y[@delete_block]
	    sta	block_size+1			; size of the block we are at
	    add16	block_size,delete_block,result
	    jsr		get_next_delete_block
	    if (zero) {rts}			; all done!
	    cpx	result
	    if (equal) {
		cpy	result+1
	    }
	    if (equal) {
		stxy	result			; points to adjacent memory!
		ldy	#link_offset
		lda	y[@result]
		sta	y[@delete_block]
		iny
		lda	y[@result]
		sta	y[@delete_block]	; skip a hook
		ldy	#size_offset
		clc
		lda	block_size
		adc	y[@result]
		sta	y[@delete_block]
		iny
		lda	block_size+1
		adc	y[@result]
		sta	y[@delete_block]	; swollow up them bytes!
		lda	result
		cmp	last_link
		if (equal) {
		    lda	result+1
		    cmp	last_link+1
		    if (equal) {	; did we swollow last_link?
			movew delete_block,last_link	; fix this sorry state
		    }
		}
		lda	delete_block+1		; so while doesn't fail
	    } else {
		jsr	get_next_delete_block	; move on down the list
		stxy	delete_block
	    }
	}
	rts
	    
; A word about my sort:
;  I used Delayed-Placement for 2 reasons:
; 	1. It was the fastest sort I REALLY understand
; 	2. If the items are pre-sorted, It is VERY fast
; as usual: Blame = F. Randall Farmer

define	sorting_block		=	temp_var_2
define	find_value		=	temp_var_3
define	Who_is_best		=	temp_var_4
define	Who_points_to_best	=	temp_var_5

who_points_to_this:	block	2
where_this_points:	block	2
Where_best_points:	block	2

sort_delete_blocks::
	movew	#first_delete_block,sorting_block	; 'top' of list
walk_tree:
	    lda	#0xff
	    sta Who_is_best
	    sta Who_is_best+1
	    movew sorting_block, who_points_to_this
	    ldy	#link_offset
	    lda	y[@sorting_block]
	    sta	find_value
	    tax
	    iny
	    lda	y[@sorting_block]
	    sta	find_value+1
	    tay					; LOOK at NEXT block
	    if (zero) {jmp sort_end}		; sort finished!
	    do {
		stxy	delete_block		; where_am_I
		jsr	get_next_delete_block
		stxy	where_this_points
		cmp16	delete_block,find_value
		if (lt) {			;  less than assumed value
		    cmp16	delete_block, Who_is_best
		    if (lt) {			;  less than BEST value
			movew	delete_block, Who_is_best
			movew	who_points_to_this, Who_points_to_best
			movew	where_this_points, Where_best_points
		    }
		}
		movew	delete_block, who_points_to_this
		ldxy	where_this_points	; move on down the tree
	    } while (!zero)
	    lda	Who_is_best+1
	    cmp	#0xff
	    if (!equal) {			; found one!
		ldy	#link_offset
		lda	Who_is_best
		sta	y[@sorting_block]
		lda	find_value
		sta	y[@Who_points_to_best]
		lda	y[@find_value]
		sta	y[@Who_is_best]
		lda	Where_best_points
		sta	y[@find_value]		; SWAP!
		iny
		lda	Who_is_best+1
		sta	y[@sorting_block]
		lda	find_value+1
		sta	y[@Who_points_to_best]
		lda	y[@find_value]
		sta	y[@Who_is_best]
		lda	Where_best_points+1
		sta	y[@find_value]		; SWAP!
	    }
	    movew sorting_block,delete_block
	    jsr	get_next_delete_block
	    if (!zero) {
		stxy sorting_block
		jmp	walk_tree
	    }
sort_end:
	movew	sorting_block, last_link	; end of list
	rts

define	previous_block	=	temp_var_2
define	new_block	=	temp_var_4

best_fit_location:	block	2
best_fit_size:		block	2
save_previous_block:	block	2
minimum_size:		block	2

search_for_best_block::				; assumes blocks consolidated
						;  xy desired size
	stxy	desired_size
	add16	desired_size,#4,minimum_size	; must be 4 bytes at end!
	movew	first_delete_block+link_offset,delete_block
	if (zero) {rts}				; FAIL,NO Deleted Blocks
	lda	#0xff
	sta	best_fit_size
	sta	best_fit_size+1	
	clearw	best_fit_location
	movew	#first_delete_block, save_previous_block	; yes #

	do {
	    ldy	#size_offset
	    lda	y[@delete_block]
	    sta	block_size
	    iny
	    lda	y[@delete_block]
	    sta	block_size+1
	    cmp16	block_size, minimum_size	; find size+4
	    if (geq) {
		cmp16	best_fit_size, block_size
		if (geq) {
		    jsr	get_next_delete_block
;		    if (zero) {				; last delete block
;			cmp16	block_size, minimum_size ; needs to be room
;			if (lt) {			; for AT LEAST
;			    jmp	not_enuf_room		; 4 delete bytes!
;			}
;		    }
		    movew	block_size, best_fit_size
		    movew	delete_block, best_fit_location
		    movew	save_previous_block, previous_block
		}
	    }
not_enuf_room:
	    movew	delete_block, save_previous_block
	    jsr	get_next_delete_block
	    stx	delete_block
	    sty	delete_block+1
	} while (!zero)

	movew	best_fit_location, delete_block
	if (zero) {rts}			; FAIL,no 'best fit' found
	jsr	create_and_link_delete_block	; try to recover Xtra space
	ldxy	best_fit_location	; YEA! put it here!
	rts

hold_desire:	word	0

squeeze_memory::
	movew	desired_size,hold_desire
	movew	#0xffff,desired_size
	dec	moving_memory				; protect sounds
	jsr	CRUNCH					; try to find space
	inc	moving_memory
	ldxy	hold_desire
	jsr	search_for_best_block
	if (zero) {
	    jsr	remove_stuff_from_memory
	    bne	squeeze_memory				; do till found...
	    jsr	remove_unreffed_images
	    bne	squeeze_memory
	    jsr	remove_unreffed_actions
	    bne	squeeze_memory
	    jsr	remove_unreffed_sounds
	    bne	squeeze_memory
	}
	rts

get_next_delete_block:
	ldy	#link_offset
	lda	y[@delete_block]
	tax
	iny
	lda	y[@delete_block]
	tay
	rts

create_and_link_delete_block::
					; previous_block
					; delete_block
					; best_fit_size(size of delete_block)
					; desired_size

	sub16	best_fit_size,desired_size,block_size	; how close is fit?
	cmp16	block_size,#4		; Big enough to link?	
	if (geq) {			; YES, create a deleted block
	    add16 delete_block,desired_size,new_block
	    ldy	#link_offset
	    lda	new_block
	    sta	y[@previous_block]
	    iny
	    lda	new_block+1
	    sta	y[@previous_block]	; ok, previous => new block
						; Now setup new block
	    jsr	get_next_delete_block		; returns xy
	    sty	save_a
	    ldy	#link_offset
	    txa
	    sta	y[@new_block]
	    iny
	    lda	save_a
	    sta	y[@new_block]
	    ldy	#size_offset
	    lda	block_size
	    sta	y[@new_block]
	    iny
	    lda	block_size+1
	    sta	y[@new_block]			; OK! New block created!
	} else {
;	    jsr	get_next_delete_block		;  close fit, move link to
;	    sty	save_a				;  skip this block
;	    ldy	#link_offset
;	    txa
;	    sta	y[@previous_block]
;	    iny
;	    lda	save_a
;	    sta	y[@previous_block]
;	    movew best_fit_size, desired_size	; make size = best_fit
;	    movew previous_block,new_block
	    error bad_link_attempt
	}

	lda	last_link
	cmp	delete_block			; fix up last link
	if (equal) {
	    lda	last_link+1
	    cmp	delete_block+1
	}
	if (equal) {
	    movew	new_block,last_link
	}
	rts
	    

define	data_block	=	temp_var_5

original_size:		word	0
save_size:		word	0
crunch_end:		word	0
save_block_type::	byte	0
save_block_offset:	byte	0
		
CRUNCH::					; massacre memory!
	movew	first_delete_block+link_offset,delete_block
	ldy	#size_offset
	lda	y[@delete_block]
	sta	original_size
	iny
	lda	y[@delete_block]
	sta	original_size+1
	add16	delete_block,original_size,data_block
	jsr	get_next_delete_block
	if (zero) {rts}		; fail!
	stxy	crunch_end
	jsr	move_data_blocks
	jsr	consolidate_delete_blocks
	jmp	CRUNCH

move_data_blocks:
	do {
	    ldy	#size_offset
	    lda	y[@data_block]
	    sta	save_size
	    iny
	    lda	y[@data_block]
	    sta	save_size+1
	    iny
	    lda	y[@data_block]
	    sta	save_block_type
	    iny
	    lda	y[@data_block]
	    sta	save_block_offset

	    movew	save_size,length
	    movew	data_block,source
	    movew	delete_block,destination

	    jsr		block_move

	    ldx	save_block_offset
	    ldy	save_block_type
	    jsr	fix_proper_table
	
	    add16	delete_block,save_size,delete_block
	    add16	data_block,save_size,data_block
	    cmp16	data_block,crunch_end
	} while (lt)
	movew	delete_block, first_delete_block+link_offset
	ldy	#size_offset
	lda	original_size
	sta	y[@delete_block]
	iny
	lda	original_size+1
	sta	y[@delete_block]
	iny
	lda	crunch_end
	sta	y[@delete_block]
	iny
	lda	crunch_end+1
	sta	y[@delete_block]
	rts
	
fix_proper_table:
	if (zero) {
	    lda	delete_block
	    sta	x[Object_table_lo]
	    lda	delete_block+1
	    sta	x[Object_table_hi]
	    rts
	}
	dey	
	if (zero) {
	    lda	delete_block
	    sta	x[Class_table_lo]
	    lda	delete_block+1
	    sta	x[Class_table_hi]
	    rts
	}
	dey	
	if (zero) {
	    lda	delete_block
	    sta	x[Image_table_lo]
	    lda	delete_block+1
	    sta	x[Image_table_hi]
	    rts
	}
	dey	
	if (zero) {
	    lda	delete_block
	    sta	x[Action_table_lo]
	    lda	delete_block+1
	    sta	x[Action_table_hi]
	    rts
	}
	dey
	if (zero) {
	    lda	delete_block
	    sta	x[Sound_table_lo]
	    lda	delete_block+1
	    sta	x[Sound_table_hi]
	    rts
	}
	error	memory_fault		; bad block type

; remove_stuff_from_memory:
; if sorting, consolidatind, & crunching fail,
; it is time to remove some of the 'Uncreated' items from memory.

remove_stuff_from_memory::
	moveb	#oldest_LRU,	lru_selfmod+1
	jsr	find_a_class_to_remove
	moveb	#old_LRU,	lru_selfmod+1
	jsr	find_a_class_to_remove
	moveb	#just_deleted,	lru_selfmod+1
	jsr	find_a_class_to_remove		; succeed or fail...
	rts					; DO NOT PUT A JMP HERE ARIC

find_a_class_to_remove:
		ldy	#0xff
		do {
		    lda	y[class_table_ref]
		    and	#LRU_bits
LRU_selfmod:	    cmp	#just_deleted
		    beq	unload_and_fix_stack
		    dey
		} while (!equal)
		rts					; FAIL!

unload_and_fix_stack::
	pla
	pla					; fix stack
	sty	unload_class_number
	jsr	unload_resources		; for class
	lda	#0
	ldy	unload_class_number
	sta	y[class_table_ref]
	fGetClassAddr	class_ptr1
	ldxy	class_ptr1
	jsr	deallocate_mem
	PutClassAddr	unload_class_number,nill
	lda	#1				; success!
	rts

unload_class_number:	byte	0

remove_unreffed_heads::
	ldx	#type_image
	jsr	unpack_resource_type
	ldy	#max_number_of_heads		; only unload head images
	jsr	remove_unreffed_resources_alt
	rts

remove_unreffed_images::
	ldx	#type_image
	jmp	remove_unreffed_resources

remove_unreffed_sounds::
	ldx	#type_sound
	jmp	remove_unreffed_resources

remove_unreffed_actions::
	ldx	#type_action

remove_unreffed_resources::
	jsr	unpack_resource_type
	ldy	#0xff
remove_unreffed_resources_alt:
	do {
	    lda	y[@resource_table_ref]
	    if (zero) {
		lda	y[@resource_table_hi]
		if (!zero) {
		    lda	#0				; class
		    ldx	resource_type
		    cpx	#type_image
		    if (equal) {
			cpy	#max_number_of_heads+1
		        if (!carry) {
				lda	#class_head	; head image, fix tale
			}
		    }
		    sta	class				; for r_r_f_m
		    jsr	remove_resource_from_memory
		    lda	#1				;success!
		    rts
		}
	    }
	    dey
	    cpy	#0xff
	} while (!equal)
	rts					; zflag = fail!

decrement_LRUs::
	ldy	#0xff
	do {
	    lda	y[class_table_ref]
	    and	#LRU_bits
	    if (!zero) {
		sec
		sbc	#oldest_LRU
		if (zero) {
		    lda	#oldest_LRU
		}
		sta	y[class_table_ref]
	    }
	    dey
	    cpy	#1				; avatar LRU NEVER ages!
	} while (!equal)
	rts

is_object_in_opaque_container::		; in object_address
	ldy	#OBJECT_contained_by	; out z=false
	lda	y[@object_address]
	jsr	get_object_class	; temp_var_8 =>container class
	cpy	#class_avatar
	if (equal) {
	    ldy	#OBJECT_container_offset
	    lda	y[@object_address]
	    cmp	#AVATAR_HAND
	    if (carry) {
		lda	#0			; pretend not opaque
		rts
	    }
	}
	ldy	#CLASS_flags
	lda	y[@temp_var_8]
	and	#OPAQUE
	rts

