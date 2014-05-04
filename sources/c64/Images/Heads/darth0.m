;---------------------------------------
;
;	animation cel data
;

darth0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	darth0_start_end - darth0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	darth0_data_a - darth0_data
	word	darth0_data_b - darth0_data
	word	darth0_data_c - darth0_data

darth0_start_end:
	byte	0,0,1,1,0,0,2,2


darth0_data_a:
	byte	0x05, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+5
	byte	10
	byte	9
	byte	9
	byte	2
	byte	run,0x80+20
	byte	170
	byte	run,3,85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	run,6,2
	byte	run,0x80+5
	byte	run,4,37
	byte	159
	byte	run,8,85
	byte	255
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	24
	byte	run,3,88
	byte	90
	byte	213
	byte	127
	byte	run,7,85
	byte	253
	byte	87
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	160
	byte	88
	byte	252
	byte	94
	byte	94
	byte	118
	byte	118
	byte	246
	byte	253
	byte	94
	byte	86
	byte	86
	byte	254
	byte	88
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+2




darth0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+5
	byte	170
	byte	149
	byte	181
	byte	45
	byte	39
	byte	11
	byte	9
	byte	run,3,2
	byte	run,0x80+9
	byte	run,4,2
	byte	9
	byte	165
	byte	85
	byte	85
	byte	95
	byte	93
	byte	93
	byte	223
	byte	215
	byte	117
	byte	117
	byte	157
	byte	157
	byte	151
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,4,86
	byte	run,4,85
	byte	255
	byte	221
	byte	85
	byte	87
	byte	221
	byte	245
	byte	85
	byte	85
	byte	253
	byte	87
	byte	run,5,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	106
	byte	85
	byte	85
	byte	213
	byte	215
	byte	215
	byte	93
	byte	94
	byte	118
	byte	118
	byte	216
	byte	216
	byte	88
	byte	88
	byte	run,3,96
	byte	128
	byte	run,0x80+6
	byte	168
	byte	88
	byte	120
	byte	224
	byte	96
	byte	128
	byte	128
	byte	run,0x80+12




darth0_data_c:
	byte	0x05, 0x0b, 0xfe, 0xfb, 0x00, 0x00
	byte	21
	byte	5
	byte	5
	byte	1
	byte	1
	byte	run,0x80+6
	byte	run,7,85
	byte	95
	byte	53
	byte	213
	byte	run,8,85
	byte	255
	byte	run,8,85
	byte	84
	byte	84
	byte	212
	byte	116
	byte	92
	byte	84
	byte	80
	byte	64
	byte	64
	byte	run,0x80+8




