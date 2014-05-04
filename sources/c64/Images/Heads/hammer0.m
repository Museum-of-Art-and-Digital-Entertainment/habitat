;---------------------------------------
;
;	animation cel data
;

hammer0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	hammer0_start_end - hammer0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	hammer0_data_a - hammer0_data
	word	hammer0_data_b - hammer0_data
	word	hammer0_data_c - hammer0_data

hammer0_start_end:
	byte	0,0,1,1,0,0,2,2


hammer0_data_a:
	byte	0x07, 0x14, 0xfe, 0xfe, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+17
	byte	128
	byte	96
	byte	90
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+12
	byte	run,4,2
	byte	162
	byte	90
	byte	86
	byte	85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	32
	byte	42
	byte	run,4,47
	byte	170
	byte	run,11,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	248
	byte	run,3,224
	byte	170
	byte	run,11,85
	byte	170
	byte	run,0x80+7
	byte	2
	byte	137
	byte	169
	byte	run,7,85
	byte	169
	byte	137
	byte	2
	byte	run,0x80+7
	byte	160
	byte	run,11,88
	byte	160




hammer0_data_b:
	byte	0x04, 0x14, 0xfe, 0xfd, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,0x80+10
	byte	3
	byte	run,7,2
	byte	138
	byte	165
	byte	165
	byte	run,5,149
	byte	37
	byte	37
	byte	10
	byte	run,0x80+1
	byte	255
	byte	run,4,254
	byte	run,3,170
	byte	86
	byte	run,9,85
	byte	86
	byte	168
	byte	run,0x80+8
	byte	138
	byte	106
	byte	104
	byte	run,5,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+1




hammer0_data_c:
	byte	0x03, 0x09, 0xff, 0xfa, 0x00, 0x00
	byte	170
	byte	85
	byte	run,6,149
	byte	37
	byte	2
	byte	run,7,153
	byte	101
	byte	170
	byte	86
	byte	run,6,88
	byte	96




