;---------------------------------------
;
;	animation cel data
;

tree5_data::
	byte	both	+ 3
	byte	0b01100000
	byte	tree5_start_end - tree5_data
	byte	no_cont

	byte	244+right,32+left,255

	byte	0b11100000
	byte	0b01100000
	byte	0b00100000
	byte	0b11000000

	word	tree5_data_a - tree5_data
	word	tree5_data_b - tree5_data
	word	tree5_data_c - tree5_data

tree5_start_end:
	byte	0,0,1,1,2,2,3,3


tree5_data_a:
	byte	0x03, 0x04, 0xfb, 0x03, 0x00, 0x00
	byte	run,0x80+2
	byte	42
	byte	128
	byte	run,0x80+1
	byte	42
	byte	170
	byte	run,0x80+1
	byte	2
	byte	170
	byte	170
	byte	42




tree5_data_b:
	byte	0x03, 0x13, 0xfe, 0x11, 0x00, 0x00
	byte	42
	byte	165
	byte	run,5,149
	byte	181
	byte	189
	byte	45
	byte	45
	byte	37
	byte	37
	byte	run,4,9
	byte	2
	byte	2
	byte	160
	byte	88
	byte	86
	byte	run,6,85
	byte	87
	byte	run,3,95
	byte	87
	byte	85
	byte	85
	byte	106
	byte	170
	byte	170
	byte	run,0x80+3
	byte	run,8,128
	byte	96
	byte	224
	byte	run,4,96
	byte	160
	byte	160




tree5_data_c:
	byte	0x08, 0x17, 0xfc, 0x28, 0x00, 0xfc
	byte	run,0x80+4
	byte	2
	byte	9
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+12
	byte	10
	byte	165
	byte	run,6,85
	byte	245
	byte	253
	byte	255
	byte	191
	byte	47
	byte	11
	byte	11
	byte	2
	byte	2
	byte	run,0x80+4
	byte	2
	byte	42
	byte	149
	byte	run,3,85
	byte	93
	byte	run,3,127
	byte	93
	byte	run,8,85
	byte	149
	byte	39
	byte	10
	byte	run,0x80+1
	byte	170
	byte	run,11,85
	byte	87
	byte	95
	byte	95
	byte	87
	byte	run,3,85
	byte	245
	byte	253
	byte	255
	byte	170
	byte	160
	byte	90
	byte	85
	byte	85
	byte	125
	byte	run,3,255
	byte	127
	byte	95
	byte	run,3,85
	byte	213
	byte	213
	byte	run,3,85
	byte	run,3,87
	byte	86
	byte	168
	byte	run,0x80+2
	byte	160
	byte	90
	byte	85
	byte	85
	byte	run,3,213
	byte	85
	byte	87
	byte	95
	byte	93
	byte	run,4,85
	byte	254
	byte	254
	byte	248
	byte	96
	byte	128
	byte	run,0x80+5
	byte	160
	byte	88
	byte	86
	byte	run,5,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+13
	byte	128
	byte	run,3,96
	byte	128
	byte	run,0x80+11




