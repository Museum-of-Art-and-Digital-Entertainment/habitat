;---------------------------------------
;
;	animation cel data
;

fly0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	fly0_start_end - fly0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	fly0_data_a - fly0_data
	word	fly0_data_b - fly0_data
	word	fly0_data_c - fly0_data

fly0_start_end:
	byte	0,0,1,1,0,0,2,2


fly0_data_a:
	byte	0x07, 0x1c, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	2
	byte	10
	byte	42
	byte	42
	byte	run,8,170
	byte	42
	byte	10
	byte	run,0x80+9
	byte	47
	byte	run,3,42
	byte	run,16,170
	byte	run,0x80+7
	byte	40
	byte	168
	byte	168
	byte	run,6,170
	byte	149
	byte	run,4,85
	byte	149
	byte	149
	byte	165
	byte	run,3,170
	byte	168
	byte	42
	byte	10
	byte	2
	byte	run,0x80+3
	byte	8
	byte	34
	byte	34
	byte	2
	byte	138
	byte	170
	byte	168
	byte	168
	byte	run,3,160
	byte	104
	byte	104
	byte	run,4,88
	byte	104
	byte	run,3,160
	byte	168
	byte	42
	byte	138
	byte	162
	byte	160
	byte	42
	byte	run,0x80+24
	byte	128
	byte	162
	byte	8
	byte	128
	byte	42
	byte	run,0x80+20
	byte	2
	byte	8
	byte	32
	byte	130
	byte	8
	byte	32
	byte	128
	byte	run,0x80+16
	byte	run,4,32
	byte	128
	byte	8
	byte	34
	byte	128
	byte	run,0x80+5




fly0_data_b:
	byte	0x09, 0x1b, 0xfc, 0x04, 0x00, 0x00
	byte	run,0x80+25
	byte	2
	byte	8
	byte	run,0x80+10
	byte	2
	byte	run,6,9
	byte	2
	byte	run,0x80+6
	byte	128
	byte	32
	byte	10
	byte	run,0x80+7
	byte	2
	byte	42
	byte	170
	byte	86
	byte	run,5,85
	byte	86
	byte	86
	byte	170
	byte	42
	byte	2
	byte	run,0x80+3
	byte	2
	byte	2
	byte	168
	byte	run,4,2
	byte	10
	byte	42
	byte	run,15,170
	byte	42
	byte	40
	byte	160
	byte	128
	byte	run,0x80+2
	byte	170
	byte	run,8,186
	byte	run,13,170
	byte	run,0x80+9
	byte	128
	byte	160
	byte	168
	byte	run,4,170
	byte	run,5,169
	byte	run,5,170
	byte	160
	byte	160
	byte	40
	byte	10
	byte	2
	byte	run,0x80+9
	byte	160
	byte	168
	byte	86
	byte	run,6,85
	byte	86
	byte	168
	byte	160
	byte	run,0x80+6
	byte	170
	byte	run,0x80+11
	byte	run,6,128
	byte	run,0x80+7
	byte	8
	byte	34
	byte	128
	byte	run,0x80+26
	byte	160




fly0_data_c:
	byte	0x06, 0x11, 0xfd, 0xfb, 0x00, 0x00
	byte	run,0x80+9
	byte	run,8,2
	byte	run,0x80+9
	byte	run,8,170
	byte	run,0x80+17
	byte	run,8,32
	byte	run,0x80+18
	byte	run,8,2
	byte	run,0x80+9
	byte	run,8,170




