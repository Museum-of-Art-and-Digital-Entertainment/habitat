;---------------------------------------
;
;	animation cel data
;

angel0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	angel0_start_end - angel0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	angel0_data_a - angel0_data
	word	angel0_data_b - angel0_data

angel0_start_end:
	byte	0,0,1,1,0,0,1,1


angel0_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	run,12,2
	byte	10
	byte	run,6,8
	byte	10
	byte	47
	byte	10
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	run,4,85
	byte	170
	byte	149
	byte	149
	byte	37
	byte	10
	byte	32
	byte	run,0x80+1
	byte	170
	byte	255
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	254
	byte	run,3,255
	byte	239
	byte	175
	byte	111
	byte	111
	byte	107
	byte	91
	byte	170
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+2
	byte	170
	byte	255
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,4,224
	byte	160
	byte	224
	byte	232
	byte	run,4,248
	byte	160
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+4
	byte	128
	byte	224
	byte	128




angel0_data_b:
	byte	0x03, 0x1d, 0xff, 0x06, 0x00, 0x00
	byte	3
	byte	run,3,2
	byte	run,3,11
	byte	47
	byte	47
	byte	46
	byte	run,4,191
	byte	175
	byte	154
	byte	155
	byte	154
	byte	149
	byte	170
	byte	149
	byte	37
	byte	9
	byte	2
	byte	8
	byte	run,0x80+1
	byte	42
	byte	191
	byte	42
	byte	255
	byte	254
	byte	170
	byte	170
	byte	239
	byte	run,3,255
	byte	171
	byte	254
	byte	239
	byte	run,3,255
	byte	187
	byte	186
	byte	255
	byte	255
	byte	190
	byte	170
	byte	run,3,85
	byte	170
	byte	32
	byte	32
	byte	170
	byte	255
	byte	170
	byte	run,0x80+4
	byte	run,3,128
	byte	run,3,224
	byte	run,4,248
	byte	232
	byte	run,3,152
	byte	88
	byte	168
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3
	byte	160
	byte	248
	byte	160




