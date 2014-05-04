;---------------------------------------
;
;	animation cel data
;

bean0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bean0_start_end - bean0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bean0_data_a - bean0_data
	word	bean0_data_b - bean0_data
	word	bean0_data_c - bean0_data

bean0_start_end:
	byte	0,0,1,1,0,0,2,2


bean0_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+6
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	run,3,86
	byte	106
	byte	run,3,111
	byte	90
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	32
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	254
	byte	251
	byte	run,4,255
	byte	254
	byte	238
	byte	174
	byte	111
	byte	110
	byte	111
	byte	111
	byte	106
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	run,7,128
	byte	160
	byte	run,4,224
	byte	run,7,128
	byte	run,0x80+3




bean0_data_b:
	byte	0x03, 0x1a, 0xff, 0x03, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	run,4,11
	byte	43
	byte	run,3,191
	byte	187
	byte	43
	byte	run,4,11
	byte	10
	byte	9
	byte	9
	byte	10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	187
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	run,3,187
	byte	255
	byte	187
	byte	255
	byte	170
	byte	run,3,85
	byte	170
	byte	128
	byte	32
	byte	run,0x80+5
	byte	run,4,128
	byte	160
	byte	run,3,248
	byte	184
	byte	160
	byte	run,8,128
	byte	run,0x80+3




bean0_data_c:
	byte	0x02, 0x10, 0xff, 0xfd, 0x00, 0x00
	byte	run,0x80+1
	byte	run,15,1
	byte	84
	byte	run,15,85




