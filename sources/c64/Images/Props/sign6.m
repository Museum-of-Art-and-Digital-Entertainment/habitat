;---------------------------------------
;
;	animation cel data
;

sign6_data::
	byte	out	+ 5
	byte	0b00100000
	byte	sign6_start_end - sign6_data
	byte	no_cont

	byte	244+up,60+up,251

	byte	0b11110000
	byte	0b11111000
	byte	0b00110000
	byte	0b00111000
	byte	0b00010000
	byte	0b00011000

	word	sign6_data_a - sign6_data
	word	sign6_data_b - sign6_data
	word	sign6_data_c - sign6_data
	word	sign6_data_d - sign6_data
	word	sign6_data_e - sign6_data

sign6_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


sign6_data_a:
	byte	cel_box + 0x01, 0x16, 0xf9, 0x00, 0x00, 0x00
	byte	0xaa

sign6_data_b:
	byte	cel_box + 0x01, 0x16, 0x04, 0x00, 0x00, 0x00
	byte	0xaa

sign6_data_c:
	byte	cel_box + both_bord + 0x05+9, 0x28, 0xf8, 0x28, 0x00, 0x00
	byte	0q1111

sign6_data_d:
	byte	cel_text + 0x01, 0x06, 0xf9, 0x24, 0x00, 0x00
	byte	pat_black
	byte	0

sign6_data_e:
	byte	cel_text + 0x01, 0x06, 0xf9, 0x23, 0x00, 0x00
	byte	pat_sky
	byte	1

