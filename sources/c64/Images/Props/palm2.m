;---------------------------------------
;
;	animation cel data
;

palm2_data::
	byte	both	+ 4
	byte	0b00001100
	byte	palm2_start_end - palm2_data
	byte	no_cont

	byte	244+right,28+left,1

	byte	0b11111100
	byte	0b11100000
	byte	0b00010000
	byte	0b00001100
	byte	0b11110000

	word	palm2_data_a - palm2_data
	word	palm2_data_b - palm2_data
	word	palm2_data_c - palm2_data
	word	palm2_data_d - palm2_data
	word	palm2_data_e - palm2_data
	word	palm2_data_f - palm2_data

palm2_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


palm2_data_a:
	byte	0x04, 0x04, 0xff, 0xd8, 0x00, 0x00
	byte	138
	byte	run,0x80+3
	byte	162
	byte	run,3,42
	byte	run,4,170
	byte	run,0x80+1
	byte	168
	byte	128
	byte	128




palm2_data_b:
	byte	0x02, 0x2d, 0x00, 0x05, 0x00, 0x00
	byte	run,11,42
	byte	run,11,10
	byte	run,7,2
	byte	run,0x80+16
	byte	run,5,170
	byte	run,19,168
	byte	run,10,170
	byte	run,6,42
	byte	run,5,10




palm2_data_c:
	byte	0x01, 0x0b, 0x02, 0x05, 0x00, 0x00
	byte	run,7,128
	byte	run,4,160




palm2_data_d:
	byte	0x03, 0x16, 0x01, 0x1b, 0x00, 0x00
	byte	10
	byte	run,5,2
	byte	run,0x80+16
	byte	160
	byte	160
	byte	run,4,168
	byte	run,5,170
	byte	run,5,42
	byte	run,6,10
	byte	run,0x80+11
	byte	run,4,128
	byte	run,7,160




palm2_data_e:
	byte	0x0c, 0x15, 0xfd, 0x31, 0x00, 0x00
	byte	40
	byte	38
	byte	37
	byte	9
	byte	9
	byte	run,3,2
	byte	run,0x80+15
	byte	128
	byte	96
	byte	88
	byte	86
	byte	85
	byte	85
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+6
	byte	2
	byte	128
	byte	32
	byte	42
	byte	10
	byte	2
	byte	128
	byte	104
	byte	86
	byte	run,6,85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+3
	byte	85
	byte	149
	byte	37
	byte	9
	byte	170
	byte	85
	byte	149
	byte	165
	byte	169
	byte	106
	byte	86
	byte	run,7,85
	byte	149
	byte	37
	byte	10
	byte	86
	byte	run,4,85
	byte	165
	byte	90
	byte	85
	byte	86
	byte	170
	byte	170
	byte	90
	byte	run,8,85
	byte	170
	byte	101
	byte	165
	byte	105
	byte	86
	byte	run,3,85
	byte	run,3,170
	byte	169
	byte	149
	byte	run,5,85
	byte	86
	byte	86
	byte	168
	byte	run,0x80+1
	byte	run,7,149
	byte	101
	byte	165
	byte	102
	byte	90
	byte	86
	byte	89
	byte	101
	byte	101
	byte	149
	byte	150
	byte	40
	byte	run,0x80+3
	byte	105
	byte	run,5,101
	byte	149
	byte	149
	byte	165
	byte	154
	byte	85
	byte	85
	byte	149
	byte	101
	byte	137
	byte	130
	byte	run,0x80+5
	byte	run,5,86
	byte	106
	byte	run,4,170
	byte	105
	byte	run,5,85
	byte	170
	byte	run,0x80+4
	byte	150
	byte	152
	byte	96
	byte	162
	byte	170
	byte	170
	byte	169
	byte	165
	byte	149
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	2
	byte	9
	byte	169
	byte	165
	byte	149
	byte	run,6,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+6
	byte	run,8,96
	byte	run,3,128
	byte	run,0x80+10




palm2_data_f:
	byte	0x0a, 0x0e, 0xff, 0x1c, 0x00, 0x00
	byte	run,0x80+6
	byte	128
	byte	128
	byte	40
	byte	38
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+10
	byte	168
	byte	86
	byte	85
	byte	85
	byte	run,0x80+11
	byte	128
	byte	96
	byte	88
	byte	8
	byte	8
	byte	run,3,2
	byte	run,3,32
	byte	run,3,152
	byte	150
	byte	149
	byte	149
	byte	run,0x80+2
	byte	128
	byte	104
	byte	86
	byte	150
	byte	149
	byte	149
	byte	run,4,37
	byte	165
	byte	101
	byte	run,0x80+6
	byte	run,3,128
	byte	96
	byte	96
	byte	run,3,98
	byte	run,0x80+3
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,3,85
	byte	2
	byte	128
	byte	128
	byte	98
	byte	98
	byte	105
	byte	run,6,101
	byte	149
	byte	150
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,4,96
	byte	98
	byte	run,3,96
	byte	130
	byte	130
	byte	2
	byte	run,0x80+8
	byte	run,3,128
	byte	run,3,96




