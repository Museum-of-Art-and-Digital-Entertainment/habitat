;---------------------------------------
;
;	animation cel data
;

plant3_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	plant3_data_a - plant3_data


plant3_data_a:
	byte	0x05, 0x18, 0xff, 0x0e, 0x00, 0x00
	byte	run,6,2
	byte	34
	byte	34
	byte	32
	byte	40
	byte	38
	byte	run,4,37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	2
	byte	run,0x80+2
	byte	130
	byte	96
	byte	88
	byte	86
	byte	run,3,85
	byte	149
	byte	150
	byte	37
	byte	170
	byte	85
	byte	85
	byte	86
	byte	89
	byte	165
	byte	run,3,37
	byte	149
	byte	154
	byte	160
	byte	run,0x80+1
	byte	1
	byte	169
	byte	9
	byte	10
	byte	38
	byte	166
	byte	run,3,89
	byte	90
	byte	165
	byte	89
	byte	153
	byte	166
	byte	169
	byte	102
	byte	run,4,101
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	128
	byte	128
	byte	run,0x80+1
	byte	2
	byte	9
	byte	165
	byte	85
	byte	86
	byte	86
	byte	168
	byte	106
	byte	85
	byte	85
	byte	86
	byte	88
	byte	160
	byte	128
	byte	128
	byte	run,3,96
	byte	88
	byte	160
	byte	run,0x80+2
	byte	run,6,128
	byte	run,0x80+3
	byte	160
	byte	96
	byte	128
	byte	run,0x80+10




