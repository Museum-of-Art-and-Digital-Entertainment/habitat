;---------------------------------------
;
;	animation cel data
;

tknot2_data::
	byte	swing	+ 1
	byte	0b01000000
	byte	tknot2_start_end - tknot2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	tknot2_data_a - tknot2_data
	word	tknot2_data_b - tknot2_data

tknot2_start_end:
	byte	0,0,1,1,0,0,1,1


tknot2_data_a:
	byte	0x04, 0x23, 0x00, 0x0d, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+6
	byte	2
	byte	run,0x80+3
	byte	8
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	191
	byte	255
	byte	255
	byte	254
	byte	run,4,251
	byte	250
	byte	run,5,255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	2
	byte	2
	byte	9
	byte	165
	byte	149
	byte	37
	byte	149
	byte	89
	byte	162
	byte	2
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	run,7,255
	byte	254
	byte	168
	byte	160
	byte	160
	byte	88
	byte	86
	byte	85
	byte	86
	byte	85
	byte	89
	byte	98
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+4
	byte	32
	byte	128
	byte	128
	byte	run,0x80+1
	byte	136
	byte	96
	byte	128
	byte	run,0x80+2




tknot2_data_b:
	byte	0x04, 0x24, 0xfe, 0x0d, 0x00, 0x00
	byte	run,0x80+31
	byte	2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	run,3,47
	byte	run,4,191
	byte	175
	byte	run,5,47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+3
	byte	2
	byte	130
	byte	41
	byte	37
	byte	9
	byte	37
	byte	150
	byte	40
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,17,255
	byte	254
	byte	run,3,168
	byte	86
	byte	86
	byte	run,4,85
	byte	86
	byte	152
	byte	152
	byte	32
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,3,224
	byte	run,4,248
	byte	232
	byte	run,5,224
	byte	128
	byte	128
	byte	run,0x80+5
	byte	8
	byte	160
	byte	96
	byte	128
	byte	98
	byte	88
	byte	160
	byte	run,0x80+2




