;---------------------------------------
;
;	clear screen and page switch
;

switch_pages::

;	lda	0xdd00			; set up the hardware
;	and	#0xfc
;	ora	screen			; 0 for screen 2, 1 for screen 1
;	ora	#0b00000010		; 10 or 11 for banks 0 and 1
;	sta	0xdd00			; flip the switch

	lda	screen
	ora	#0x10
	sta	current_screen		; used in vblank!
	tax
	do {
	    bit	bitmap_on_flag
	} while (plus)			; allow async change ONLY when
	bank_IO_in
	stx	0xd018			; current scanline is Bitmap
	bank_IO_out

	ldx	#?bitmap_screen_2 & 0xf0
	lda	screen
	eor	#0b00001000
	sta	screen
	if (equal) {
		ldx	#?bitmap_screen_1 & 0xf0
	}
	stx	display_page		; hi-byte offset for page 2
	rts


copy_back_to_screen::			; copy background onto current screen
	lda	#?back_drop
	sta	hi_copy+2

	ldx	#?bitmap_screen_1
	lda	screen
	if (!equal) {
		ldx	#?bitmap_screen_2
	}
	stx	hi_copy+5

	ldx	#19
	do {
		ldy	#0
		do {
hi_copy:		lda	y[back_drop]
			sta	y[bitmap_screen_1]
			iny
		} while (!zero)

		inc	hi_copy+2
		inc	hi_copy+5
		dex
	} while (plus)
	rts



;;	ldx	#0
;;	lda	screen
;;	if (equal) {
;;		do {
;;		variable	background  = back_drop
;;		variable	screen_line = bitmap_screen_1
;;
;;			repeat 20 {			; 20 pages of screen
;;				lda	x[background]
;;				sta	x[screen_line]
;;
;;				background  += 0x0100
;;				screen_line += 0x0100
;;			}
;;			inx
;;		} while (!zero)
;;		rts
;;	}
;;
;;	do {
;;		background  = back_drop
;;		screen_line = bitmap_screen_2
;;
;;		repeat 20 {
;;			lda	x[background]
;;			sta	x[screen_line]
;;
;;			background  += 0x0100
;;			screen_line += 0x0100
;;		}
;;		inx
;;	} while (!zero)
;;	rts

;****************************************
;	clear background screen, or draw the grid
;****************************************
clear_back_drop::
	fill	back_drop, (0x1400), 0xff		;clear back_drop
	rts

screen::		byte	0
current_screen::	block	1			; used by vblank.m


