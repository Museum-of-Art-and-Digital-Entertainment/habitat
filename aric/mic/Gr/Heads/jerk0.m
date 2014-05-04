;---------------------------------------
;
;	animation cel data
;

jerk0_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	jerk0_start_end - jerk0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	jerk0_data_a - jerk0_data
	word	jerk0_data_b - jerk0_data
	word	jerk0_data_c - jerk0_data

jerk0_start_end:
	byte	0,0,1,1,0,0,2,2


jerk0_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	run,4,2
	byte	10
	byte	run,7,9
	byte	10
	byte	2
	byte	run,0x80+6
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	170
	byte	85
	byte	86
	byte	90
	byte	run,4,91
	byte	90
	byte	90
	byte	run,4,85
	byte	149
	byte	165
	byte	41
	byte	10
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	190
	byte	254
	byte	251
	byte	255
	byte	255
	byte	190
	byte	187
	byte	187
	byte	190
	byte	159
	byte	107
	byte	86
	byte	run,3,85
	byte	169
	byte	2
	byte	10
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	160
	byte	96
	byte	128
	byte	224
	byte	232
	byte	248
	byte	248
	byte	160
	byte	run,3,224
	byte	160
	byte	224
	byte	160
	byte	128
	byte	128
	byte	160
	byte	96
	byte	128
	byte	run,0x80+1




jerk0_data_b:
	byte	0x06, 0x1a, 0xfd, 0x03, 0x00, 0x00
	byte	run,0x80+17
	byte	10
	byte	37
	byte	9
	byte	37
	byte	10
	byte	run,0x80+13
	byte	run,9,2
	byte	160
	byte	106
	byte	160
	byte	run,0x80+5
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	174
	byte	191
	byte	255
	byte	255
	byte	254
	byte	187
	byte	187
	byte	190
	byte	175
	byte	155
	byte	154
	byte	165
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	155
	byte	171
	byte	254
	byte	239
	byte	255
	byte	255
	byte	186
	byte	255
	byte	255
	byte	254
	byte	255
	byte	255
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+7
	byte	128
	byte	128
	byte	224
	byte	224
	byte	234
	byte	250
	byte	run,3,254
	byte	186
	byte	186
	byte	250
	byte	234
	byte	168
	byte	154
	byte	104
	byte	96
	byte	104
	byte	168
	byte	32
	byte	128
	byte	run,0x80+17
	byte	32
	byte	40
	byte	170
	byte	40
	byte	32
	byte	run,0x80+4




jerk0_data_c:
	byte	0x03, 0x06, 0xff, 0xfa, 0x00, 0x00
	byte	run,12,85
	byte	run,6,84




