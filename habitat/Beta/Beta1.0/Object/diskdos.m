	include "ronmacros2.m"
	include "datamacros.m"
	include "diskmacros.m"


;======================================================================
;  KDOS:   High level disk I/O routine
;  
;======================================================================
;  variables used by KDOS  (all are 2 byte storage)
;
; tracksector:		starting TS of a file  TS = TRACK/SECTOR
; file_offset:		# of bytes offset into file
; number_of_bytes:	number of byte to read from the file
; put_address:		address of where to put seqment of code
;======================================================================
; 
;                file_offset      ==>> BUFFER  ==>> put_address
;                     v
;   ===================================================================
;          I          :                  I        :
;          I          :                  I        :
;   ===================================================================
;          ^          ^                           ^
;   start_tracksector  |.....number_of_bytes.......|
; 
;======================================================================
;	reset pointer for buffer contents
;======================================================================
d_open_file::
	movew	#0x0000,cur_buff_tracksec
	rts

;======================================================================
;	find location on disk, and
;	fill buffer with current sector
;======================================================================
d_seek_record::
	movew	start_tracksector,tracksector

	movew	file_offset,tempoff		;put offset into tempoff
tryagain:
	subw	tempoff,tempoff,#buffer_size	;remove bsize from tempoff
	if (carry) {				;if tempoff >= bsize then
		jsr increment_TS		;next sector
		movew	tempoff,file_offset	;try again....
		jmp	tryagain
	}

	lda	tracksector
	ldy	tracksector+1
	cmp	cur_buff_tracksec		;is desired tracksector
	if (equal) {
	    cpy	cur_buff_tracksec+1
	    beq	skip_fillbuff
	}
	cmp	cache_a_ts
	if (equal) {
	    ldx	#0
	    cpy	cache_a_ts+1
	    beq	in_cache
	}
	cmp	cache_b_ts
	if (equal) {
	    ldx	#1
	    cpy	cache_b_ts+1
	    beq	in_cache
	}
fillbuff:
	jsr	read_TS
skip_fillbuff:
	moveb	file_offset,buffer_index	;low byte becomes index...
	rts

in_cache:
	txa
	if (zero) {
	    movew #cache_a, source
	} else {
	    movew #cache_b, source
	}
	movew	source, cur_buff_tracksec
	movew	#disk_buffer, destination
	lda	#0
	jsr	small_block_move
	jmp	skip_fillbuff

;======================================================================
;	read in a segment
;======================================================================
d_read_segment::
	do {
	    jsr d_read_byte		;get a byte
put_address::
	    sta 0xFFFF			;put it into load address
	    dinc put_address+1		;point to next address
	    ddec number_of_bytes	;one less byte to load
	    lda number_of_bytes		;last byte to load???
	    ora number_of_bytes+1
	} until (zero)
	rts
;======================================================================
; d_write_segment
;                   buffer_pointer = start of segment
; 		    number_of_bytes = length of segment
; 		    tracksector = starting track and sector
;======================================================================
d_write_segment::
		movew start_tracksector,tracksector
		lda number_of_bytes	; round up number of sectors to save
		if (!zero) {
		    inc number_of_bytes+1
		}
		do {
retry_write:
		   ldx track
		   ldy sector
		   bank_IO_in
		   jsr save_sector
		   bank_IO_out
;		   if (carry) {
;			error	disk_write_error
;	    		jmp	retry_write
;		   }
		   jsr increment_TS
		   inc buffer_pointer+1
		   dec number_of_bytes+1
		} until (zero)
		rts
;======================================================================
;	get a single byte from buffer...
;	refill buffer if necessary
;======================================================================
d_read_byte::
	sty rb_y_save
	ldy buffer_index
	lda y[disk_buffer]			;get byte from buffer
	pha

	inc buffer_index		;point to next byte
	lda buffer_index		;test for end of buffer
	cmp #buffer_size&0x00FF
	if (equal) {
	    jsr increment_TS		;if so, point to next sector
	    jsr read_TS			;read next sector
	    clearb buffer_index		;reset index
	}

	ldy rb_y_save
	pla				;get byte saved
	rts

rb_y_save:	byte 0
;======================================================================
;	point to next sector
;======================================================================
increment_TS:
	inc sector
	lda sector
	ldy track
	cmp y[track_map]
	if (gt) {
	    moveb #0,sector
	    inc track
	    lda track
	    cmp #18		;directory
	    if (equal) {
	        inc track
	    }
	}
	rts

track_map:
	repeat 1  {byte 0}
	repeat 17 {byte 20}
	repeat 7  {byte 18}
	repeat 6  {byte 17}
	repeat 5  {byte 16}    

;======================================================================
read_TS:
	stx ts_x_save
	sty ts_y_save
retry_sector:
	ldx track
	ldy sector
	movew #disk_buffer,buffer_pointer
	bank_IO_in				; FRF
	jsr load_sector
	bank_IO_out				; FRF
	bcs	soft_disk_error
	ldx	#0
	ldy	#1
	movew	#disk_buffer, LRC_selfmod+1
	jsr	calc_LRC			; make sure it made it
	cmp	disk_sector_LRC
	bne	soft_disk_error
	moveb	#10,soft_error_count
	movew tracksector,cur_buff_tracksec
	ldx ts_x_save
	ldy ts_y_save
	rts

soft_error_count:	byte	10

soft_disk_error:
	dec	soft_error_count
	bne	retry_sector
	jsr	balloon_printf	
	string "Disk read error. Returning to Qlink"
	moveb	#quit_key, quit_flag
	jmp	quit_to_talk

ts_y_save:	byte 0
ts_x_save:	byte 0
;======================================================================
;	variables and tables
;======================================================================
define track = tracksector+1
define sector = tracksector
define buffer_size = 256

count:			block 1
temp_new:		block 1
tempoff:		block 2

define	cache_a	= back_drop + 2048
define	cache_b = cache_a + 256

clear_cache::
	clearw	cache_a_ts
	sta	cache_b_ts
	sta	cache_b_ts+1
	rts

load_cache::				; a = 0:cache_a 1:cache_b
					; xy = tracksector
	sta	cache_number
	if (zero) {
	    movew	#cache_a,destination
	    cpx	cache_a_ts
	    if (equal) {
		cpy	cache_a_ts+1
		if (equal) {
			rts
		}	;  already here!
	    }	
	} else {
	    movew	#cache_b,destination
	    cpx	cache_b_ts
	    if (equal) {
		cpy	cache_b_ts+1
		if (equal) {
			rts
		}
	    }	
	}
	stxy	start_tracksector
	clearw	file_offset
	jsr	d_seek_record
	movew	#disk_buffer, source
	lda	#0
	jsr	small_block_move
	lda	cache_number
	if (zero) {
	    movew	start_tracksector,cache_a_ts
	} else {
	    movew	start_tracksector,cache_b_ts
	}
	rts
