;---------------------------------------
;
;	animation cel data
;

deer_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	deer_start_end - deer_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	deer_data_a - deer_data
	word	deer_data_b - deer_data
	word	deer_data_c - deer_data

deer_start_end:
	byte	0,0,1,1,0,0,2,2


deer_data_a:
	byte	0x06, 0x1e, 0x00, 0x08, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	run,6,9
	byte	2
	byte	42
	byte	170
	byte	149
	byte	37
	byte	10
	byte	run,0x80+1
	byte	run,5,2
	byte	run,0x80+3
	byte	run,5,37
	byte	165
	byte	150
	byte	run,3,89
	byte	run,5,85
	byte	149
	byte	149
	byte	90
	byte	106
	byte	168
	byte	168
	byte	run,3,160
	byte	168
	byte	138
	byte	130
	byte	128
	byte	160
	byte	40
	byte	run,4,88
	byte	86
	byte	170
	byte	run,6,85
	byte	90
	byte	110
	byte	111
	byte	90
	byte	90
	byte	85
	byte	170
	byte	run,0x80+7
	byte	128
	byte	run,0x80+8
	byte	128
	byte	106
	byte	86
	byte	86
	byte	90
	byte	86
	byte	85
	byte	149
	byte	149
	byte	229
	byte	170
	byte	128
	byte	128
	byte	run,0x80+17
	byte	170
	byte	86
	byte	170
	byte	254
	byte	170
	byte	85
	byte	85
	byte	86
	byte	90
	byte	170
	byte	170
	byte	run,0x80+21
	byte	128
	byte	run,0x80+1
	byte	run,5,128
	byte	64
	byte	128
	byte	run,0x80+14




deer_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	9
	byte	9
	byte	run,3,10
	byte	2
	byte	2
	byte	42
	byte	149
	byte	37
	byte	10
	byte	run,0x80+9
	byte	1
	byte	run,4,2
	byte	42
	byte	150
	byte	154
	byte	90
	byte	86
	byte	89
	byte	89
	byte	169
	byte	233
	byte	250
	byte	169
	byte	149
	byte	165
	byte	106
	byte	138
	byte	10
	byte	40
	byte	40
	byte	160
	byte	160
	byte	136
	byte	130
	byte	160
	byte	32
	byte	10
	byte	85
	byte	86
	byte	154
	byte	170
	byte	170
	byte	154
	byte	86
	byte	170
	byte	254
	byte	170
	byte	85
	byte	101
	byte	101
	byte	185
	byte	170
	byte	169
	byte	85
	byte	101
	byte	170
	byte	138
	byte	2
	byte	run,0x80+5
	byte	2
	byte	run,0x80+2
	byte	2
	byte	run,0x80+5
	byte	160
	byte	88
	byte	152
	byte	150
	byte	86
	byte	149
	byte	149
	byte	170
	byte	174
	byte	190
	byte	170
	byte	90
	byte	106
	byte	165
	byte	137
	byte	130
	byte	160
	byte	160
	byte	40
	byte	40
	byte	136
	byte	8
	byte	40
	byte	32
	byte	128
	byte	run,0x80+10
	byte	run,5,128
	byte	run,0x80+2
	byte	160
	byte	88
	byte	96
	byte	128
	byte	run,0x80+9




deer_data_c:
	byte	0x03, 0x0a, 0xff, 0xf9, 0x00, 0x00
	byte	21
	byte	21
	byte	run,18,85
	byte	80
	byte	80
	byte	run,8,84




