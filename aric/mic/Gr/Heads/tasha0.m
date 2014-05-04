;---------------------------------------
;
;	animation cel data
;

tasha0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	tasha0_start_end - tasha0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tasha0_data_a - tasha0_data
	word	tasha0_data_b - tasha0_data
	word	tasha0_data_c - tasha0_data

tasha0_start_end:
	byte	0,0,1,1,0,0,2,2


tasha0_data_a:
	byte	0x05, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+6
	byte	1
	byte	1
	byte	run,0x80+19
	byte	5
	byte	21
	byte	85
	byte	85
	byte	21
	byte	21
	byte	run,11,5
	byte	1
	byte	1
	byte	run,0x80+3
	byte	47
	byte	42
	byte	107
	byte	run,19,85
	byte	21
	byte	40
	byte	184
	byte	248
	byte	248
	byte	94
	byte	87
	byte	95
	byte	126
	byte	127
	byte	127
	byte	run,3,255
	byte	253
	byte	126
	byte	87
	byte	94
	byte	87
	byte	run,6,85
	byte	run,0x80+4
	byte	128
	byte	192
	byte	128
	byte	192
	byte	128
	byte	192
	byte	224
	byte	248
	byte	240
	byte	176
	byte	176
	byte	192
	byte	128
	byte	224
	byte	64
	byte	run,3,80
	byte	64
	byte	run,0x80+1




tasha0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+3
	byte	1
	byte	5
	byte	21
	byte	85
	byte	69
	byte	run,12,1
	byte	run,0x80+4
	byte	3
	byte	2
	byte	2
	byte	86
	byte	86
	byte	87
	byte	87
	byte	run,3,95
	byte	run,3,127
	byte	118
	byte	122
	byte	95
	byte	90
	byte	95
	byte	95
	byte	run,3,85
	byte	21
	byte	5
	byte	255
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
	byte	186
	byte	187
	byte	254
	byte	255
	byte	255
	byte	253
	byte	run,4,85
	byte	run,0x80+3
	byte	run,4,85
	byte	run,3,213
	byte	run,3,245
	byte	117
	byte	181
	byte	213
	byte	149
	byte	213
	byte	85
	byte	84
	byte	80
	byte	80
	byte	64
	byte	run,0x80+5
	byte	64
	byte	80
	byte	84
	byte	68
	byte	run,0x80+16




tasha0_data_c:
	byte	0x03, 0x11, 0xff, 0xfd, 0x00, 0x00
	byte	run,34,85
	byte	run,17,80




