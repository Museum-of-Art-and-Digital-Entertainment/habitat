
	include "datamacros.m"
	include	"../Bin/class_equates.m"
; 
; 
; 	unpack a contents vector and get the world ready
; 
; 
; 	A contents vector is formatted like this:
; 
; 	<contentsVector> ::= <objectSpecList> <contentsList>*
; 	<objectSpecList> ::= <objectSpecifier>* <Separator> <data>*
; 	<objectSpecifier>::= <NOID_BYTE> <CLASS_BYTE>
; 	<contentsList>   ::= <NOID_BYTE> <objectSpecList>
; 
; 
; blame: F. Randall Farmer
; 


counter:			byte	0
number_to_init:			byte	0
hold_container:			byte	0
y_offset:			byte	0
save_real_container:		byte	0

setup_for_region_contents_vector::
	clearb	region_is_ready
	sta	hereis_flag			; allow big buffers & cache
	moveb	#special_mode, graphics_mode	; disable page flipping
	rts

unpack_region::
	ldy	#8
	do {
	    lda	y[@response_data]
	    sta	y[terrain_type]
	    dey
	} while (plus)			; set up region globals

	lda	#9
	bump	response_data
	moveb	who_am_i, me_NOID
	jsr	here_is
	clearb	loader_is_in_memory
	inc	region_is_ready
	jmp	send_SG

unpack_and_cleanup::
	jsr	here_is2
	jmp	recover_stuff

here_is::
	lda	#0
here_is2::
	sta	hold_container
	jsr	clear_region_cl
	jmp	unpack_contents_vector

; 
; In:
; 	response_data
; 	contents_list
;

unpack_contents_vector::
	movew	#region_contents_list,	contents_list	; used for all conts
	jsr	get_packet_stream_byte
	if (zero) {rts}				; null cv?
unpack_some_more:
	clearb	contents_list_pointer
	jsr	unpack_objects

	jsr	get_next_packet_stream_byte
	if (zero) {
	    jsr	render_region
	    jsr	clear_cache
	    moveb	#1,hereis_flag		; t-t-thats all folks.
	    rts
	}				; another container?

	sta	hold_NOID			; yes!
	sta	hold_container

	jsr	get_next_packet_stream_byte
	jmp	unpack_some_more

unpack_objects::				; NOID,CLASS,NOID,CLASS...
	jsr	get_packet_stream_byte
	cmp	#separator_byte
	beq	get_state_variables
	sta	counter				; save NOID for create_object
	ldy	contents_list_pointer
	sta	y[@contents_list]		; put NOID in contents list
	inc	contents_list_pointer
	jsr	get_next_packet_stream_byte		; CLASS
	ldx	counter
	tay
	jsr	create_object			; IN : y = class  x = NOID
	jsr	get_next_packet_stream_byte
	jmp	unpack_objects

get_state_variables:				; separator,data,data,data...
	clearb	counter
	tay

next_objects_sv:				; go thru the list of NOIDS
	    lda	y[@contents_list]
	    sta	hold_NOID
	    jsr	get_good_stuff
	    stx	hold_class
	    sta	hold_capacity

	    ldy	#CLASS_init_count
	    lda	y[@class_ptr1]
	    and	#0x3f				; low six bits
	    sta	number_to_init			; how many DATA_BYTEs sent?

; this code actualy inits the object state variables

	    lda	#OBJECT_init_offset
	    bump object_ptr1			; point to init space

	    clearb	y_offset
	    do {
		jsr	get_next_packet_stream_byte
		ldy	y_offset
		sta	y[@object_ptr1]
		cpy	#OBJECT_contained_by-OBJECT_init_offset
		if (equal) {
		    sta	save_real_container
		}
		iny
		sty	y_offset
		cpy	#end_of_standard_init	; more than 6 init bytes
		if (equal) {			; go AFTER contents_list
		    lda	hold_capacity
		    clc
		    adc	#3			; skip Ani START & END
		    bump object_ptr1		; so skip over contents list
		}
		dec	number_to_init
	    } while (!zero)

	    ldx	hold_NOID
	    jsr	get_object_address

	    lda	hold_class
	    cmp #class_head
	    if (equal) {
		lda	#0			; mark head so that its
		ldy	#HEAD_init_state	; image will get loaded
		sta	y[@object_address]
	    }

	    inc	counter
	    ldy	counter
	    cpy	contents_list_pointer
	if (!zero) {jmp	next_objects_sv}

load_stuff::
	lda	save_real_container	; NEW STUFF
	jsr	get_good_stuff		; 
	ldy	#CLASS_flags		; 
	lda	y[@class_ptr1]		; 
	if (minus) {			; Is this a special (non-display)
	    jmp	skip_loading_resources	;         container?
	}				; END NEW STUFF
	
	ldy	contents_list_pointer		; get stuff from disk
	dey
	do {
	    sty	counter
	    lda	y[@contents_list]
	    if (!zero) {
		tay
	        jsr	load_sound		; sound effects
	    }
	    ldy	counter
	    dey
	} while (plus)

	ldy	contents_list_pointer
	dey
	do {
	    sty	counter
	    lda	y[@contents_list]
	    if (!zero) {
		tay
	        jsr	load_action		; executables
	    }
	    ldy	counter
	    dey
	} while (plus)

	ldy	contents_list_pointer
	jsr	get_images

skip_loading_resources::
	moveb	contents_list_pointer,counter
	tay
	do {
	    dey
	    lda	y[@contents_list]
	    sta	hold_NOID
	    if (!zero) {
		GetObjectAddr	hold_NOID,object_address
		ldy	#OBJECT_contained_by
		lda	y[@object_address]
		if (!zero) {
		    tay
		    fGetObjectAddr	object_ptr1
		    lda	#OBJECT_contents
		    bump object_ptr1		; object contents
		    ldy	#OBJECT_container_offset
		    lda	y[@object_address]	; where IT thinks it belongs
		    tay
		    lda	hold_NOID
	 	    sta	y[@object_ptr1] 	; move to its REAL location
		}
	    }
	    dec	counter
	    ldy	counter
	} while (!zero)

;	lda	hold_container
	lda	save_real_container
	jsr	get_object_class
	cmp	#CLASS_AVATAR
	if (equal) {
	    ldy	#OBJECT_contents+AVATAR_HEAD	; have to load this here.
	    lda	y[@temp_var_7]			;
	    pha					; 
	    ldy	#OBJECT_contents+AVATAR_HAND	; NEW STUFF
	    lda	y[@temp_var_7]			;
	    jsr	load_all_resources		; avatar is a special case
	    pla					; non-display container, we
	    jsr	load_all_resources		; END NEW STUFF
	}

	rts			; phew! all objects in this container LOADED!

start_animation::				; start object y's animation
	sty	hold_NOID
	fGetObjectAddr	object_address
	ldy	#OBJECT_wait_state
	lda	y[@object_address]
	and	#animation_init_flag
	if (!zero) {				; need to init the animation?
		lda	y[@object_address]
		and	#~(animation_init_flag)
		sta	y[@object_address]
		ldy	#OBJECT_animation_state
		lda	y[@object_address]
	    	ldx	hold_NOID
		jsr	init_state_animation	; set object x to state a
	}
	rts


purge_NOID:	byte	0
purge_contents::
	sta	purge_NOID
	if (zero) {			; region
	    jsr	clear_region_cl
	    ldy	#0xff			; build a list of existing objects
	    ldx	#region_max_capacity
	    do {
		lda	y[object_table_hi]
		if (!zero) {
		    tya
		    dex
		    sta x[region_contents_list]
		}
		dey
	    } while (!zero)
	    movew	#region_contents_list, contents_list
	    moveb	#region_max_capacity, hold_capacity
	} else {
	    jsr	get_good_stuff
	    if (zero) {rts}		; no contents to purge
	    sta	hold_capacity
	    addwwb	contents_list, object_ptr1, #OBJECT_contents
	}

	do {
	    ldy	hold_capacity
	    dey
	    lda	y[@contents_list]
	    sta	hold_NOID
	    if (!zero) {		; is there something here?
		lda	#0
		sta	y[@contents_list]
		lda	hold_NOID
		jsr	get_good_stuff
		if (!zero) {		; is it a container?
		    lda	purge_NOID
		    if (!zero) {	; non-region? Recurse!
			pha			; for when we return
			lda	hold_NOID
			jsr	purge_contents	; purge nested container
			ldy	purge_NOID	; = old hold_NOID
			jsr	UnCreate_object
			pla
			jmp	purge_contents	; purge container again!
		    }
		}
		ldy	hold_NOID	; no, just delete it!
		jsr	UnCreate_object
	    }
	    dec	hold_capacity
	} while (!zero)
	rts

Get_good_stuff::			; in a
	tay				; out object_ptr1, class_ptr1
	fGetObjectAddr	object_ptr1	; a = capacity	x = class#
	ldy	#OBJECT_class_pointer
	lda	y[@object_ptr1]
	pha
	tay
	fGetClassAddr	class_ptr1
	pla
	tax
	ldy	#CLASS_capacity
	lda	y[@class_ptr1]
	rts


get_images::				; @contents_list
	dey				; y = maximum offset+1 
	sty	lowest_to_display
	do {
	    lda	y[@contents_list]
	    if (!zero) {
		sta	hold_NOID
		tay
		fGetObjectAddr	object_address
	    	ldy	#OBJECT_style_pointer
	    	lda	y[@object_address]
	    	tax
		ldy	hold_NOID
		jsr	load_image		; proper style of graphics
		ldy	hold_NOID
		jsr	start_animation
	    }
	    dec	lowest_to_display
	    ldy	lowest_to_display
	} while (plus)
	rts

clear_region_cl:
	fill	region_contents_list,region_max_capacity,0
	rts
