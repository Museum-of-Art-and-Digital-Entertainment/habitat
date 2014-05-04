	include "ronmacros2.m"
	include "datamacros.m"
	include "diskmacros.m"

chainto_filename::
	byte	"NTK"

quit_to_talk::
	jsr		get_loader_from_disk
	jmp		loader_start
	
get_loader_from_disk::
	jsr	goto_screen_2
	lda	loader_is_in_memory
	if (zero) {
		inc	 loader_is_in_memory
get_loader:
		open_file	#loader_file
		seek_byte	#0000
		read_segment	#loader_start, #end_of_loader-loader_start+1
		lda		loader_start
		cmp		#0x20		; jsr
		if (!equal) {
		    movew	#put_that_back,source
		    jsr		display_and_wait_for_key
		    jmp		get_loader
		}
	}
	rts	


display_and_wait_for_key::
	lda	quit_color
	sta	color
	ldx	#0
	jsr	draw_balloon
	do {
	    jsr	read_keyboard
	} while (zero)
	rts

loader_is_in_memory::	byte	1
quit_color::		byte	gray_3	
put_that_back:		string	"Put image disk back in!"
