;---------------------------------------
;
;	animation cel data
;

head3_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	head3_start_end - head3_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	head3_data_a - head3_data
	word	head3_data_b - head3_data

head3_start_end:
	byte	0,0,1,1,0,0,1,1


head3_data_a:
	byte	0x04, 0x16, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+5
	byte	run,13,2
	byte	run,0x80+4
	byte	run,3,47
	byte	175
	byte	170
	byte	149
	byte	86
	byte	90
	byte	run,4,91
	byte	90
	byte	run,4,85
	byte	run,4,149
	byte	42
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	255
	byte	255
	byte	run,3,235
	byte	171
	byte	run,4,91
	byte	90
	byte	run,3,85
	byte	170
	byte	run,0x80+1
	byte	128
	byte	224
	byte	160
	byte	run,4,224
	byte	232
	byte	184
	byte	248
	byte	248
	byte	run,4,224
	byte	232
	byte	168
	byte	88
	byte	88
	byte	104
	byte	160




head3_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,3,2
	byte	11
	byte	43
	byte	43
	byte	47
	byte	47
	byte	175
	byte	191
	byte	187
	byte	187
	byte	171
	byte	175
	byte	175
	byte	174
	byte	171
	byte	155
	byte	154
	byte	165
	byte	37
	byte	41
	byte	10
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	239
	byte	run,4,255
	byte	239
	byte	187
	byte	run,4,255
	byte	186
	byte	255
	byte	171
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	160
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	184
	byte	184
	byte	168
	byte	run,3,232
	byte	168
	byte	152
	byte	152
	byte	104
	byte	96
	byte	160
	byte	128




