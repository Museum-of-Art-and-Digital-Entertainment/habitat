;---------------------------------------
;
;	animation cel data
;

tonto1_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	tonto1_start_end - tonto1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tonto1_data_a - tonto1_data
	word	tonto1_data_b - tonto1_data
	word	tonto1_data_c - tonto1_data

tonto1_start_end:
	byte	0,0,1,1,0,0,2,2


tonto1_data_a:
	byte	0x04, 0x22, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+5
	byte	run,13,10
	byte	run,4,2
	byte	11
	byte	9
	byte	11
	byte	9
	byte	11
	byte	9
	byte	11
	byte	9
	byte	11
	byte	11
	byte	2
	byte	2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	run,14,170
	byte	85
	byte	85
	byte	run,3,170
	byte	138
	byte	run,7,128
	byte	run,0x80+2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	255
	byte	run,12,175
	byte	171
	byte	170
	byte	85
	byte	85
	byte	run,3,170
	byte	168
	byte	run,0x80+12
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,3,224
	byte	160
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+11




tonto1_data_b:
	byte	0x03, 0x23, 0xff, 0x0c, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	171
	byte	run,11,175
	byte	171
	byte	170
	byte	149
	byte	149
	byte	42
	byte	42
	byte	186
	byte	186
	byte	152
	byte	184
	byte	152
	byte	184
	byte	152
	byte	184
	byte	184
	byte	32
	byte	32
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	170
	byte	85
	byte	85
	byte	run,4,170
	byte	run,0x80+14
	byte	128
	byte	168
	byte	run,11,232
	byte	168
	byte	168
	byte	88
	byte	88
	byte	160
	byte	160
	byte	128
	byte	run,0x80+10




tonto1_data_c:
	byte	0x03, 0x0e, 0xff, 0xfc, 0x00, 0x00
	byte	run,14,10
	byte	run,14,170
	byte	run,14,128




