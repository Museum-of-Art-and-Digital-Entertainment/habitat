;---------------------------------------
;
;	animation cel data
;

sign2_data::
	byte	out	+ 1
	byte	0b01110000
	byte	sign2_start_end - sign2_data
	byte	no_cont

	byte	232+right,16+left,255

	byte	0b11111000
	byte	0b01111000

	word	sign2_data_a - sign2_data
	word	sign2_data_b - sign2_data
	word	sign2_data_c - sign2_data
	word	sign2_data_d - sign2_data
	word	sign2_data_e - sign2_data

sign2_start_end:
	byte	0,0,1,1


sign2_data_a:
	byte	cel_box + 0x01, 0x22, 0xff, 0x17, 0x00, 0x00
	byte	0xa8

sign2_data_b:
	byte	cel_trap + col + 0x07, 0x80 + 0x1c, 0xfc, 0x31, 0x00, 0x00
	byte	pat_wild
	byte	0,	26,	13,	13


sign2_data_c:
	byte	cel_trap + col + 0x07, 0x80 + 0x1c, 0xfc, 0x4b, 0x00, 0x00
	byte	pat_wild
	byte	13,	13,	0,	26

sign2_data_d:
	byte	0x07, 0x02, 0xfc, 0x31, 0x00, 0x00

	byte	21
	byte	21
	byte	run,10,85
	byte	80
	byte	80


sign2_data_e:
	byte	cel_text + 0x01, 0x01, 0xfe, 0x3f, 0x00, 0x00
	byte	pat_black
	byte	251


