;---------------------------------------
;
;	animation cel data
;

picture3_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,40+left,255

	byte	0b11100000

	word	picture3_data_a - picture3_data
	word	picture3_data_b - picture3_data
	word	picture3_data_c - picture3_data


picture3_data_a:
	byte	cel_box + both_bord + 0x07, 0x23, 0xfb, 0x28, 0x00, 0x00
	byte	0q1111

picture3_data_b:
	byte	0x07, 0x1f, 0xfb, 0x26, 0x00, 0x00
	byte	run,0x80+3
	byte	run,6,2
	byte	run,0x80+13
	byte	run,6,2
	byte	run,0x80+3
	byte	136
	byte	32
	byte	136
	byte	run,0x80+7
	byte	2
	byte	run,0x80+1
	byte	42
	byte	34
	byte	2
	byte	42
	byte	32
	byte	34
	byte	42
	byte	run,0x80+7
	byte	2
	byte	run,0x80+1
	byte	136
	byte	32
	byte	136
	byte	run,0x80+4
	byte	run,6,130
	byte	162
	byte	run,0x80+1
	byte	32
	byte	40
	byte	34
	byte	34
	byte	run,3,32
	byte	run,0x80+1
	byte	run,6,130
	byte	162
	byte	run,0x80+4
	byte	34
	byte	8
	byte	34
	byte	run,0x80+1
	byte	162
	byte	run,6,34
	byte	run,0x80+1
	byte	34
	byte	162
	byte	run,5,34
	byte	run,0x80+1
	byte	162
	byte	run,6,34
	byte	run,0x80+1
	byte	34
	byte	8
	byte	34
	byte	run,0x80+4
	byte	run,3,34
	byte	130
	byte	34
	byte	34
	byte	130
	byte	run,0x80+1
	byte	138
	byte	8
	byte	8
	byte	138
	byte	8
	byte	8
	byte	138
	byte	run,0x80+1
	byte	run,3,34
	byte	130
	byte	34
	byte	34
	byte	130
	byte	run,0x80+4
	byte	34
	byte	8
	byte	34
	byte	run,0x80+4
	byte	128
	byte	run,0x80+2
	byte	128
	byte	run,0x80+1
	byte	run,6,8
	byte	42
	byte	run,0x80+4
	byte	128
	byte	run,0x80+2
	byte	128
	byte	run,0x80+1
	byte	34
	byte	8
	byte	34
	byte	run,0x80+3
	byte	run,6,128
	byte	run,0x80+13
	byte	run,6,128
	byte	run,0x80+3




picture3_data_c:
	byte	0x07, 0x0c, 0xfb, 0x34, 0x00, 0x00
	byte	8
	byte	2
	byte	run,0x80+12
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+12
	byte	128
	byte	32
	byte	8
	byte	2
	byte	run,0x80+11
	byte	40
	byte	150
	byte	40
	byte	run,0x80+6
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+4
	byte	2
	byte	8
	byte	32
	byte	128
	byte	run,0x80+6
	byte	32
	byte	128
	byte	run,0x80+10




