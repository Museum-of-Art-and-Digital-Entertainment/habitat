;---------------------------------------
;
;	animation cel data
;

afro0_data::
	byte	swing	+ 2
	byte	0b11000000
	byte	afro0_start_end - afro0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	afro0_data_a - afro0_data
	word	afro0_data_b - afro0_data
	word	afro0_data_c - afro0_data

afro0_start_end:
	byte	0,0,1,1,0,0,2,2


afro0_data_a:
	byte	0x04, 0x1e, 0x00, 0x08, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	10
	byte	9
	byte	9
	byte	41
	byte	165
	byte	run,14,149
	byte	165
	byte	41
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	47
	byte	42
	byte	47
	byte	175
	byte	175
	byte	106
	byte	106
	byte	85
	byte	86
	byte	91
	byte	91
	byte	90
	byte	86
	byte	run,15,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,3,255
	byte	239
	byte	175
	byte	111
	byte	107
	byte	run,3,91
	byte	90
	byte	run,8,85
	byte	86
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	run,4,248
	byte	run,3,254
	byte	248
	byte	run,4,224
	byte	168
	byte	90
	byte	run,4,86
	byte	90
	byte	104
	byte	160
	byte	128
	byte	run,0x80+1




afro0_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,3,9
	byte	41
	byte	run,9,37
	byte	41
	byte	9
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	3
	byte	run,4,2
	byte	43
	byte	155
	byte	175
	byte	111
	byte	111
	byte	run,3,191
	byte	175
	byte	run,4,111
	byte	107
	byte	90
	byte	run,7,85
	byte	149
	byte	165
	byte	42
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	170
	byte	run,9,85
	byte	170
	byte	run,0x80+5
	byte	160
	byte	168
	byte	230
	byte	230
	byte	234
	byte	run,3,249
	byte	233
	byte	run,3,229
	byte	165
	byte	149
	byte	149
	byte	run,6,85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+10
	byte	128
	byte	128
	byte	run,12,96
	byte	128
	byte	128
	byte	run,0x80+4




afro0_data_c:
	byte	0x03, 0x07, 0xff, 0xf7, 0x00, 0x00
	byte	run,7,80
	byte	run,0x80+7
	byte	run,7,20




