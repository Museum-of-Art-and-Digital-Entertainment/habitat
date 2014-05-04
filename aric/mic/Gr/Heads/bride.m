;---------------------------------------
;
;	animation cel data
;

bride_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bride_start_end - bride_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bride_data_a - bride_data
	word	bride_data_b - bride_data
	word	bride_data_c - bride_data

bride_start_end:
	byte	0,0,1,1,0,0,2,2


bride_data_a:
	byte	0x04, 0x1d, 0x00, 0x02, 0x00, 0x00
	byte	16
	byte	20
	byte	run,13,21
	byte	run,8,5
	byte	run,3,1
	byte	run,0x80+5
	byte	64
	byte	64
	byte	run,18,90
	byte	86
	byte	86
	byte	run,4,85
	byte	5
	byte	run,0x80+5
	byte	248
	byte	184
	byte	184
	byte	248
	byte	186
	byte	187
	byte	175
	byte	190
	byte	run,6,191
	byte	190
	byte	175
	byte	174
	byte	run,3,170
	byte	run,4,85
	byte	run,0x80+9
	byte	128
	byte	192
	byte	128
	byte	192
	byte	128
	byte	192
	byte	224
	byte	240
	byte	240
	byte	128
	byte	128
	byte	192
	byte	128
	byte	224
	byte	160
	byte	160
	byte	64
	byte	64
	byte	run,0x80+2




bride_data_b:
	byte	0x04, 0x1d, 0xfe, 0x02, 0x00, 0x00
	byte	run,15,1
	byte	run,0x80+16
	byte	64
	byte	64
	byte	74
	byte	90
	byte	106
	byte	106
	byte	170
	byte	107
	byte	171
	byte	175
	byte	run,5,111
	byte	110
	byte	106
	byte	111
	byte	106
	byte	111
	byte	107
	byte	90
	byte	26
	byte	21
	byte	21
	byte	5
	byte	1
	byte	run,0x80+4
	byte	254
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	187
	byte	239
	byte	255
	byte	239
	byte	255
	byte	255
	byte	186
	byte	254
	byte	255
	byte	254
	byte	255
	byte	186
	byte	170
	byte	170
	byte	run,4,85
	byte	run,3,1
	byte	5
	byte	165
	byte	149
	byte	165
	byte	165
	byte	169
	byte	165
	byte	169
	byte	233
	byte	run,3,229
	byte	run,3,228
	byte	164
	byte	228
	byte	164
	byte	228
	byte	164
	byte	148
	byte	144
	byte	80
	byte	80
	byte	64
	byte	run,0x80+1




bride_data_c:
	byte	0x03, 0x15, 0xff, 0xfe, 0x00, 0x00
	byte	21
	byte	run,18,85
	byte	5
	byte	5
	byte	run,21,85
	byte	run,20,84
	byte	64




