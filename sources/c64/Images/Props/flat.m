;---------------------------------------
;
;	animation cel data
;

flat_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	236+right,28+left,246

	byte	0b11000000

	word	flat_data_a - flat_data
	word	flat_data_b - flat_data


flat_data_a:
	byte	cel_box + 0x01, 0x01, 0x00, 0xfb, 0x00, 0x00
	byte	0x80

flat_data_b:
	byte	0x05, 0x1c, 0xff, 0x02, 0x00, 0x00

	byte	run,0x80+9
	byte	136
	byte	40
	byte	170
	byte	9
	byte	9
	byte	2
	byte	run,0x80+6
	byte	run,4,2
	byte	42
	byte	10
	byte	34
	byte	run,0x80+2
	byte	run,7,2
	byte	9
	byte	9
	byte	137
	byte	101
	byte	85
	byte	85
	byte	run,4,149
	byte	37
	byte	149
	byte	85
	byte	89
	byte	89
	byte	105
	byte	130
	byte	run,0x80+2
	byte	32
	byte	152
	byte	run,7,86
	byte	run,13,85
	byte	153
	byte	153
	byte	85
	byte	86
	byte	168
	byte	32
	byte	run,0x80+9
	byte	128
	byte	128
	byte	138
	byte	101
	byte	85
	byte	86
	byte	run,4,88
	byte	96
	byte	88
	byte	86
	byte	150
	byte	150
	byte	166
	byte	10
	byte	2
	byte	2
	byte	run,0x80+9
	byte	136
	byte	160
	byte	168
	byte	128
	byte	128
	byte	run,0x80+11
	byte	160
	byte	128
	byte	32




