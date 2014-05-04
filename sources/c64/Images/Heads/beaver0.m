;---------------------------------------
;
;	animation cel data
;

beaver0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	beaver0_start_end - beaver0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	beaver0_data_a - beaver0_data
	word	beaver0_data_b - beaver0_data
	word	beaver0_data_c - beaver0_data

beaver0_start_end:
	byte	0,0,1,1,0,0,2,2


beaver0_data_a:
	byte	0x05, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	37
	byte	37
	byte	10
	byte	run,0x80+6
	byte	2
	byte	run,0x80+1
	byte	run,4,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	165
	byte	run,8,85
	byte	165
	byte	170
	byte	149
	byte	run,3,170
	byte	149
	byte	149
	byte	150
	byte	150
	byte	86
	byte	90
	byte	101
	byte	166
	byte	8
	byte	40
	byte	152
	byte	88
	byte	86
	byte	run,3,85
	byte	run,3,86
	byte	85
	byte	85
	byte	89
	byte	165
	byte	170
	byte	170
	byte	191
	byte	170
	byte	85
	byte	149
	byte	85
	byte	85
	byte	86
	byte	168
	byte	128
	byte	run,0x80+5
	byte	128
	byte	98
	byte	107
	byte	91
	byte	91
	byte	171
	byte	86
	byte	85
	byte	85
	byte	86
	byte	90
	byte	170
	byte	168
	byte	240
	byte	168
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+10
	byte	run,4,128
	byte	run,0x80+1
	byte	run,4,128
	byte	run,0x80+13




beaver0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+5
	byte	10
	byte	21
	byte	149
	byte	21
	byte	149
	byte	21
	byte	149
	byte	37
	byte	10
	byte	run,0x80+12
	byte	3
	byte	run,3,2
	byte	162
	byte	89
	byte	85
	byte	101
	byte	106
	byte	101
	byte	run,4,85
	byte	170
	byte	170
	byte	175
	byte	170
	byte	37
	byte	149
	byte	149
	byte	153
	byte	153
	byte	154
	byte	152
	byte	32
	byte	255
	byte	254
	byte	170
	byte	170
	byte	85
	byte	169
	byte	run,3,190
	byte	170
	byte	85
	byte	101
	byte	169
	byte	165
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,5,85
	byte	170
	byte	run,0x80+6
	byte	138
	byte	101
	byte	85
	byte	89
	byte	169
	byte	89
	byte	run,3,85
	byte	86
	byte	168
	byte	168
	byte	232
	byte	168
	byte	96
	byte	88
	byte	88
	byte	run,4,152
	byte	32
	byte	run,0x80+4
	byte	128
	byte	96
	byte	80
	byte	88
	byte	80
	byte	88
	byte	80
	byte	88
	byte	96
	byte	128
	byte	run,0x80+12




beaver0_data_c:
	byte	0x03, 0x0c, 0xff, 0xfa, 0x00, 0x00
	byte	run,9,85
	byte	149
	byte	170
	byte	170
	byte	run,10,85
	byte	170
	byte	170
	byte	run,8,85
	byte	86
	byte	88
	byte	168
	byte	168




