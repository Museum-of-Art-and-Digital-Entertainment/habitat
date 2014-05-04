;---------------------------------------
;
;	animation cel data
;

turban0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	turban0_start_end - turban0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	turban0_data_a - turban0_data
	word	turban0_data_b - turban0_data
	word	turban0_data_c - turban0_data

turban0_start_end:
	byte	0,0,1,1,0,0,2,2


turban0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,5,2
	byte	run,3,9
	byte	37
	byte	42
	byte	run,3,37
	byte	42
	byte	37
	byte	9
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	171
	byte	171
	byte	91
	byte	91
	byte	90
	byte	85
	byte	149
	byte	105
	byte	86
	byte	85
	byte	149
	byte	105
	byte	86
	byte	85
	byte	149
	byte	41
	byte	2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	91
	byte	86
	byte	85
	byte	85
	byte	149
	byte	101
	byte	89
	byte	86
	byte	149
	byte	101
	byte	90
	byte	160
	byte	run,0x80+3
	byte	170
	byte	168
	byte	232
	byte	run,4,224
	byte	232
	byte	run,4,248
	byte	224
	byte	224
	byte	160
	byte	run,5,96
	byte	128
	byte	128
	byte	run,0x80+2




turban0_data_b:
	byte	0x05, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+15
	byte	2
	byte	2
	byte	run,3,9
	byte	10
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,5,191
	byte	run,3,111
	byte	91
	byte	86
	byte	85
	byte	149
	byte	101
	byte	89
	byte	150
	byte	37
	byte	9
	byte	2
	byte	255
	byte	238
	byte	run,3,170
	byte	171
	byte	239
	byte	run,12,255
	byte	170
	byte	run,4,85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,5,248
	byte	230
	byte	230
	byte	165
	byte	149
	byte	85
	byte	86
	byte	89
	byte	102
	byte	150
	byte	88
	byte	96
	byte	128
	byte	run,0x80+18
	byte	run,5,128
	byte	run,0x80+6




turban0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfd, 0x00, 0x00
	byte	2
	byte	2
	byte	10
	byte	10
	byte	run,3,42
	byte	41
	byte	37
	byte	run,4,21
	byte	5
	byte	1
	byte	2
	byte	138
	byte	run,5,170
	byte	run,8,85
	byte	run,0x80+2
	byte	run,3,128
	byte	run,3,160
	byte	96
	byte	run,4,80
	byte	64
	byte	run,0x80+1




