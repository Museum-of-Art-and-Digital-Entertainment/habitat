;---------------------------------------
;
;	animation cel data
;

house2_data::
	byte	out	+ 10
	byte	0b01000000
	byte	house2_start_end - house2_data
	byte	no_cont

	byte	8+up,8+up,255

	byte	0b11111110
	byte	0b10000000
	byte	0b01001000
	byte	0b11011100
	byte	0b00100000
	byte	0b00010000
	byte	0b00001000
	byte	0b00001010
	byte	0b00010100
	byte	0b00000010
	byte	0b01101010

	word	house2_data_a - house2_data
	word	house2_data_b - house2_data
	word	house2_data_c - house2_data
	word	house2_data_d - house2_data
	word	house2_data_e - house2_data
	word	house2_data_f - house2_data
	word	house2_data_g - house2_data

house2_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10


house2_data_a:
	byte	cel_trap + col + 0x08, 0x15, 0xfa, 0x08, 0x00, 0x00
	byte	pat_black
	byte	12,	20,	2,	30

house2_data_b:
	byte	cel_box + both_bord + 0x09+3, 0x1c, 0xfb, 0x27, 0x00, 0x00
	byte	0q1111

house2_data_c:
	byte	0x05, 0x0d, 0x01, 0x1f, 0x00, 0x00

	byte	2
	byte	run,0x80+1
	byte	run,5,2
	byte	3
	byte	run,5,2
	byte	170
	byte	run,0x80+1
	byte	run,5,170
	byte	255
	byte	run,5,170
	byte	run,0x80+13
	byte	170
	byte	run,0x80+1
	byte	run,5,170
	byte	255
	byte	run,5,170
	byte	128
	byte	run,0x80+1
	byte	run,5,128
	byte	192
	byte	run,5,128




house2_data_d:
	byte	0x05, 0x1e, 0xfc, 0x26, 0x00, 0x00

	byte	run,0x80+2
	byte	42
	byte	run,25,37
	byte	42
	byte	42
	byte	170
	byte	191
	byte	191
	byte	170
	byte	170
	byte	run,15,111
	byte	106
	byte	85
	byte	106
	byte	107
	byte	90
	byte	86
	byte	85
	byte	85
	byte	170
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	run,5,254
	byte	238
	byte	238
	byte	run,8,254
	byte	170
	byte	85
	byte	234
	byte	186
	byte	169
	byte	165
	byte	85
	byte	85
	byte	170
	byte	170
	byte	128
	byte	128
	byte	170
	byte	149
	byte	149
	byte	run,3,85
	byte	106
	byte	85
	byte	run,5,106
	byte	127
	byte	run,5,106
	byte	run,7,85
	byte	170
	byte	170
	byte	run,0x80+2
	byte	170
	byte	run,5,86
	byte	166
	byte	86
	byte	run,5,166
	byte	246
	byte	run,5,166
	byte	run,7,86
	byte	170
	byte	170




house2_data_e:

	byte	cel_trap + col + 0x0e, 0x80 + 0x0c, 0xfa, 0x33, 0x00, 0x00
	byte	pat_pink
	byte	13,	42,	2,	53


house2_data_f:
	byte	0x06, 0x0b, 0xfc, 0x31, 0x00, 0x00

	byte	191
	byte	47
	byte	11
	byte	2
	byte	run,0x80+7
	byte	run,4,255
	byte	191
	byte	47
	byte	11
	byte	2
	byte	run,0x80+3
	byte	run,8,255
	byte	191
	byte	46
	byte	8
	byte	run,5,255
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+2
	byte	255
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+6
	byte	128
	byte	run,0x80+10




house2_data_g:
	byte	0x03, 0x05, 0x01, 0x38, 0x00, 0x00

	byte	47
	byte	47
	byte	42
	byte	11
	byte	10
	byte	255
	byte	255
	byte	170
	byte	226
	byte	162
	byte	254
	byte	254
	byte	170
	byte	248
	byte	168




