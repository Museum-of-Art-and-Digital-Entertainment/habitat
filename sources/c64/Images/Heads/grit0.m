;---------------------------------------
;
;	animation cel data
;

grit0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	grit0_start_end - grit0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	grit0_data_a - grit0_data
	word	grit0_data_b - grit0_data
	word	grit0_data_c - grit0_data

grit0_start_end:
	byte	0,0,1,1,0,0,2,2


grit0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	2
	byte	10
	byte	10
	byte	run,7,42
	byte	run,3,10
	byte	2
	byte	2
	byte	run,0x80+5
	byte	37
	byte	42
	byte	37
	byte	37
	byte	165
	byte	run,4,170
	byte	run,4,169
	byte	run,10,170
	byte	run,3,42
	byte	40
	byte	152
	byte	88
	byte	90
	byte	85
	byte	90
	byte	run,3,111
	byte	90
	byte	run,3,85
	byte	101
	byte	166
	byte	165
	byte	149
	byte	154
	byte	165
	byte	run,8,170
	byte	run,0x80+3
	byte	160
	byte	88
	byte	88
	byte	160
	byte	224
	byte	224
	byte	160
	byte	104
	byte	86
	byte	86
	byte	88
	byte	152
	byte	96
	byte	160
	byte	96
	byte	96
	byte	run,8,128




grit0_data_b:
	byte	0x04, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+10
	byte	run,7,2
	byte	run,0x80+10
	byte	1
	byte	run,3,2
	byte	9
	byte	38
	byte	run,3,155
	byte	150
	byte	run,4,85
	byte	166
	byte	165
	byte	165
	byte	166
	byte	169
	byte	run,8,170
	byte	85
	byte	86
	byte	170
	byte	170
	byte	85
	byte	150
	byte	235
	byte	255
	byte	171
	byte	86
	byte	101
	byte	run,3,85
	byte	154
	byte	85
	byte	153
	byte	86
	byte	85
	byte	run,8,170
	byte	run,0x80+4
	byte	128
	byte	96
	byte	run,3,152
	byte	90
	byte	run,4,86
	byte	run,3,106
	byte	run,10,168




grit0_data_c:
	byte	0x03, 0x0d, 0xff, 0xfc, 0x00, 0x00
	byte	run,26,170
	byte	run,13,168




