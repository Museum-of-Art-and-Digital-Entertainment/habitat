;---------------------------------------
;
;	animation cel data
;

bridges_data::
	byte	swing	+ 4
	byte	0b00000000
	byte	bridges_start_end - bridges_data
	byte	no_cont

	byte	244+right,84+left,1

	byte	0b11100000
	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b11000000

	word	bridges_data_a - bridges_data
	word	bridges_data_b - bridges_data
	word	bridges_data_c - bridges_data

bridges_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


bridges_data_a:
	byte	0x05, 0x1c, 0xf7, 0x22, 0x00, 0x00
	byte	170
	byte	run,3,149
	byte	run,14,150
	byte	149
	byte	149
	byte	41
	byte	2
	byte	run,0x80+6
	byte	160
	byte	88
	byte	86
	byte	85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+11
	byte	160
	byte	90
	byte	85
	byte	149
	byte	41
	byte	2
	byte	run,0x80+7
	byte	160
	byte	90
	byte	85
	byte	85
	byte	165
	byte	run,12,37
	byte	165
	byte	85
	byte	85
	byte	149
	byte	41
	byte	2
	byte	run,0x80+6
	byte	128
	byte	106
	byte	run,3,85
	byte	169
	byte	130
	byte	run,11,128
	byte	168
	byte	86
	byte	85
	byte	149
	byte	42
	byte	run,0x80+7
	byte	170
	byte	run,3,85
	byte	169
	byte	run,12,9
	byte	169
	byte	run,3,85
	byte	170




bridges_data_b:
	byte	0x0b, 0x16, 0xfc, 0x22, 0x00, 0x00
	byte	170
	byte	run,3,85
	byte	106
	byte	run,12,96
	byte	106
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,12,2
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	90
	byte	run,12,88
	byte	90
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+12
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	run,14,150
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+12
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	165
	byte	run,12,37
	byte	165
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,12,128
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	169
	byte	run,12,9
	byte	169
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	106
	byte	run,12,96
	byte	106
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	run,12,2
	byte	170
	byte	run,3,85
	byte	170




bridges_data_c:
	byte	0x05, 0x1c, 0x07, 0x22, 0x00, 0x00
	byte	run,0x80+6
	byte	170
	byte	run,3,85
	byte	106
	byte	run,12,96
	byte	106
	byte	run,3,85
	byte	170
	byte	run,0x80+4
	byte	2
	byte	169
	byte	run,3,85
	byte	106
	byte	130
	byte	run,11,2
	byte	42
	byte	149
	byte	85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	10
	byte	165
	byte	85
	byte	85
	byte	90
	byte	run,12,88
	byte	90
	byte	85
	byte	85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	85
	byte	86
	byte	88
	byte	160
	byte	run,0x80+11
	byte	10
	byte	165
	byte	85
	byte	86
	byte	104
	byte	128
	byte	run,0x80+4
	byte	170
	byte	run,3,86
	byte	run,14,150
	byte	86
	byte	86
	byte	104
	byte	128
	byte	run,0x80+6




