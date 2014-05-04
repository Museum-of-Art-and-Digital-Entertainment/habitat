;---------------------------------------
;
;	animation cel data
;

demon2_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	demon2_start_end - demon2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	demon2_data_a - demon2_data
	word	demon2_data_b - demon2_data
	word	demon2_data_c - demon2_data

demon2_start_end:
	byte	0,0,1,1,0,0,2,2


demon2_data_a:
	byte	0x07, 0x17, 0xff, 0x01, 0x00, 0x00
	byte	run,0x80+14
	byte	2
	byte	9
	byte	9
	byte	37
	byte	38
	byte	40
	byte	32
	byte	run,0x80+9
	byte	2
	byte	9
	byte	37
	byte	38
	byte	170
	byte	170
	byte	165
	byte	86
	byte	169
	byte	86
	byte	169
	byte	165
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	85
	byte	90
	byte	101
	byte	165
	byte	153
	byte	90
	byte	105
	byte	165
	byte	90
	byte	165
	byte	run,5,85
	byte	170
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	run,4,85
	byte	101
	byte	101
	byte	149
	byte	86
	byte	154
	byte	105
	byte	85
	byte	85
	byte	90
	byte	160
	byte	run,0x80+1
	byte	8
	byte	166
	byte	154
	byte	111
	byte	111
	byte	run,3,91
	byte	111
	byte	190
	byte	105
	byte	85
	byte	85
	byte	86
	byte	152
	byte	232
	byte	160
	byte	96
	byte	128
	byte	128
	byte	run,0x80+4
	byte	2
	byte	130
	byte	169
	byte	165
	byte	149
	byte	150
	byte	150
	byte	149
	byte	85
	byte	90
	byte	96
	byte	128
	byte	run,0x80+10
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+12




demon2_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+9
	byte	10
	byte	2
	byte	run,0x80+1
	byte	10
	byte	38
	byte	38
	byte	153
	byte	150
	byte	152
	byte	160
	byte	128
	byte	run,0x80+4
	byte	1
	byte	2
	byte	2
	byte	10
	byte	38
	byte	41
	byte	42
	byte	46
	byte	46
	byte	190
	byte	249
	byte	166
	byte	149
	byte	149
	byte	85
	byte	86
	byte	155
	byte	170
	byte	153
	byte	run,3,37
	byte	9
	byte	2
	byte	85
	byte	102
	byte	154
	byte	154
	byte	86
	byte	85
	byte	86
	byte	86
	byte	154
	byte	154
	byte	153
	byte	86
	byte	run,3,85
	byte	86
	byte	171
	byte	154
	byte	run,5,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	96
	byte	160
	byte	160
	byte	224
	byte	224
	byte	250
	byte	190
	byte	104
	byte	90
	byte	90
	byte	86
	byte	85
	byte	154
	byte	168
	byte	152
	byte	run,3,96
	byte	128
	byte	run,0x80+10
	byte	128
	byte	run,0x80+2
	byte	128
	byte	96
	byte	96
	byte	152
	byte	88
	byte	152
	byte	40
	byte	8
	byte	run,0x80+4




demon2_data_c:
	byte	0x03, 0x0d, 0xff, 0xfc, 0x00, 0x00
	byte	run,13,5
	byte	run,13,85
	byte	run,13,64




