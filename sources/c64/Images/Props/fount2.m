;---------------------------------------
;
;	animation cel data
;

fount2_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	fount2_start_end - fount2_data
	byte	no_cont

	byte	8+right,28+up,252

	byte	0b11111000
	byte	0b11100000
	byte	0b11000000
	byte	0b00011000

	word	fount2_data_a - fount2_data
	word	fount2_data_b - fount2_data
	word	fount2_data_c - fount2_data
	word	fount2_data_d - fount2_data
	word	fount2_data_e - fount2_data

fount2_start_end:
	byte	0,0,1,1,2,2,3,3


fount2_data_a:
	byte	0x0a, 0x14, 0xfc, 0x08, 0x00, 0x00
	byte	42
	byte	run,3,149
	byte	42
	byte	37
	byte	9
	byte	2
	byte	run,0x80+12
	byte	170
	byte	run,3,85
	byte	170
	byte	run,3,85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+9
	byte	170
	byte	run,3,85
	byte	170
	byte	run,6,85
	byte	165
	byte	10
	byte	run,0x80+7
	byte	170
	byte	run,3,85
	byte	170
	byte	run,8,85
	byte	165
	byte	run,4,9
	byte	10
	byte	10
	byte	170
	byte	run,3,85
	byte	170
	byte	run,13,85
	byte	run,3,170
	byte	run,3,85
	byte	170
	byte	run,8,85
	byte	86
	byte	run,4,88
	byte	168
	byte	168
	byte	170
	byte	run,3,85
	byte	170
	byte	run,6,85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+6
	byte	170
	byte	run,3,85
	byte	170
	byte	run,4,85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+8
	byte	170
	byte	run,3,85
	byte	170
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+12
	byte	run,3,128
	byte	run,0x80+16




fount2_data_b:
	byte	0x0e, 0x12, 0xfa, 0x1a, 0x00, 0x00
	byte	run,0x80+9
	byte	2
	byte	2
	byte	9
	byte	9
	byte	42
	byte	run,3,149
	byte	42
	byte	run,0x80+5
	byte	2
	byte	9
	byte	37
	byte	149
	byte	run,4,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+3
	byte	10
	byte	165
	byte	run,8,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+1
	byte	10
	byte	165
	byte	run,10,85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,12,85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,12,85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,12,85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,12,85
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,12,85
	byte	170
	byte	run,3,85
	byte	170
	byte	128
	byte	104
	byte	86
	byte	run,10,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+2
	byte	128
	byte	104
	byte	86
	byte	run,8,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	96
	byte	88
	byte	86
	byte	run,5,85
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+8
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+14
	byte	run,3,128
	byte	run,0x80+1




fount2_data_c:
	byte	0x04, 0x16, 0xff, 0x30, 0x00, 0x00
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+12
	byte	2
	byte	9
	byte	42
	byte	149
	byte	149
	byte	42
	byte	run,4,85
	byte	run,4,149
	byte	run,5,38
	byte	42
	byte	42
	byte	149
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	88
	byte	88
	byte	96
	byte	96
	byte	run,4,128
	byte	run,0x80+7
	byte	128
	byte	96
	byte	88
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+19
	byte	128
	byte	128
	byte	run,0x80+1




fount2_data_d:
	byte	0x05, 0x1d, 0xfe, 0x4d, 0x00, 0x00
	byte	run,0x80+6
	byte	10
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	169
	byte	85
	byte	90
	byte	165
	byte	41
	byte	37
	byte	149
	byte	38
	byte	37
	byte	10
	byte	run,0x80+12
	byte	130
	byte	137
	byte	101
	byte	89
	byte	150
	byte	101
	byte	89
	byte	89
	byte	85
	byte	85
	byte	106
	byte	106
	byte	run,3,88
	byte	96
	byte	128
	byte	run,0x80+5
	byte	run,4,38
	byte	150
	byte	150
	byte	153
	byte	89
	byte	165
	byte	85
	byte	85
	byte	86
	byte	150
	byte	104
	byte	106
	byte	101
	byte	149
	byte	86
	byte	149
	byte	165
	byte	38
	byte	165
	byte	150
	byte	37
	byte	41
	byte	10
	byte	2
	byte	run,0x80+6
	byte	160
	byte	90
	byte	86
	byte	85
	byte	105
	byte	130
	byte	128
	byte	run,0x80+3
	byte	128
	byte	96
	byte	88
	byte	152
	byte	96
	byte	88
	byte	150
	byte	102
	byte	88
	byte	150
	byte	102
	byte	88
	byte	150
	byte	166
	byte	40
	byte	run,0x80+3
	byte	32
	byte	152
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+18




fount2_data_e:
	byte	0x03, 0x19, 0xfb, 0x4d, 0x00, 0x00
	byte	run,0x80+11
	byte	2
	byte	2
	byte	run,0x80+15
	byte	2
	byte	8
	byte	run,6,32
	byte	168
	byte	102
	byte	165
	byte	38
	byte	152
	byte	run,3,32
	byte	8
	byte	2
	byte	run,0x80+4
	byte	128
	byte	32
	byte	32
	byte	128
	byte	run,0x80+7
	byte	170
	byte	85
	byte	86
	byte	168
	byte	run,0x80+6
	byte	128
	byte	32
	byte	32
	byte	128




