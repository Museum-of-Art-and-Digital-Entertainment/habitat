;---------------------------------------
;
;	animation cel data
;

sign5_data::
	byte	out	+ 9
	byte	0b00000110
	byte	sign5_start_end - sign5_data
	byte	no_cont

	byte	228+right,28+left,255

	byte	0b11111101
	byte	0b01111101
	byte	0b00111101
	byte	0b00011101
	byte	0b11111011
	byte	0b01111011
	byte	0b00111011
	byte	0b00011011
	byte	0b00000101
	byte	0b00000011

	word	sign5_data_a - sign5_data
	word	sign5_data_b - sign5_data
	word	sign5_data_c - sign5_data
	word	sign5_data_d - sign5_data
	word	sign5_data_e - sign5_data
	word	sign5_data_f - sign5_data
	word	sign5_data_g - sign5_data
	word	sign5_data_h - sign5_data

sign5_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9


sign5_data_a:
	byte	cel_box + 0x01, 0x12, 0xff, 0x01, 0x00, 0x00
	byte	0x2e

sign5_data_b:
	byte	cel_box + 0x01, 0x13, 0xff, 0x14, 0x00, 0x00
	byte	0x2e

sign5_data_c:
	byte	cel_box + 0x01, 0x15, 0xff, 0x29, 0x00, 0x00
	byte	0x2e

sign5_data_d:
	byte	cel_box + 0x01, 0x14, 0xff, 0x3d, 0x00, 0x00
	byte	0x2e

sign5_data_e:
	byte	0x01, 0x03, 0xff, 0x4b, 0x00, 0x00

	byte	46
	byte	46
	byte	8




sign5_data_f:
	byte	cel_box + both_bord + 0x07, 0x0b, 0xfc, 0x48, 0x00, 0x00
	byte	0q1111

sign5_data_g:
	byte	cel_box + both_bord + 0x09, 0x0b, 0xfb, 0x48, 0x00, 0x00
	byte	0q1111

sign5_data_h:
	byte	cel_text + 0x01, 0x01, 0xfb, 0x46, 0x00, 0x00
	byte	pat_black
	byte	1


