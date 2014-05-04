;---------------------------------------
;
;	animation cel data
;

tree7_data::
	byte	both	+ 2
	byte	0b01000000
	byte	tree7_start_end - tree7_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000
	byte	0b10000000
	byte	0b01000000

	word	tree7_data_a - tree7_data
	word	tree7_data_b - tree7_data

tree7_start_end:
	byte	0,0,1,1,2,2


tree7_data_a:
	byte	0x03, 0x30, 0x00, 0x2f, 0x00, 0x00
	byte	10
	byte	run,0x80+3
	byte	run,5,2
	byte	run,5,10
	byte	run,3,42
	byte	run,11,170
	byte	run,3,42
	byte	run,5,10
	byte	run,3,42
	byte	run,4,170
	byte	168
	byte	168
	byte	run,3,160
	byte	138
	byte	run,9,170
	byte	run,4,168
	byte	run,3,160
	byte	run,3,128
	byte	run,0x80+8
	byte	run,4,128
	byte	run,5,160
	byte	168
	byte	168
	byte	170
	byte	run,3,10
	byte	run,3,2
	byte	run,0x80+2
	byte	168
	byte	162
	byte	run,3,128
	byte	run,0x80+37
	byte	run,3,128
	byte	run,3,160




tree7_data_b:
	byte	0x07, 0x20, 0xfe, 0x4b, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	run,3,9
	byte	37
	byte	39
	byte	37
	byte	39
	byte	157
	byte	149
	byte	157
	byte	181
	byte	159
	byte	149
	byte	157
	byte	151
	byte	157
	byte	37
	byte	39
	byte	9
	byte	2
	byte	2
	byte	run,0x80+7
	byte	10
	byte	37
	byte	157
	byte	119
	byte	85
	byte	213
	byte	125
	byte	213
	byte	85
	byte	117
	byte	87
	byte	85
	byte	213
	byte	run,4,85
	byte	213
	byte	85
	byte	85
	byte	213
	byte	85
	byte	221
	byte	85
	byte	117
	byte	157
	byte	39
	byte	9
	byte	2
	byte	run,0x80+4
	byte	130
	byte	105
	byte	85
	byte	87
	byte	85
	byte	117
	byte	87
	byte	run,4,85
	byte	117
	byte	85
	byte	213
	byte	run,3,85
	byte	117
	byte	run,6,85
	byte	213
	byte	117
	byte	85
	byte	149
	byte	42
	byte	run,0x80+2
	byte	168
	byte	86
	byte	run,27,85
	byte	170
	byte	2
	byte	9
	byte	165
	byte	run,26,85
	byte	90
	byte	160
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,22,85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+7
	byte	run,3,128
	byte	run,4,96
	byte	run,8,88
	byte	run,4,96
	byte	run,3,128
	byte	run,0x80+6




