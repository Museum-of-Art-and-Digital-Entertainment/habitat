;---------------------------------------
;
;	animation cel data
;

tree9_data::
	byte	both	+ 0
	byte	0b11100000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11100000

	word	tree9_data_a - tree9_data
	word	tree9_data_b - tree9_data
	word	tree9_data_c - tree9_data


tree9_data_a:
	byte	0x03, 0x29, 0xfe, 0x24, 0x00, 0x00

	byte	170
	byte	149
	byte	149
	byte	42
	byte	run,7,37
	byte	38
	byte	166
	byte	89
	byte	89
	byte	101
	byte	run,4,102
	byte	101
	byte	89
	byte	89
	byte	166
	byte	run,3,37
	byte	42
	byte	170
	byte	149
	byte	149
	byte	170
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+3
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,6,85
	byte	169
	byte	170
	byte	86
	byte	85
	byte	101
	byte	153
	byte	86
	byte	102
	byte	102
	byte	86
	byte	153
	byte	101
	byte	85
	byte	86
	byte	169
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,5,85
	byte	86
	byte	168
	byte	152
	byte	168
	byte	168
	byte	88
	byte	88
	byte	160
	byte	run,8,96
	byte	106
	byte	150
	byte	150
	byte	102
	byte	102
	byte	run,4,101
	byte	149
	byte	149
	byte	106
	byte	run,3,96
	byte	160
	byte	168
	byte	88
	byte	88
	byte	168
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+4




tree9_data_b:
	byte	0x02, 0x0e, 0xfc, 0x14, 0x00, 0x00

	byte	run,0x80+5
	byte	10
	byte	9
	byte	9
	byte	10
	byte	run,0x80+5
	byte	168
	byte	run,5,150
	byte	run,6,149
	byte	150
	byte	168




tree9_data_c:
	byte	0x02, 0x0e, 0x01, 0x14, 0x00, 0x00

	byte	168
	byte	run,4,88
	byte	90
	byte	89
	byte	89
	byte	90
	byte	run,4,88
	byte	168
	byte	run,0x80+5
	byte	run,4,128
	byte	run,0x80+5




