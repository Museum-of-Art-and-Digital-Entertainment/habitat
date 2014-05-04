;---------------------------------------
;
;	animation cel data
;

tdoor_data::
	byte	swing	+ 1
	byte	0b00100000
	byte	tdoor_start_end - tdoor_data
	byte	no_cont

	byte	244+right,40+left,0

	byte	0b10100000
	byte	0b11100000

	word	tdoor_data_a - tdoor_data
	word	tdoor_data_b - tdoor_data
	word	tdoor_data_c - tdoor_data

tdoor_start_end:
	byte	0,0,1,1


tdoor_data_a:
	byte	cel_box + 0x01, 0x01, 0xfb, 0x09, 0x00, 0x00
	byte	0x08

tdoor_data_b:
	byte	0x0b, 0x06, 0xfa, 0x0b, 0x06, 0xfc
	byte	2
	byte	run,0x80+5
	byte	170
	byte	138
	byte	34
	byte	8
	byte	2
	byte	run,0x80+1
	byte	run,4,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	run,5,170
	byte	run,0x80+1
	byte	170
	byte	170
	byte	162
	byte	136
	byte	32
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+5




tdoor_data_c:
	byte	0x0b, 0x06, 0xfa, 0x0b, 0x00, 0x00
	byte	2
	byte	run,0x80+5
	byte	170
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+5




