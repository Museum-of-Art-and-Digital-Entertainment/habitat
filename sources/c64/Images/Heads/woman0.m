;---------------------------------------
;
;	animation cel data
;

woman0_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	woman0_start_end - woman0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	woman0_data_a - woman0_data
	word	woman0_data_b - woman0_data

woman0_start_end:
	byte	0,0,1,1,0,0,1,1


woman0_data_a:
	byte	0x05, 0x1b, 0xff, 0x04, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	2
	byte	9
	byte	37
	byte	37
	byte	41
	byte	34
	byte	run,0x80+17
	byte	10
	byte	37
	byte	149
	byte	run,7,85
	byte	149
	byte	149
	byte	run,9,37
	byte	run,3,9
	byte	2
	byte	run,0x80+2
	byte	128
	byte	160
	byte	91
	byte	86
	byte	run,5,85
	byte	86
	byte	run,3,91
	byte	86
	byte	86
	byte	run,10,85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	186
	byte	run,3,111
	byte	175
	byte	239
	byte	run,5,255
	byte	191
	byte	191
	byte	111
	byte	111
	byte	91
	byte	86
	byte	run,3,85
	byte	90
	byte	152
	byte	32
	byte	run,0x80+4
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	run,5,224
	byte	232
	byte	230
	byte	150
	byte	86
	byte	88
	byte	88
	byte	160
	byte	128




woman0_data_b:
	byte	0x06, 0x1b, 0xfd, 0x04, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	run,4,9
	byte	10
	byte	8
	byte	8
	byte	run,0x80+17
	byte	42
	byte	149
	byte	run,4,85
	byte	149
	byte	37
	byte	run,12,9
	byte	run,3,2
	byte	run,0x80+4
	byte	131
	byte	106
	byte	90
	byte	85
	byte	86
	byte	91
	byte	107
	byte	run,10,111
	byte	107
	byte	90
	byte	run,4,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	255
	byte	254
	byte	254
	byte	170
	byte	254
	byte	run,14,255
	byte	190
	byte	105
	byte	run,3,85
	byte	149
	byte	165
	byte	10
	byte	run,0x80+1
	byte	10
	byte	165
	byte	85
	byte	85
	byte	149
	byte	149
	byte	run,10,229
	byte	165
	byte	149
	byte	85
	byte	run,4,86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1
	byte	160
	byte	88
	byte	run,4,86
	byte	102
	byte	138
	byte	130
	byte	130
	byte	run,10,128
	byte	run,0x80+6




