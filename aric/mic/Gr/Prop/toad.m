;---------------------------------------
;
;	animation cel data
;

toad_data::
	byte	out	+ 0
	byte	0b00000000
	byte	no_animation
	byte	toad_contents_xy - toad_data

	byte	24+right,24+right,255

	byte	0b10000000

	word	toad_data_a - toad_data

toad_contents_xy:
	byte	255,218


toad_data_a:
	byte	0x08, 0x1b, 0xfc, 0x1b, 0x00, 0x02
	byte	9
	byte	38
	byte	38
	byte	8
	byte	run,0x80+12
	byte	run,3,2
	byte	run,3,9
	byte	2
	byte	run,0x80+4
	byte	170
	byte	85
	byte	105
	byte	130
	byte	run,3,2
	byte	9
	byte	9
	byte	2
	byte	41
	byte	37
	byte	run,3,149
	byte	150
	byte	86
	byte	86
	byte	90
	byte	96
	byte	96
	byte	128
	byte	run,0x80+5
	byte	10
	byte	165
	byte	86
	byte	run,3,91
	byte	102
	byte	86
	byte	85
	byte	165
	byte	89
	byte	86
	byte	90
	byte	101
	byte	154
	byte	run,3,89
	byte	86
	byte	153
	byte	run,3,38
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	191
	byte	run,6,255
	byte	191
	byte	190
	byte	106
	byte	171
	byte	190
	byte	105
	byte	149
	byte	85
	byte	85
	byte	86
	byte	85
	byte	170
	byte	251
	byte	255
	byte	254
	byte	185
	byte	101
	byte	86
	byte	168
	byte	170
	byte	255
	byte	255
	byte	191
	byte	run,5,255
	byte	175
	byte	170
	byte	250
	byte	175
	byte	90
	byte	run,3,85
	byte	101
	byte	85
	byte	170
	byte	187
	byte	191
	byte	47
	byte	155
	byte	150
	byte	37
	byte	10
	byte	136
	byte	230
	byte	229
	byte	run,3,249
	byte	230
	byte	229
	byte	149
	byte	150
	byte	89
	byte	165
	byte	169
	byte	86
	byte	169
	byte	run,3,89
	byte	101
	byte	153
	byte	run,3,230
	byte	150
	byte	88
	byte	96
	byte	128
	byte	42
	byte	149
	byte	90
	byte	run,4,96
	byte	88
	byte	88
	byte	160
	byte	90
	byte	86
	byte	85
	byte	85
	byte	149
	byte	run,3,101
	byte	105
	byte	130
	byte	2
	byte	run,0x80+6
	byte	152
	byte	102
	byte	102
	byte	136
	byte	run,0x80+8
	byte	run,4,128
	byte	run,3,96
	byte	88
	byte	88
	byte	152
	byte	32
	byte	run,0x80+4




