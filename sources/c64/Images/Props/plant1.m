;---------------------------------------
;
;	animation cel data
;

plant1_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000

	word	plant1_data_a - plant1_data


plant1_data_a:
	byte	0x04, 0x1c, 0xff, 0x13, 0x00, 0x00
	byte	8
	byte	run,0x80+2
	byte	2
	byte	9
	byte	2
	byte	run,0x80+22
	byte	170
	byte	run,0x80+2
	byte	160
	byte	88
	byte	86
	byte	149
	byte	38
	byte	8
	byte	40
	byte	38
	byte	37
	byte	9
	byte	9
	byte	10
	byte	37
	byte	9
	byte	42
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,4,9
	byte	2
	byte	2
	byte	run,3,128
	byte	130
	byte	137
	byte	165
	byte	149
	byte	154
	byte	160
	byte	138
	byte	165
	byte	150
	byte	102
	byte	104
	byte	98
	byte	137
	byte	165
	byte	137
	byte	138
	byte	101
	byte	102
	byte	166
	byte	136
	byte	96
	byte	96
	byte	128
	byte	run,0x80+5
	byte	128
	byte	96
	byte	96
	byte	88
	byte	150
	byte	40
	byte	run,0x80+1
	byte	128
	byte	run,0x80+4
	byte	128
	byte	96
	byte	128
	byte	32
	byte	128
	byte	run,0x80+8




