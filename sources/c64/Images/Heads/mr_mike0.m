;---------------------------------------
;
;	animation cel data
;

mr_mike0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	mr_mike0_start_end - mr_mike0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	mr_mike0_data_a - mr_mike0_data
	word	mr_mike0_data_b - mr_mike0_data
	word	mr_mike0_data_c - mr_mike0_data

mr_mike0_start_end:
	byte	0,0,1,1,0,0,2,2


mr_mike0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+9
	byte	2
	byte	2
	byte	run,9,10
	byte	2
	byte	run,0x80+7
	byte	47
	byte	42
	byte	run,5,47
	byte	171
	byte	170
	byte	170
	byte	run,4,169
	byte	run,4,170
	byte	169
	byte	170
	byte	170
	byte	42
	byte	10
	byte	run,3,2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,4,191
	byte	174
	byte	111
	byte	111
	byte	110
	byte	110
	byte	run,3,170
	byte	175
	byte	run,4,170
	byte	168
	byte	run,0x80+7
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	160
	byte	224
	byte	232
	byte	248
	byte	184
	byte	184
	byte	96
	byte	96
	byte	160
	byte	224
	byte	run,3,128
	byte	run,0x80+5




mr_mike0_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+10
	byte	10
	byte	run,4,38
	byte	10
	byte	10
	byte	run,3,2
	byte	9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	190
	byte	191
	byte	191
	byte	170
	byte	170
	byte	166
	byte	165
	byte	42
	byte	43
	byte	42
	byte	42
	byte	10
	byte	10
	byte	130
	byte	32
	byte	8
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	239
	byte	255
	byte	171
	byte	254
	byte	239
	byte	255
	byte	254
	byte	170
	byte	170
	byte	185
	byte	254
	byte	255
	byte	run,5,170
	byte	run,0x80+2
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,3,250
	byte	170
	byte	170
	byte	106
	byte	106
	byte	run,3,162
	byte	161
	byte	130
	byte	130
	byte	8
	byte	32
	byte	128
	byte	run,0x80+11
	byte	128
	byte	run,4,96
	byte	128
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,0x80+6




mr_mike0_data_c:
	byte	0x03, 0x11, 0xff, 0xfc, 0x00, 0x00
	byte	run,5,2
	byte	46
	byte	run,11,42
	byte	run,5,254
	byte	run,12,170
	byte	run,0x80+5
	byte	224
	byte	run,11,160




