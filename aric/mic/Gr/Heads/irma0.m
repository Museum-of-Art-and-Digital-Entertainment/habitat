;---------------------------------------
;
;	animation cel data
;

irma0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	irma0_start_end - irma0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	irma0_data_a - irma0_data
	word	irma0_data_b - irma0_data
	word	irma0_data_c - irma0_data

irma0_start_end:
	byte	0,0,1,1,0,0,2,2


irma0_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	37
	byte	37
	byte	run,17,9
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	170
	byte	run,20,85
	byte	149
	byte	42
	byte	40
	byte	184
	byte	248
	byte	170
	byte	91
	byte	run,3,111
	byte	110
	byte	run,3,111
	byte	107
	byte	106
	byte	107
	byte	106
	byte	90
	byte	101
	byte	101
	byte	89
	byte	89
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	224
	byte	160
	byte	224
	byte	248
	byte	240
	byte	160
	byte	232
	byte	224
	byte	170
	byte	86
	byte	86
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




irma0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	run,17,9
	byte	2
	byte	2
	byte	run,0x80+3
	byte	3
	byte	2
	byte	2
	byte	170
	byte	90
	byte	91
	byte	91
	byte	111
	byte	110
	byte	run,4,111
	byte	106
	byte	107
	byte	107
	byte	90
	byte	101
	byte	101
	byte	89
	byte	86
	byte	85
	byte	85
	byte	149
	byte	37
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	171
	byte	186
	byte	171
	byte	255
	byte	239
	byte	187
	byte	186
	byte	239
	byte	171
	byte	170
	byte	run,3,85
	byte	86
	byte	run,4,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,3,149
	byte	run,6,229
	byte	run,3,165
	byte	149
	byte	101
	byte	101
	byte	149
	byte	85
	byte	86
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3
	byte	run,18,128
	byte	run,0x80+5




irma0_data_c:
	byte	cel_box + 0x03, 0x11, 0xff, 0xfe, 0x00, 0x00
	byte	0x55

