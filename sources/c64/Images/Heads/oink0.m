;---------------------------------------
;
;	animation cel data
;

oink0_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	oink0_start_end - oink0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01000000

	word	oink0_data_a - oink0_data
	word	oink0_data_b - oink0_data

oink0_start_end:
	byte	0,0,1,1,0,0,2,2


oink0_data_a:
	byte	0x05, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	9
	byte	9
	byte	run,6,37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	37
	byte	37
	byte	165
	byte	149
	byte	run,9,85
	byte	86
	byte	89
	byte	101
	byte	101
	byte	89
	byte	153
	byte	41
	byte	10
	byte	2
	byte	40
	byte	152
	byte	88
	byte	88
	byte	86
	byte	run,3,85
	byte	86
	byte	run,9,85
	byte	101
	byte	101
	byte	149
	byte	149
	byte	150
	byte	168
	byte	run,0x80+6
	byte	128
	byte	96
	byte	160
	byte	88
	byte	88
	byte	86
	byte	run,3,85
	byte	102
	byte	104
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+13
	byte	run,5,128
	byte	run,0x80+10




oink0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+11
	byte	run,6,2
	byte	run,0x80+1
	byte	run,3,2
	byte	9
	byte	9
	byte	2
	byte	3
	byte	run,4,2
	byte	9
	byte	37
	byte	run,3,149
	byte	150
	byte	91
	byte	91
	byte	86
	byte	run,3,85
	byte	149
	byte	85
	byte	85
	byte	101
	byte	105
	byte	138
	byte	2
	byte	255
	byte	254
	byte	254
	byte	170
	byte	170
	byte	85
	byte	85
	byte	165
	byte	85
	byte	169
	byte	254
	byte	187
	byte	187
	byte	254
	byte	169
	byte	153
	byte	run,6,85
	byte	86
	byte	170
	byte	run,0x80+5
	byte	128
	byte	96
	byte	run,3,88
	byte	90
	byte	150
	byte	150
	byte	run,4,86
	byte	90
	byte	88
	byte	86
	byte	102
	byte	166
	byte	166
	byte	10




