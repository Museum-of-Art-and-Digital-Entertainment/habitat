;---------------------------------------
;
;	animation cel data
;

princess0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	princess0_start_end - princess0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	princess0_data_a - princess0_data
	word	princess0_data_b - princess0_data
	word	princess0_data_c - princess0_data

princess0_start_end:
	byte	0,0,1,1,0,0,2,2


princess0_data_a:
	byte	0x04, 0x1f, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+1
	byte	42
	byte	149
	byte	149
	byte	run,3,37
	byte	run,9,9
	byte	run,3,2
	byte	run,0x80+13
	byte	47
	byte	170
	byte	86
	byte	86
	byte	run,14,85
	byte	149
	byte	37
	byte	10
	byte	9
	byte	11
	byte	run,3,9
	byte	2
	byte	run,0x80+3
	byte	40
	byte	184
	byte	run,3,248
	byte	190
	byte	run,3,191
	byte	190
	byte	run,3,191
	byte	186
	byte	187
	byte	107
	byte	110
	byte	111
	byte	90
	byte	85
	byte	85
	byte	170
	byte	85
	byte	255
	byte	101
	byte	153
	byte	153
	byte	154
	byte	32
	byte	152
	byte	32
	byte	run,0x80+6
	byte	128
	byte	224
	byte	160
	byte	224
	byte	232
	byte	254
	byte	184
	byte	160
	byte	run,3,224
	byte	128
	byte	160
	byte	88
	byte	88
	byte	160
	byte	run,5,128
	byte	run,0x80+4




princess0_data_b:
	byte	0x05, 0x1f, 0xfe, 0x08, 0x00, 0x00
	byte	run,0x80+2
	byte	42
	byte	149
	byte	149
	byte	run,3,37
	byte	run,10,9
	byte	2
	byte	run,0x80+12
	byte	3
	byte	2
	byte	170
	byte	run,3,86
	byte	91
	byte	111
	byte	111
	byte	110
	byte	run,3,111
	byte	110
	byte	107
	byte	110
	byte	111
	byte	111
	byte	90
	byte	149
	byte	37
	byte	10
	byte	9
	byte	11
	byte	run,3,9
	byte	2
	byte	run,0x80+3
	byte	255
	byte	run,5,254
	byte	255
	byte	255
	byte	171
	byte	254
	byte	239
	byte	255
	byte	187
	byte	186
	byte	255
	byte	254
	byte	187
	byte	255
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	255
	byte	101
	byte	153
	byte	153
	byte	154
	byte	32
	byte	152
	byte	32
	byte	run,0x80+2
	byte	170
	byte	run,3,85
	byte	149
	byte	run,7,229
	byte	165
	byte	229
	byte	229
	byte	149
	byte	86
	byte	88
	byte	96
	byte	run,6,128
	byte	run,0x80+6
	byte	160
	byte	88
	byte	88
	byte	run,3,96
	byte	run,10,128
	byte	run,0x80+13




princess0_data_c:
	byte	cel_box + 0x03, 0x10, 0xff, 0xfc, 0x00, 0x00
	byte	0x55

