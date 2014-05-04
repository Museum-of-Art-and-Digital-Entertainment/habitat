;---------------------------------------
;
;	animation cel data
;

angel1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	angel1_start_end - angel1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	angel1_data_a - angel1_data
	word	angel1_data_b - angel1_data
	word	angel1_data_c - angel1_data

angel1_start_end:
	byte	0,0,1,1,0,0,2,2


angel1_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	37
	byte	9
	byte	run,13,2
	byte	run,0x80+7
	byte	2
	byte	run,0x80+2
	byte	47
	byte	170
	byte	86
	byte	86
	byte	run,15,85
	byte	170
	byte	149
	byte	165
	byte	138
	byte	128
	byte	128
	byte	170
	byte	255
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	255
	byte	191
	byte	191
	byte	175
	byte	110
	byte	run,3,111
	byte	106
	byte	110
	byte	110
	byte	111
	byte	91
	byte	86
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	255
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	160
	byte	224
	byte	224
	byte	160
	byte	224
	byte	224
	byte	128
	byte	96
	byte	128
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	224
	byte	128




angel1_data_b:
	byte	0x05, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	41
	byte	run,4,9
	byte	10
	byte	run,5,2
	byte	run,0x80+13
	byte	3
	byte	2
	byte	170
	byte	86
	byte	86
	byte	91
	byte	91
	byte	111
	byte	110
	byte	run,3,111
	byte	110
	byte	107
	byte	106
	byte	86
	byte	run,3,149
	byte	37
	byte	42
	byte	37
	byte	9
	byte	run,3,2
	byte	10
	byte	47
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	175
	byte	251
	byte	255
	byte	239
	byte	255
	byte	186
	byte	187
	byte	186
	byte	254
	byte	185
	byte	185
	byte	101
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+2
	byte	170
	byte	255
	byte	170
	byte	run,0x80+2
	byte	170
	byte	85
	byte	85
	byte	149
	byte	149
	byte	run,4,229
	byte	230
	byte	230
	byte	166
	byte	166
	byte	run,4,86
	byte	88
	byte	160
	byte	96
	byte	128
	byte	run,0x80+3
	byte	168
	byte	254
	byte	168
	byte	run,0x80+2
	byte	128
	byte	96
	byte	88
	byte	160
	byte	run,6,128
	byte	run,0x80+17




angel1_data_c:
	byte	0x03, 0x10, 0xff, 0xfc, 0x00, 0x00
	byte	run,16,21
	byte	run,16,85
	byte	run,16,84




