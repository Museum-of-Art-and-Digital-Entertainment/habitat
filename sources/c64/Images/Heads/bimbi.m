;---------------------------------------
;
;	animation cel data
;

bimbi_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bimbi_start_end - bimbi_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bimbi_data_a - bimbi_data
	word	bimbi_data_b - bimbi_data
	word	bimbi_data_c - bimbi_data

bimbi_start_end:
	byte	0,0,1,1,0,0,2,2


bimbi_data_a:
	byte	0x04, 0x19, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+1
	byte	1
	byte	5
	byte	1
	byte	run,17,5
	byte	1
	byte	1
	byte	run,0x80+2
	byte	17
	byte	run,23,85
	byte	21
	byte	run,0x80+1
	byte	104
	byte	run,3,120
	byte	126
	byte	123
	byte	111
	byte	126
	byte	run,6,127
	byte	126
	byte	95
	byte	94
	byte	91
	byte	run,6,85
	byte	run,0x80+5
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
	byte	128
	byte	80
	byte	64
	byte	64
	byte	run,0x80+2




bimbi_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+4
	byte	1
	byte	1
	byte	run,0x80+1
	byte	run,5,1
	byte	run,0x80+13
	byte	7
	byte	run,4,86
	byte	91
	byte	87
	byte	run,6,95
	byte	94
	byte	90
	byte	95
	byte	90
	byte	95
	byte	95
	byte	run,3,85
	byte	21
	byte	5
	byte	1
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
	byte	255
	byte	run,6,85
	byte	80
	byte	84
	byte	85
	byte	84
	byte	85
	byte	149
	byte	84
	byte	run,3,213
	byte	run,4,212
	byte	148
	byte	212
	byte	148
	byte	run,4,84
	byte	80
	byte	80
	byte	64
	byte	run,0x80+1




bimbi_data_c:
	byte	0x03, 0x13, 0xff, 0xfc, 0x00, 0x00
	byte	run,19,5
	byte	run,19,85
	byte	run,19,64




