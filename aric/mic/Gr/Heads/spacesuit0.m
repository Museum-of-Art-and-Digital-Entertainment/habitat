;---------------------------------------
;
;	animation cel data
;

spacesuit0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	spacesuit0_start_end - spacesuit0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10100000
	byte	0b01100000

	word	spacesuit0_data_a - spacesuit0_data
	word	spacesuit0_data_b - spacesuit0_data
	word	spacesuit0_data_c - spacesuit0_data

spacesuit0_start_end:
	byte	0,0,1,1,0,0,1,1


spacesuit0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x02, 0x01
	byte	run,0x80+7
	byte	run,3,2
	byte	run,9,9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	42
	byte	42
	byte	47
	byte	47
	byte	175
	byte	155
	byte	90
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	run,6,85
	byte	149
	byte	37
	byte	10
	byte	40
	byte	168
	byte	248
	byte	248
	byte	234
	byte	239
	byte	run,3,191
	byte	254
	byte	run,3,255
	byte	239
	byte	175
	byte	110
	byte	111
	byte	111
	byte	91
	byte	86
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	232
	byte	run,3,248
	byte	160
	byte	160
	byte	run,3,224
	byte	128
	byte	160
	byte	96
	byte	128
	byte	run,0x80+1




spacesuit0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	run,5,2
	byte	11
	byte	11
	byte	31
	byte	95
	byte	94
	byte	run,4,127
	byte	95
	byte	94
	byte	95
	byte	95
	byte	87
	byte	run,3,21
	byte	5
	byte	1
	byte	run,3,170
	byte	254
	byte	170
	byte	run,3,255
	byte	171
	byte	255
	byte	239
	byte	run,3,255
	byte	187
	byte	186
	byte	run,3,255
	byte	run,5,85
	byte	run,0x80+5
	byte	128
	byte	128
	byte	208
	byte	212
	byte	212
	byte	run,4,244
	byte	run,3,212
	byte	84
	byte	84
	byte	run,3,80
	byte	64
	byte	run,0x80+1




spacesuit0_data_c:
	byte	0x05, 0x20, 0xfe, 0x0a, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	8
	byte	8
	byte	32
	byte	32
	byte	run,13,128
	byte	32
	byte	32
	byte	8
	byte	8
	byte	2
	byte	run,0x80+8
	byte	170
	byte	run,0x80+23
	byte	170
	byte	10
	byte	run,0x80+6
	byte	170
	byte	run,0x80+23
	byte	170
	byte	170
	byte	168
	byte	run,3,32
	byte	168
	byte	32
	byte	168
	byte	2
	byte	run,0x80+21
	byte	2
	byte	168
	byte	128
	byte	run,0x80+8
	byte	128
	byte	128
	byte	32
	byte	32
	byte	run,13,8
	byte	32
	byte	32
	byte	128
	byte	128
	byte	run,0x80+9




