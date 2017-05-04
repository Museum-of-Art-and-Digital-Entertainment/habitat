;---------------------------------
;
;	defines and equates
;

	define	start_zpage	= 0x0010

	define	chars_at_top	= 9
	define	bitmap_offset	= chars_at_top*320
	define	colormap_offset	= chars_at_top*40

	define	Screen_1	= 0x4000	; for page flip
	define	Screen_2	= 0x6000
	define	Text_RAM_1	= 0x4400	; can change w/ flip
	define	Color_RAM	= 0xD800	; fixed


	define	Bitmap_screen_1	= screen_1   + bitmap_offset
	define	Bitmap_screen_2	= screen_2   + bitmap_offset
	define	back_drop	= 0xe000     + bitmap_offset
	define	bitmap_text	= text_RAM_1 + colormap_offset
	define	bitmap_colr	= color_RAM  + colormap_offset

	define	Screen_height	= 128	; scan lines in active area
	define	Screen_width	= 40	; bytes per scan line
