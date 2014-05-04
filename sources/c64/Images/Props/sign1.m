;---------------------------------------
;
;	animation cel data
;

sign1_data::
	byte	out	+ 3
	byte	0b01000000
	byte	sign1_start_end - sign1_data
	byte	no_cont

	byte	240+right,40+left,255

	byte	0b11111100
	byte	0b11110100
	byte	0b11001100
	byte	0b11000100

	word	sign1_data_a - sign1_data
	word	sign1_data_b - sign1_data
	word	sign1_data_c - sign1_data
	word	sign1_data_d - sign1_data
	word	sign1_data_e - sign1_data
	word	sign1_data_f - sign1_data

sign1_start_end:
	byte	0,0,1,1,2,2,3,3


sign1_data_a:
	byte	cel_box + both_bord + 0x07, 0x23, 0xfb, 0x28, 0x00, 0x00
	byte	0q1111

sign1_data_b:
	byte	cel_box + 0x07, 0x1f, 0xfb, 0x26, 0x00, 0x00
	byte	0x00

sign1_data_c:
	byte	0x05, 0x03, 0xfc, 0x26, 0x00, 0x00

	byte	136
	byte	32
	byte	136
	byte	run,0x80+3
	byte	34
	byte	8
	byte	34
	byte	run,0x80+3
	byte	34
	byte	8
	byte	34




sign1_data_d:
	byte	0x05, 0x03, 0xfc, 0x0a, 0x00, 0x00

	byte	136
	byte	32
	byte	136
	byte	run,0x80+3
	byte	34
	byte	8
	byte	34
	byte	run,0x80+3
	byte	34
	byte	8
	byte	34




sign1_data_e:
	byte	0x07, 0x0c, 0xfb, 0x34, 0x00, 0x00

	byte	8
	byte	2
	byte	run,0x80+10
	byte	run,0x80+2
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+6
	byte	run,0x80+6
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+2
	byte	run,0x80+9
	byte	40
	byte	150
	byte	40
	byte	run,0x80+6
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+2
	byte	run,0x80+2
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+6
	byte	32
	byte	128
	byte	run,0x80+10




sign1_data_f:
	byte	cel_text + 0x01, 0x01, 0xfb, 0x22, 0x00, 0x00
	byte	pat_black
	byte	0


