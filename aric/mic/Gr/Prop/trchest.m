;---------------------------------------
;
;	animation cel data
;

trchest_data::
	byte	both	+ 1
	byte	0b11100000
	byte	trchest_start_end - trchest_data
	byte	no_cont

	byte	244+right,36+left,255

	byte	0b11000000
	byte	0b10100000

	word	trchest_data_a - trchest_data
	word	trchest_data_b - trchest_data
	word	trchest_data_c - trchest_data

trchest_start_end:
	byte	0,0,1,1


trchest_data_a:
	byte	0x07, 0x18, 0xfe, 0xfc, 0x00, 0x00
	byte	10
	byte	run,6,37
	byte	42
	byte	run,5,37
	byte	42
	byte	run,5,37
	byte	42
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	187
	byte	run,3,191
	byte	170
	byte	170
	byte	106
	byte	91
	byte	170
	byte	170
	byte	run,6,149
	byte	170
	byte	149
	byte	154
	byte	run,3,155
	byte	171
	byte	run,5,155
	byte	run,3,170
	byte	246
	byte	170
	byte	170
	byte	run,6,85
	byte	170
	byte	85
	byte	170
	byte	255
	byte	run,5,239
	byte	171
	byte	239
	byte	255
	byte	run,3,170
	byte	85
	byte	170
	byte	170
	byte	run,6,91
	byte	171
	byte	91
	byte	run,4,155
	byte	171
	byte	run,5,155
	byte	run,3,170
	byte	191
	byte	170
	byte	170
	byte	249
	byte	249
	byte	185
	byte	249
	byte	249
	byte	185
	byte	250
	byte	249
	byte	185
	byte	249
	byte	249
	byte	185
	byte	250
	byte	249
	byte	185
	byte	run,3,249
	byte	170
	byte	169
	byte	165
	byte	150
	byte	168
	byte	128
	byte	run,6,96
	byte	160
	byte	run,5,96
	byte	160
	byte	run,5,96
	byte	160
	byte	96
	byte	128
	byte	run,0x80+2




trchest_data_b:
	byte	0x07, 0x0a, 0xfe, 0x01, 0x00, 0x00
	byte	42
	byte	run,4,37
	byte	9
	byte	10
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	187
	byte	191
	byte	191
	byte	170
	byte	170
	byte	run,5,149
	byte	170
	byte	149
	byte	149
	byte	170
	byte	170
	byte	run,5,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	run,5,91
	byte	171
	byte	91
	byte	91
	byte	170
	byte	170
	byte	249
	byte	249
	byte	185
	byte	249
	byte	249
	byte	186
	byte	249
	byte	250
	byte	168
	byte	160
	byte	run,4,96
	byte	run,3,128
	byte	run,0x80+2




trchest_data_c:
	byte	0x07, 0x13, 0xfe, 0x0f, 0x00, 0x00
	byte	run,4,2
	byte	run,4,10
	byte	run,8,42
	byte	32
	byte	8
	byte	run,0x80+1
	byte	run,16,170
	byte	191
	byte	111
	byte	run,17,170
	byte	149
	byte	229
	byte	run,17,170
	byte	85
	byte	85
	byte	run,17,170
	byte	91
	byte	111
	byte	run,17,170
	byte	249
	byte	230
	byte	168
	byte	run,0x80+4
	byte	run,4,128
	byte	run,8,160
	byte	32
	byte	128
	byte	run,0x80+1




