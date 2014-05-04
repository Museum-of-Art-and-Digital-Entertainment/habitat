;---------------------------------------
;
;	animation cel data
;

helmet0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	helmet0_start_end - helmet0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	helmet0_data_a - helmet0_data
	word	helmet0_data_b - helmet0_data
	word	helmet0_data_c - helmet0_data

helmet0_start_end:
	byte	0,0,1,1,0,0,2,2


helmet0_data_a:
	byte	0x04, 0x1c, 0x00, 0x06, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,0x80+1
	byte	2
	byte	9
	byte	9
	byte	run,12,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+6
	byte	170
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	106
	byte	191
	byte	191
	byte	170
	byte	run,5,165
	byte	186
	byte	187
	byte	187
	byte	106
	byte	run,3,89
	byte	169
	byte	10
	byte	8
	byte	8
	byte	46
	byte	8
	byte	170
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	255
	byte	234
	byte	234
	byte	run,5,186
	byte	234
	byte	234
	byte	255
	byte	170
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	128
	byte	160
	byte	96
	byte	128
	byte	96
	byte	88
	byte	170
	byte	254
	byte	168
	byte	run,6,152
	byte	168
	byte	170
	byte	254
	byte	170
	byte	88
	byte	96
	byte	128
	byte	run,0x80+6




helmet0_data_b:
	byte	0x05, 0x1c, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	2
	byte	11
	byte	11
	byte	run,9,43
	byte	run,3,34
	byte	run,5,32
	byte	184
	byte	32
	byte	42
	byte	170
	byte	149
	byte	42
	byte	149
	byte	85
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,5,234
	byte	170
	byte	170
	byte	255
	byte	170
	byte	85
	byte	85
	byte	149
	byte	41
	byte	2
	byte	run,0x80+4
	byte	170
	byte	170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	255
	byte	run,7,170
	byte	165
	byte	170
	byte	255
	byte	170
	byte	run,4,85
	byte	170
	byte	run,0x80+4
	byte	160
	byte	168
	byte	88
	byte	160
	byte	88
	byte	86
	byte	170
	byte	255
	byte	171
	byte	107
	byte	run,5,111
	byte	107
	byte	171
	byte	255
	byte	170
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+12
	byte	128
	byte	128
	byte	run,9,160
	byte	run,8,32
	byte	184
	byte	32




helmet0_data_c:
	byte	0x04, 0x0d, 0xfe, 0xfd, 0x00, 0x00
	byte	run,13,1
	byte	run,39,85




