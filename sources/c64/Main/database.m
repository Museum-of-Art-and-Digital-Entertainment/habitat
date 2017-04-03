	include "ronmacros2.m"
	include "datamacros.m"
	include "diskmacros.m"
	include	"../Bin/class_equates.m"


;-----------------------------------------------------------------------
; Create Object
;
;  In			Y = Class number
;			X = Object number
; 
;----------------------------------------------------------------------
Create_object::
	
	sty object_class
	cpy	#CLASS_AVATAR
	if (equal) {
	    inc	avatar_count
	}
	stx object_num
	jsr load_class		; load it, if needed
	lGetClassAddr object_class,class_ptr1
	ldy #CLASS_object_length
	lda y[@class_ptr1]	; length of object for alloc
	tax
	cly			; xy = size of block to alloc
	jsr allocate_mem	; allocate memory (crunch if needed)
	stx object_ptr1
	sty object_ptr1+1	; address of newly created object
	ldy object_num
	sty object
	PutObjectAddr object,object_ptr1
	ldy desired_size
	lda #0
	do {
	    dey
	    sta	y[@object_ptr1]
	} while (!zero)
	ldy #OBJECT_class_pointer
	lda object_class		
	sta y[@object_ptr1]
	ldy #OBJECT_object_length
	lda desired_size	   ; what alloc said block size is
	sta y[@object_ptr1]
	iny
	lda desired_size+1
	sta y[@object_ptr1]
	iny
	lda #type_object
	sta y[@object_ptr1]	; block_type
	iny
	lda object
	sta y[@object_ptr1]		; block_offset
	ldy #Object_wait_state
	lda #animation_init_flag	; object needs its animation inited!
	ldx object_class
	sta y[@object_ptr1]
	lda object
	tay
	rts

; ----------------------------------------------------------------------
; Uncreate Object
; 
; In - y = object to delete
; ----------------------------------------------------------------------
dc_temp:	block 1
dc_temp_ptr:	block 2

Uncreate_object::
	jsr	unreff_resources

	lda	class
	cmp	#CLASS_AVATAR			; class_avatar
	if (equal) {
	    lda	object
	    jsr	find_talker_number
	    lda	#0
	    sta	y[talker_color_table]	; free up color slot
	    dec	avatar_count
	}

	ldx class
	dec x[class_table_ref]
	if (zero) {
	    moveb	#just_deleted, x[class_table_ref]
	}

	lGetObjectAddr object,object_ptr1
	PutObjectAddr object,nill
	ldxy	object_ptr1
	jsr	deallocate_mem			;  oh yea! delete object!
	rts

Unreff_resources::			; by object (in y)
	jsr	GetImage		;gets class for us and sets up

	lGetObjectAddr	object,object_ptr1
	ldy	#OBJECT_resources	; what resources ARE accounted for?
	lda	y[@object_ptr1]
	pha
	and	#1			; Image is
	if (!zero) {
	    ldx	ISA_number
	    dec	x[image_table_ref]
	}

	lGetClassAddr class,class_ptr1
	pla
	and	#2			;Sounds & Actions are
	if (!zero) {
	    ldx	#type_sound
	    jsr	unreference_resource

	    ldx	#type_action
	    jsr	unreference_resource
	}
	lda	#0
	ldy	#OBJECT_resources	; what resources ARE accounted for?
	sta	y[@object_ptr1]		; NONE!
	rts

;----------------------------------------------------------------------
;  allocate memory
; 
; 	in  - x,y are the size of the data needed
; 	out - x,y are the memory location of the data space
;----------------------------------------------------------------------
allocate_mem::
	jsr	search_for_best_block
	if (zero) {
	    jsr	squeeze_memory
	    if (zero) {
	    	lda	display_contents_noid
		if (zero) {
		    error	memory_full
		}
		ldx	saved_stack_position		; this is
		txs					; REALLY
		jmp	get_images_failed		; sleazy
	    }
	}
	rts

; ----------------------------------------------------------------------
; Deallocate memory
; 
; In xy = address of block to deallocate
; 	 it is assumed that the length of the block
; 	 to kill is in the first two bytes
; ----------------------------------------------------------------------
deallocate_mem::
	movew	last_link,temp_ptr1
	stxy	last_link		; NEW link location
	ldy	#link_offset
	lda	last_link
	sta	y[@temp_ptr1]
	iny
	lda	last_link+1
	sta	y[@temp_ptr1]		; hook on end
	stx	temp_ptr1
	sta	temp_ptr1+1
	lda	#0
	ldy	#link_offset
	sta	y[@temp_ptr1]
	iny
	sta	y[@temp_ptr1]		; nill link
	jsr	sort_delete_blocks
;;	jsr	check_heap_for_bad_links
	jsr	consolidate_delete_blocks
;;	jsr	check_heap_for_bad_links
	rts

;----------------------------------------------------------------------
;  GetXXXXX - returns the address to the XXXXX of an object
; 
;   in - Y is the object number
;        A the action
; 
;  out - XY address of action
;----------------------------------------------------------------------
GetSound::
	sta ISA_number
	moveb #type_sound,ISA_flag
	jsr Get_ISA_addr
	lGetSoundAddr ISA_number,temp_ptr1
	ldxy temp_ptr1
	rts
;----------------------------------------------------------------------
GetImage::
	sty	object
	lGetObjectAddr	object,temp_ptr1
	ldy	#Object_style_pointer
	lda	y[@temp_ptr1]
	ldy	object
	sta	ISA_number
	moveb #type_image,ISA_flag
	jsr Get_ISA_addr
	lGetImageAddr ISA_number,temp_ptr1
	ldxy temp_ptr1
	rts
;----------------------------------------------------------------------
GetAction::
	sta ISA_number
	moveb #type_action,ISA_flag
	jsr Get_ISA_addr
	lGetActionAddr ISA_number,temp_ptr1
	ldxy temp_ptr1
	rts
;----------------------------------------------------------------------

Get_ISA_addr::
	sty object
	fGetObjectAddr temp_ptr1
	ldy #OBJECT_class_pointer		
	lda y[@temp_ptr1]
	sta class
	tay
	fGetClassAddr temp_ptr1	; get address of class
	ldx ISA_flag
	ldy x[resource_offset_table]	;get addr of IS or B start
	lda y[@temp_ptr1]
	add ISA_number		; index to wanted number
	tay
	lda y[@temp_ptr1]	; load it
	sta ISA_number		; return the number of IS or B
	rts

;----------------------------------------------------------------------
; load class fomr disk into memory
; as a side effect, it will load all the sounds,images and actions
; that are needed and not already in memory.
; 
; in - y = the class  (also in class) 
; ---------------------------------------------------------------------

load_class:	
	sty class
	ldx #type_class
	jsr unpack_resource_type
	lda y[class_table_ref]
	ora y[class_table_hi]
	if (zero) {
	    jsr	get_resource_from_disk
	}
	lGetClassAddr class,structure_ptr
	ldx class
	lda	x[class_table_ref]
	and	#ref_bits		; bye bye LRUs
	clc
	adc	#1
	sta	x[class_table_ref]
	rts

get_object_class::				; in a - noid
	tay					; out a,y - class
	fGetObjectAddr	temp_var_7		; temp_var_7 (object)
	ldy	#OBJECT_class_pointer		; temp_var_8 (class)
	lda	y[@temp_var_7]			; trashes x
	pha
	tay
	fGetClassAddr	temp_var_8
	pla
	tay
	rts


load_all_resources::				; in a - noid
	if (!zero) {
	    sta	load_this_object
	    jsr	get_object_class
	    ldy	#OBJECT_style_pointer
	    lda	y[@temp_var_7]
	    tax
	    ldy	load_this_object
	    jsr	load_image
	    ldy	load_this_object
	    jsr	load_action
	    ldy	load_this_object
	    jsr	load_sound
	    ldy	load_this_object
	    jsr	start_animation			; if not already started
	}
	rts


unload_resources::				; by class (y)
	sty	class
	moveb	#0, load_flag
	jsr	unload_image
	jsr	unload_sound
	jsr	unload_action
	moveb	#0xff, load_flag		; all done for now.
	rts

load_action::				; this should set 1 BYTE!
unload_action::
	ldx	#type_action
	jmp	load_or_unload_resource

load_sound::
unload_sound::
	ldx	#type_sound
	jmp	load_or_unload_resource

load_image::
	stx	style
unload_image::
	ldx	#type_image
	jmp	load_or_unload_resource

unpack_resource_type::
	stx	resource_type
	moveb	x[resource_offset_table], resource_offset
	moveb	x[resource_count_table], resource_count
	moveb	x[resource_tables_hi_lo], resource_table_hi
	moveb	x[resource_tables_hi_hi], resource_table_hi+1
	moveb	x[resource_tables_lo_lo], resource_table_lo
	moveb	x[resource_tables_lo_hi], resource_table_lo+1
	moveb	x[resource_tables_ref_lo], resource_table_ref
	moveb	x[resource_tables_ref_hi], resource_table_ref+1
	moveb	x[resource_files_lo], resource_file
	moveb	x[resource_files_hi], resource_file+1
	rts

load_or_unload_resource::
	jsr	unpack_resource_type	; no toucho y (object # to load)
	lda	load_flag
	if (!zero) {			; loading? find objects class
	    sty object
	    sty	save_object_pointer
	    fGetObjectAddr temp_ptr1
	    ldy #OBJECT_class_pointer
	    lda y[@temp_ptr1]
	    sta class
	    ldx	resource_type				;
	    ldy	#OBJECT_resources			; 
	    lda	y[@temp_ptr1]				; 
	    and	x[resource_bits]			; if stuff is
	    if (!zero) {				; accounted for
		rts					; ABORT!
	    }						; END NEW
	}
	lGetClassAddr class,structure_ptr
	ldy resource_count
	lda y[@structure_ptr]		; get number of things
	if (zero) {rts}			; nothing to do
	sta resource_counter

	ldy resource_offset
	lda y[@structure_ptr]			; get offset to things

	ldx load_flag				; images special case
	if (!zero) {				; 
	    ldx resource_type			; 
	    cpx #type_image			; 
	    if (equal) {			;
		ldx	class
		cpx	#class_head		; head hack special
		if (equal) {			;
		    pha				; 
		    jsr	find_head_slot		;
		    pla				; 
		}
		ldy	#1			; 
		sty	resource_counter	; load only this image
		clc				; 
		adc	style			; use style as offset
	    }					; 
	}					; end images special case

	sta object_resource_offset

	do {
	    ldy object_resource_offset	; get offset currently at
	    lda y[@structure_ptr]
	    tay
	    sty resource_number
	    lda	load_flag
	    if (!zero) {
		lda y[@resource_table_ref]	; get ref count
		ora y[@resource_table_hi]
		if (zero) {			; need to get it from disk
			jsr	get_resource_from_disk
		}
		ldy resource_number
		lda	y[@resource_table_ref]
		clc
		adc	#1
		sta	y[@resource_table_ref]
		jsr	set_resource_bit		; NEW
	    } else {					; UNLOAD
		lda	y[@resource_table_ref]
		if (zero) {
		    lda	y[@resource_table_hi]
		    if (!zero) {
			jsr	remove_resource_from_memory
		    }
		}
	    }
	    inc object_resource_offset
	    dec resource_counter
	} while (!zero)
	rts

set_resource_bit:				; NEW
	ldy	save_object_pointer		; 
	fGetObjectAddr temp_ptr1		; 
	ldx	resource_type			; 
	lda	x[resource_bits]		; mark allocated
	ldy	#OBJECT_resources		; 
	ora	y[@temp_ptr1]			; 
	sta	y[@temp_ptr1]			; 
	rts					; END NEW

get_resource_from_disk::		; y = resource #
	sty	resource_number
	jsr	save_stuff_before_alloc
	lda	resource_type			; head hack special case
	cmp	#type_image			; 
	if (equal) {				; 
	    lda	class				; 
	    cmp	#class_head			; 
	    if (equal) {			; 
		open_file	#head_file	;
		lda	y[head_style_list]	; get desired head#
		tay				; 
		jmp	skip_normal_load	; 
	    }					; 
	}					; end special case
	read_file_directory	resource_file
	open_file		resource_file
	ldy	resource_number
skip_normal_load:
	lda	resource_type
	jsr	read_structure
	stxy	temp_var_1		; save for a moment
	jsr	restore_stuff_after_alloc

	ldy	#BLOCK_number		; for head's sake
	lda	resource_number		; cause the number is wrong for
	sta	y[@temp_var_1]		; heads (these 3 lines special case)

	ldy	resource_number
	lda	temp_var_1
	sta	y[@resource_table_lo]
	lda	temp_var_1+1
	sta	y[@resource_table_hi]
	jmp	check_one_resource	; make sure resource is valid LRC

remove_resource_from_memory::		; y = resource #
	sty	resource_number
	lda	y[@resource_table_lo]
	tax
	lda	y[@resource_table_hi]
	tay
	jsr	deallocate_mem
	ldy	resource_number
	lda	nill
	sta	y[@resource_table_lo]
	sta	y[@resource_table_hi]
	lda	resource_type			; all head hack stuff
	cmp	#type_image			; 
	if (equal) {				; 
	    lda	class				; 
	    cmp	#class_head			; 
	    if (equal) {			; 
		jsr	remove_head_image	; 
		ldx	resource_number		; 
		lda	#0			; 
		sta	x[head_style_list]	; 
	    }					; 
	}					; end head hack stuff
	rts

unreference_resource::
	jsr	unpack_resource_type
	ldy resource_count
	lda y[@class_ptr1]
	if (!zero) {
	    sta resource_counter
	    ldy resource_offset
	    lda y[@class_ptr1]
	    sta object_resource_offset
	    do {
	        ldy object_resource_offset
		lda y[@class_ptr1]
		tay
		lda	y[@resource_table_ref]
		sec
		sbc	#1
		sta	y[@resource_table_ref]
		inc object_resource_offset
		dec resource_counter
	    } while(!zero)			    
	}			   			    
	rts

save_stuff_before_alloc::
	moveb	resource_counter,	save_stuff
	moveb	object_resource_offset,	save_stuff+1
	moveb	resource_number,	save_stuff+2
	moveb	class,			save_stuff+3
	moveb	resource_type,		save_stuff+4
	rts

restore_stuff_after_alloc::
	moveb	save_stuff,	resource_counter
	moveb	save_stuff+1,	object_resource_offset
	moveb	save_stuff+2,	resource_number
	moveb	save_stuff+3,	class
	tay
	fGetClassAddr	structure_ptr
	ldx	save_stuff+4			; resource_type
	jmp	unpack_resource_type

save_stuff:	block 5

; ----------------------------------------------------------------------
; reads a structure (y) into memory from a already opened file
; return address of the structure in structure_ptr
; ----------------------------------------------------------------------
rs_temp_ptr1:	block 2
rs_temp_ptr2:	block 2
rs_temp_ptr3:	block 2

read_structure:
		sta	structure_type
		sty	structure_number
		tya
		asl a
		sta rs_temp_ptr1
		lda #0
		rol a
		sta rs_temp_ptr1+1
		seek_byte rs_temp_ptr1
		read_segment #rs_temp_ptr1,#2
		seek_byte rs_temp_ptr1
		read_segment #rs_temp_ptr2,#2
		ldxy rs_temp_ptr2
		jsr allocate_mem		; could modify desired_size
		stxy rs_temp_ptr3
		seek_byte rs_temp_ptr1
		read_segment rs_temp_ptr3,rs_temp_ptr2
		movew	rs_temp_ptr3,	temp_var_1
		ldy	#size_offset
		lda	desired_size
		sta	y[@temp_var_1]
		iny
		lda	desired_size+1
		sta	y[@temp_var_1]
		iny
		lda	structure_type
		sta	y[@temp_var_1]
		iny
		lda	structure_number
		sta	y[@temp_var_1]		
		ldxy rs_temp_ptr3
		rts

remove_head_image:
	ldx	#0xff
	do {
	    lda	x[object_table_hi]
	    if (!zero) {
		sta	temp_ptr1+1
		lda	x[object_table_lo]
		sta	temp_ptr1
		ldy	#OBJECT_class_pointer
		lda	y[@temp_ptr1]
		cmp	#class_head
		if (equal) {
		    ldy	#HEAD_init_state
		    lda	y[@temp_ptr1]
		    if (!zero) {
			ldy	#OBJECT_style_pointer
			lda	y[@temp_ptr1]
			cmp	resource_number
			if (equal) {
			    ldy	resource_number
			    lda	y[head_style_list]
			    ldy	#OBJECT_style_pointer
			    sta	y[@temp_ptr1]
			    ldy	#HEAD_init_state
			    lda	#0
			    sta	y[@temp_ptr1]
			}
		    }
		}
	    }
	    dex
	} while (!zero)
	rts

find_head_slot:			; KLUDGE CITY, This had better work.

	ldy	#HEAD_init_state
	lda	y[@temp_ptr1]
	if (!zero) {			;  already OK
	    rts
	}

	clearb	head_open_slot
	sta	head_found_at

	ldy	#OBJECT_style_pointer	; head style # 1-256
	ldx	#max_number_of_heads	; check slots 1-15
	do {
	    lda	x[head_style_list]
	    if (zero) {			; 0 means free
		stx	head_open_slot
	    }
	    cmp	y[@temp_ptr1]
	    if (equal) {
	    	stx	head_found_at
	    }
	    dex
	} while (!zero)

	ldx	head_found_at				; found!
	if (zero) {
	    ldx	head_open_slot				; empty slot found!
	    if (zero) {
		movew	temp_ptr1, head_found_at	; no room...throw old
		jsr	remove_unreffed_heads
		movew	head_found_at, temp_ptr1
		jmp	find_head_slot
	    }
	}
	lda	y[@temp_ptr1]
	sta	x[head_style_list]			; holds head_style #
	txa
	sta	y[@temp_ptr1]				; holds image number
	sta	style
	ldy	#HEAD_init_state
	lda	#1
	sta	y[@temp_ptr1]				; ok, now style=1-15
	rts
  
head_found_at:		byte	0
head_open_slot:		byte	0	; OR head_found_at+1

; ----------------------------------------------------------------------

style:			byte	0
object_num:		byte	0
object_class:		byte	0
structure_number:	byte	0
structure_type:		byte	0
load_flag::		byte	0xff		; default to load

resource_count_table:
			byte	0
			byte	0
			byte CLASS_image_count
			byte CLASS_action_count
			byte CLASS_sound_count

resource_offset_table:
			byte	0
			byte	0
			byte CLASS_image_offset
			byte CLASS_action_offset
			byte CLASS_sound_offset
resource_tables_hi_lo:
			byte /object_table_hi
			byte /class_table_hi
			byte /image_table_hi
			byte /action_table_hi
			byte /sound_table_hi
resource_tables_hi_hi:
			byte ?object_table_hi
			byte ?class_table_hi
			byte ?image_table_hi
			byte ?action_table_hi
			byte ?sound_table_hi
resource_tables_lo_lo:
			byte /object_table_lo
			byte /class_table_lo
			byte /image_table_lo
			byte /action_table_lo
			byte /sound_table_lo
resource_tables_lo_hi:
			byte ?object_table_lo
			byte ?class_table_lo
			byte ?image_table_lo
			byte ?action_table_lo
			byte ?sound_table_lo
resource_tables_ref_lo:
			byte	0
			byte /class_table_ref
			byte /image_table_ref
			byte /action_table_ref
			byte /sound_table_ref
resource_tables_ref_hi:
			byte	0
			byte ?class_table_ref
			byte ?image_table_ref
			byte ?action_table_ref
			byte ?sound_table_ref
resource_files_lo:
			byte	0
			byte /class_file
			byte /image_file
			byte /action_file
			byte /sound_file
resource_files_hi:
			byte	0
			byte ?class_file
			byte ?image_file
			byte ?action_file
			byte ?sound_file


resource_bits::
		byte 0,0,1,2,4
; these are the bits used to flag what resource is loaded for this class.
