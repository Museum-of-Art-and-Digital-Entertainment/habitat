;---------------------------------------
;
;	animation cel data
;

sign3_data::
	byte	out	+ 3
	byte	0b00000100
	byte	sign3_start_end - sign3_data
	byte	no_cont

	byte	208+right,12+left,255

	byte	0b11111110
	byte	0b00011110
	byte	0b00000110
	byte	0b11111000

	word	sign3_data_a - sign3_data
	word	sign3_data_b - sign3_data
	word	sign3_data_c - sign3_data
	word	sign3_data_d - sign3_data
	word	sign3_data_e - sign3_data
	word	sign3_data_f - sign3_data
	word	sign3_data_g - sign3_data

sign3_start_end:
	byte	0,0,1,1,2,2,3,3


sign3_data_a:
	byte	cel_box + 0x01, 0x5f, 0x05, 0x4d, 0x00, 0x00
	byte	0xaa

sign3_data_b:
	byte	cel_box + 0x08, 0x05, 0xfd, 0x4d, 0x00, 0x00
	byte	0xaa

sign3_data_c:
	byte	0x02, 0x08, 0x03, 0x48, 0x00, 0x00

	byte	run,0x80+4
	byte	2
	byte	8
	byte	32
	byte	128
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+4




sign3_data_d:
	byte	cel_box + 0x01, 0x06, 0x02, 0x48, 0x00, 0x00
	byte	0x20

sign3_data_e:
	byte	cel_box + 0x01, 0x06, 0xfd, 0x48, 0x00, 0x00
	byte	0x02

sign3_data_f:
	byte	cel_box + both_bord + 0x08, 0x20, 0xfc, 0x42, 0x00, 0x00
	byte	0q1111

sign3_data_g:
	byte	cel_text + 0x01, 0x01, 0xfc, 0x3e, 0x00, 0x00
	byte	pat_black
	byte	1


