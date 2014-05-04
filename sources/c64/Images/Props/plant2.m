;---------------------------------------
;
;	animation cel data
;

plant2_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	plant2_data_a - plant2_data


plant2_data_a:
	byte	0x05, 0x12, 0xff, 0x09, 0x00, 0x00
	byte	run,0x80+3
	byte	170
	byte	37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	10
	byte	2
	byte	run,0x80+6
	byte	42
	byte	149
	byte	37
	byte	165
	byte	89
	byte	86
	byte	85
	byte	170
	byte	9
	byte	165
	byte	85
	byte	86
	byte	169
	byte	run,4,9
	byte	42
	byte	run,0x80+1
	byte	160
	byte	106
	byte	89
	byte	89
	byte	166
	byte	153
	byte	89
	byte	153
	byte	166
	byte	166
	byte	102
	byte	101
	byte	101
	byte	105
	byte	130
	byte	128
	byte	run,0x80+3
	byte	160
	byte	88
	byte	86
	byte	85
	byte	170
	byte	104
	byte	86
	byte	85
	byte	170
	byte	run,0x80+1
	byte	run,3,128
	byte	160
	byte	run,0x80+6
	byte	32
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,0x80+8




