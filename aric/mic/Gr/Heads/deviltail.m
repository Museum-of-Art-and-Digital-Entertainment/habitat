;---------------------------------------
;
;	animation cel data
;

deviltail_data::
	byte	swing	+ 3
	byte	0b10100000
	byte	deviltail_start_end - deviltail_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01000000
	byte	0b01110000
	byte	0b10000000

	word	deviltail_data_a - deviltail_data
	word	deviltail_data_b - deviltail_data
	word	deviltail_data_c - deviltail_data
	word	deviltail_data_d - deviltail_data

deviltail_start_end:
	byte	0,0,1,1,3,3,2,2


deviltail_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,5,2
	byte	run,9,9
	byte	2
	byte	run,0x80+4
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	150
	byte	run,6,89
	byte	101
	byte	101
	byte	150
	byte	105
	byte	run,5,85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	40
	byte	152
	byte	90
	byte	89
	byte	101
	byte	150
	byte	run,3,91
	byte	111
	byte	190
	byte	153
	byte	101
	byte	85
	byte	85
	byte	86
	byte	90
	byte	89
	byte	85
	byte	86
	byte	85
	byte	85
	byte	89
	byte	162
	byte	run,0x80+3
	byte	160
	byte	88
	byte	88
	byte	160
	byte	run,4,224
	byte	168
	byte	88
	byte	102
	byte	86
	byte	168
	byte	224
	byte	run,3,160
	byte	128
	byte	160
	byte	run,3,96
	byte	128




deviltail_data_b:
	byte	0x05, 0x19, 0xfe, 0x02, 0x00, 0xff
	byte	run,0x80+7
	byte	2
	byte	10
	byte	run,4,9
	byte	2
	byte	run,0x80+11
	byte	1
	byte	run,3,2
	byte	9
	byte	37
	byte	154
	byte	91
	byte	107
	byte	191
	byte	186
	byte	165
	byte	105
	byte	85
	byte	150
	byte	155
	byte	170
	byte	165
	byte	149
	byte	149
	byte	37
	byte	45
	byte	190
	byte	186
	byte	160
	byte	85
	byte	86
	byte	170
	byte	86
	byte	85
	byte	169
	byte	254
	byte	run,3,255
	byte	170
	byte	85
	byte	101
	byte	85
	byte	154
	byte	155
	byte	86
	byte	run,5,85
	byte	86
	byte	170
	byte	run,0x80+5
	byte	128
	byte	96
	byte	152
	byte	150
	byte	166
	byte	249
	byte	185
	byte	105
	byte	165
	byte	86
	byte	88
	byte	152
	byte	168
	byte	104
	byte	88
	byte	88
	byte	96
	byte	224
	byte	248
	byte	184
	byte	40
	byte	run,0x80+9
	byte	run,4,128
	byte	run,0x80+12




deviltail_data_c:
	byte	cel_box + 0x03, 0x04, 0xff, 0xf6, 0xff, 0x02
	byte	0x55

deviltail_data_d:
	byte	0x04, 0x15, 0xfd, 0xd6, 0x00, 0x00
	byte	32
	byte	40
	byte	38
	byte	run,3,37
	byte	38
	byte	40
	byte	32
	byte	run,0x80+12
	byte	42
	byte	149
	byte	106
	byte	128
	byte	96
	byte	128
	byte	run,0x80+15
	byte	128
	byte	96
	byte	88
	byte	152
	byte	152
	byte	run,6,38
	byte	run,6,9
	byte	2
	byte	run,0x80+14
	byte	run,5,128
	byte	96
	byte	90
	byte	149
	byte	37
	byte	10




