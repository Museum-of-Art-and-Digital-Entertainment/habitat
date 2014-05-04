;---------------------------------------
;
;	animation cel data
;

mouse0_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	mouse0_start_end - mouse0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	mouse0_data_a - mouse0_data
	word	mouse0_data_b - mouse0_data
	word	mouse0_data_c - mouse0_data

mouse0_start_end:
	byte	0,0,1,1,0,0,2,2


mouse0_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+9
	byte	run,11,2
	byte	run,0x80+10
	byte	47
	byte	42
	byte	run,3,37
	byte	165
	byte	149
	byte	149
	byte	run,7,85
	byte	86
	byte	89
	byte	89
	byte	103
	byte	167
	byte	151
	byte	159
	byte	159
	byte	158
	byte	158
	byte	151
	byte	39
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	191
	byte	187
	byte	190
	byte	127
	byte	127
	byte	95
	byte	87
	byte	run,4,95
	byte	159
	byte	158
	byte	158
	byte	152
	byte	152
	byte	160
	byte	224
	byte	248
	byte	184
	byte	184
	byte	32
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	232
	byte	248
	byte	232
	byte	184
	byte	190
	byte	126
	byte	250
	byte	250
	byte	186
	byte	224
	byte	run,3,128
	byte	run,0x80+10




mouse0_data_b:
	byte	0x05, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+16
	byte	2
	byte	2
	byte	run,4,9
	byte	37
	byte	run,3,39
	byte	37
	byte	9
	byte	2
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	46
	byte	171
	byte	191
	byte	183
	byte	191
	byte	151
	byte	run,4,167
	byte	103
	byte	231
	byte	231
	byte	233
	byte	250
	byte	254
	byte	253
	byte	253
	byte	245
	byte	86
	byte	168
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	171
	byte	187
	byte	186
	byte	239
	byte	239
	byte	171
	byte	171
	byte	255
	byte	187
	byte	255
	byte	223
	byte	223
	byte	run,3,87
	byte	85
	byte	85
	byte	170
	byte	run,3,137
	byte	2
	byte	run,0x80+6
	byte	128
	byte	128
	byte	224
	byte	224
	byte	168
	byte	248
	byte	120
	byte	248
	byte	88
	byte	104
	byte	104
	byte	106
	byte	106
	byte	101
	byte	run,3,109
	byte	189
	byte	run,3,255
	byte	125
	byte	85
	byte	170
	byte	run,0x80+18
	byte	run,4,128
	byte	run,5,96
	byte	128
	byte	run,0x80+1




mouse0_data_c:
	byte	0x04, 0x08, 0xfe, 0x04, 0x00, 0x00
	byte	run,8,1
	byte	run,3,64
	byte	80
	byte	run,3,84
	byte	85
	byte	run,0x80+8
	byte	run,3,5
	byte	21
	byte	run,4,85




