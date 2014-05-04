;---------------------------------------
;
;	animation cel data
;

tex0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	tex0_start_end - tex0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01001000
	byte	0b01101000

	word	tex0_data_a - tex0_data
	word	tex0_data_b - tex0_data
	word	tex0_data_c - tex0_data
	word	tex0_data_d - tex0_data
	word	tex0_data_e - tex0_data

tex0_start_end:
	byte	0,0,1,1,0,0,2,2


tex0_data_a:
	byte	0x04, 0x11, 0x00, 0xfb, 0x00, 0x00
	byte	run,0x80+7
	byte	run,10,2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,3,170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	run,3,175
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	224
	byte	224




tex0_data_b:
	byte	0x03, 0x12, 0xff, 0xfb, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,4,175
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,13,255
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,4,232




tex0_data_c:
	byte	0x03, 0x0e, 0xff, 0xfb, 0x00, 0x00
	byte	run,3,2
	byte	run,11,42
	byte	run,14,170
	byte	run,0x80+3
	byte	run,11,160




tex0_data_d:
	byte	0x06, 0x0b, 0xff, 0x06, 0x00, 0x00
	byte	run,0x80+1
	byte	run,3,2
	byte	run,0x80+7
	byte	170
	byte	run,3,85
	byte	149
	byte	42
	byte	run,0x80+5
	byte	170
	byte	run,3,85
	byte	86
	byte	169
	byte	run,3,149
	byte	37
	byte	10
	byte	170
	byte	85
	byte	86
	byte	170
	byte	170
	byte	run,5,85
	byte	170
	byte	170
	byte	85
	byte	170
	byte	160
	byte	160
	byte	run,4,96
	byte	128
	byte	run,0x80+1
	byte	160
	byte	96
	byte	128
	byte	run,0x80+8




tex0_data_e:
	byte	0x05, 0x0b, 0xfe, 0x06, 0x00, 0x00
	byte	2
	byte	9
	byte	run,3,37
	byte	10
	byte	run,0x80+5
	byte	170
	byte	85
	byte	106
	byte	170
	byte	170
	byte	run,4,37
	byte	9
	byte	2
	byte	170
	byte	85
	byte	run,3,170
	byte	run,3,85
	byte	101
	byte	165
	byte	138
	byte	170
	byte	85
	byte	165
	byte	169
	byte	169
	byte	98
	byte	run,3,96
	byte	128
	byte	run,0x80+2
	byte	128
	byte	run,3,96
	byte	128
	byte	run,0x80+5




