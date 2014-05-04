;---------------------------------------
;
;	animation cel data
;

knight1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	knight1_start_end - knight1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	knight1_data_a - knight1_data
	word	knight1_data_b - knight1_data
	word	knight1_data_c - knight1_data

knight1_start_end:
	byte	0,0,1,1,0,0,2,2


knight1_data_a:
	byte	0x04, 0x22, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	2
	byte	run,0x80+2
	byte	run,3,2
	byte	run,11,9
	byte	2
	byte	2
	byte	run,0x80+5
	byte	8
	byte	32
	byte	34
	byte	10
	byte	run,0x80+1
	byte	2
	byte	run,0x80+2
	byte	37
	byte	170
	byte	85
	byte	149
	byte	150
	byte	run,4,86
	byte	89
	byte	89
	byte	101
	byte	105
	byte	109
	byte	101
	byte	106
	byte	85
	byte	85
	byte	86
	byte	85
	byte	85
	byte	149
	byte	42
	byte	9
	byte	9
	byte	42
	byte	42
	byte	170
	byte	170
	byte	138
	byte	10
	byte	42
	byte	168
	byte	40
	byte	152
	byte	88
	byte	106
	byte	149
	byte	102
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	106
	byte	154
	byte	154
	byte	run,6,85
	byte	86
	byte	168
	byte	128
	byte	128
	byte	162
	byte	160
	byte	168
	byte	170
	byte	170
	byte	10
	byte	run,0x80+5
	byte	168
	byte	86
	byte	102
	byte	86
	byte	102
	byte	86
	byte	102
	byte	86
	byte	102
	byte	86
	byte	170
	byte	152
	byte	152
	byte	88
	byte	run,3,96
	byte	128
	byte	128
	byte	run,0x80+5
	byte	run,3,128
	byte	run,0x80+4




knight1_data_b:
	byte	0x03, 0x23, 0xff, 0x0c, 0x00, 0x00
	byte	2
	byte	10
	byte	37
	byte	38
	byte	42
	byte	37
	byte	166
	byte	149
	byte	166
	byte	149
	byte	166
	byte	149
	byte	166
	byte	149
	byte	170
	byte	154
	byte	154
	byte	run,3,149
	byte	run,3,37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	8
	byte	8
	byte	10
	byte	2
	byte	128
	byte	40
	byte	42
	byte	10
	byte	2
	byte	170
	byte	86
	byte	85
	byte	170
	byte	170
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	102
	byte	85
	byte	170
	byte	154
	byte	154
	byte	run,7,85
	byte	170
	byte	152
	byte	152
	byte	168
	byte	run,4,170
	byte	162
	byte	160
	byte	128
	byte	run,0x80+1
	byte	128
	byte	96
	byte	96
	byte	160
	byte	96
	byte	104
	byte	88
	byte	104
	byte	88
	byte	104
	byte	88
	byte	104
	byte	88
	byte	168
	byte	152
	byte	152
	byte	run,3,88
	byte	run,3,96
	byte	128
	byte	run,0x80+3
	byte	32
	byte	8
	byte	8
	byte	160
	byte	168
	byte	160
	byte	run,0x80+2




knight1_data_c:
	byte	0x03, 0x0e, 0xff, 0xfa, 0x00, 0x00
	byte	run,4,5
	byte	run,10,21
	byte	run,14,85
	byte	run,4,64
	byte	run,10,80




