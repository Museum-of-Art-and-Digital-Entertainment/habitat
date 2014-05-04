;---------------------------------------
;
;	animation cel data
;

sign4_data::
	byte	out	+ 3
	byte	0b11000000
	byte	sign4_start_end - sign4_data
	byte	no_cont

	byte	240+right,56+left,255

	byte	0b10010000
	byte	0b10011000
	byte	0b11110000
	byte	0b11111000

	word	sign4_data_a - sign4_data
	word	sign4_data_b - sign4_data
	word	sign4_data_c - sign4_data
	word	sign4_data_d - sign4_data
	word	sign4_data_e - sign4_data

sign4_start_end:
	byte	0,0,1,1,2,2,3,3


sign4_data_a:
	byte	cel_box + both_bord + 0x0c, 0x10, 0xf8, 0x27, 0x00, 0x00
	byte	0q1111

sign4_data_b:
	byte	cel_box + both_bord + 0x0c, 0x10, 0x03, 0x27, 0x00, 0x00
	byte	0q1111

sign4_data_c:
	byte	cel_box + 0x02, 0x0e, 0x03, 0x26, 0x00, 0x00
	byte	0x55

sign4_data_d:
	byte	cel_text + 0x01, 0x01, 0xf8, 0x23, 0x00, 0x00
	byte	pat_black
	byte	2


sign4_data_e:
	byte	cel_text + 0x01, 0x01, 0xf8, 0x22, 0x00, 0x00
	byte	pat_sky
	byte	3
