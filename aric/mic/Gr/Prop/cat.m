;---------------------------------------
;
;	animation cel data
;

cat_data::
	byte	swing	+ 2
	byte	0b11111000
	byte	cat_start_end - cat_data
	byte	no_cont

	byte	248+right,32+left,255

	byte	0b11100000
	byte	0b11010000
	byte	0b11001000

	word	cat_data_a - cat_data
	word	cat_data_b - cat_data
	word	cat_data_c - cat_data
	word	cat_data_d - cat_data
	word	cat_data_e - cat_data

cat_start_end:
	byte	cycle+0,2


cat_data_a:
	byte	cel_box + 0x01, 0x01, 0xfd, 0xf5, 0x00, 0x00
	byte	0x08

cat_data_b:
	byte	0x06, 0x0e, 0xfd, 0xff, 0x00, 0x00
	byte	2
	byte	run,3,9
	byte	10
	byte	9
	byte	2
	byte	2
	byte	run,0x80+1
	byte	run,5,2
	byte	160
	byte	96
	byte	104
	byte	150
	byte	85
	byte	86
	byte	90
	byte	149
	byte	169
	byte	85
	byte	90
	byte	101
	byte	138
	byte	run,0x80+2
	byte	2
	byte	162
	byte	90
	byte	86
	byte	85
	byte	150
	byte	89
	byte	169
	byte	86
	byte	150
	byte	102
	byte	138
	byte	2
	byte	168
	byte	88
	byte	88
	byte	86
	byte	85
	byte	149
	byte	105
	byte	run,5,85
	byte	165
	byte	10
	byte	42
	byte	run,3,149
	byte	106
	byte	101
	byte	101
	byte	90
	byte	run,4,85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	160
	byte	88
	byte	run,3,86
	byte	102
	byte	150
	byte	90
	byte	88
	byte	96
	byte	128
	byte	run,0x80+2




cat_data_c:
	byte	0x03, 0x0d, 0x03, 0x02, 0x00, 0x00
	byte	160
	byte	88
	byte	86
	byte	86
	byte	150
	byte	37
	byte	37
	byte	run,3,9
	byte	2
	byte	run,0x80+5
	byte	2
	byte	2
	byte	run,3,128
	byte	98
	byte	89
	byte	85
	byte	149
	byte	42
	byte	run,0x80+2
	byte	160
	byte	88
	byte	88
	byte	run,3,150
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1




cat_data_d:
	byte	0x02, 0x12, 0x03, 0x07, 0x00, 0x00
	byte	160
	byte	88
	byte	86
	byte	86
	byte	150
	byte	37
	byte	37
	byte	run,4,9
	byte	37
	byte	149
	byte	150
	byte	150
	byte	149
	byte	37
	byte	10
	byte	run,0x80+5
	byte	run,3,128
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+2
	byte	128
	byte	128
	byte	run,0x80+1




cat_data_e:
	byte	0x03, 0x11, 0x02, 0x06, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+2
	byte	160
	byte	88
	byte	86
	byte	86
	byte	149
	byte	37
	byte	37
	byte	150
	byte	86
	byte	88
	byte	run,3,96
	byte	90
	byte	85
	byte	149
	byte	42
	byte	run,0x80+4
	byte	run,3,128
	byte	run,0x80+7
	byte	128
	byte	128
	byte	run,0x80+1




