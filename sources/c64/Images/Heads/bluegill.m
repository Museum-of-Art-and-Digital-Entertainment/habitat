;---------------------------------------
;
;	animation cel data
;

bluegill_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bluegill_start_end - bluegill_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bluegill_data_a - bluegill_data
	word	bluegill_data_b - bluegill_data
	word	bluegill_data_c - bluegill_data

bluegill_start_end:
	byte	0,0,1,1,0,0,2,2


bluegill_data_a:
	byte	0x06, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+12
	byte	2
	byte	9
	byte	37
	byte	run,4,149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+9
	byte	2
	byte	2
	byte	9
	byte	37
	byte	154
	byte	run,5,102
	byte	101
	byte	89
	byte	85
	byte	85
	byte	165
	byte	10
	byte	run,0x80+2
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	154
	byte	85
	byte	86
	byte	89
	byte	165
	byte	101
	byte	101
	byte	run,3,102
	byte	90
	byte	149
	byte	run,4,85
	byte	165
	byte	10
	byte	40
	byte	152
	byte	88
	byte	90
	byte	101
	byte	101
	byte	85
	byte	86
	byte	86
	byte	run,3,85
	byte	150
	byte	106
	byte	90
	byte	85
	byte	85
	byte	149
	byte	106
	byte	85
	byte	85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+3
	byte	128
	byte	96
	byte	88
	byte	86
	byte	89
	byte	165
	byte	run,3,85
	byte	166
	byte	230
	byte	152
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+7
	byte	128
	byte	160
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+12




bluegill_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	run,5,9
	byte	run,3,2
	byte	run,0x80+7
	byte	1
	byte	run,4,2
	byte	41
	byte	153
	byte	101
	byte	102
	byte	169
	byte	run,3,85
	byte	150
	byte	171
	byte	154
	byte	run,3,149
	byte	42
	byte	37
	byte	9
	byte	9
	byte	2
	byte	85
	byte	86
	byte	170
	byte	170
	byte	86
	byte	101
	byte	101
	byte	153
	byte	86
	byte	run,4,85
	byte	154
	byte	155
	byte	86
	byte	101
	byte	101
	byte	153
	byte	86
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	160
	byte	152
	byte	102
	byte	101
	byte	169
	byte	run,3,85
	byte	89
	byte	170
	byte	154
	byte	run,3,88
	byte	160
	byte	96
	byte	128
	byte	128
	byte	run,0x80+9
	byte	run,6,128
	byte	run,0x80+10




bluegill_data_c:
	byte	0x03, 0x0f, 0xff, 0xfd, 0x00, 0x00
	byte	run,0x80+2
	byte	run,9,85
	byte	run,4,5
	byte	16
	byte	16
	byte	run,13,85
	byte	run,0x80+2
	byte	run,9,84
	byte	run,3,80
	byte	64




