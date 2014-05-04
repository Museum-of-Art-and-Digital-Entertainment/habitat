;  auto.m The Habitat exerciser
;  F Randall Farmer


mif(debug_mode) {
pick_a_command::
	dec cmd_cnt
	if (!zero) {rts}
	lda	#10
	sta cmd_cnt
	jsr	special_limitations
	if (carry) {rts}
	sei
	lda	rs232_rcv_buffer_end
	clc
	adc	rs232_send_buffer_end
	sta	rannum
	and	#0b00000111
	tax
	lda	x[xco]
	sta	cursor_x
	lda	x[yco]
	sta	cursor_y
	lda	rannum
	and	#0b00011000
	cmp	#0b00011000
	if (!equal) {
		cmp	#0b00010000
		if (!equal) {
			lda #command_GO
			sta command_selected
		} else {
			lda #function_key_7
			jsr keys_insert
		}
	} else {
		lda	#'A'
		jsr	keys_insert
		lda	#'C'
		jsr	keys_insert
		lda	#'K'
		jsr	keys_insert
		lda	#return_key
		jsr	keys_insert
	}
	cli
	rts

keys_insert:
        ldy     kb_buffer_pointer              ; insert A reg into buffer:
        iny
        cpy     #kb_buffer_length              ; increment and wrap pointer
        if (carry) {
                ldy     #0
        }
        cpy     kb_buffer_end                  ; check for end of buffer
        if (not_equal) {
                sta     y[kb_buffer]           ; if not, stuff the key and
                sty     kb_buffer_pointer      ; update the buffer pointer
        }
	rts

xco: 
		byte	cursor_left_bound
		byte	cursor_left_bound
		byte	cursor_left_bound+40
		byte	cursor_left_bound+80
		byte	cursor_left_bound+80
		byte	cursor_left_bound+120
		byte	cursor_left_bound+160
		byte	cursor_left_bound+160

yco:
		byte	cursor_bottom_bound-20
		byte	cursor_bottom_bound-20
		byte	cursor_bottom_bound-20
		byte	cursor_bottom_bound
		byte	quip_y+30
		byte	cursor_bottom_bound-20
		byte	cursor_bottom_bound-20
		byte	cursor_bottom_bound-20

rannum:
		byte	0

cmd_cnt:
		byte	50
}
