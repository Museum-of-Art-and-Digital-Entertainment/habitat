;---------------------------------------
;
;	animation cel data
;

bizzaro0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	bizzaro0_start_end - bizzaro0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bizzaro0_data_a - bizzaro0_data
	word	bizzaro0_data_b - bizzaro0_data
	word	bizzaro0_data_c - bizzaro0_data

bizzaro0_start_end:
	byte	0,0,1,1,0,0,2,2


bizzaro0_data_a:
	byte	0x07, 0x13, 0xfe, 0xfd, 0x00, 0x00
	byte	run,0x80+15
	byte	run,4,1
	byte	run,0x80+11
	byte	1
	byte	5
	byte	21
	byte	run,5,85
	byte	run,0x80+7
	byte	1
	byte	5
	byte	21
	byte	run,9,85
	byte	run,0x80+1
	byte	31
	byte	21
	byte	31
	byte	31
	byte	95
	byte	run,3,85
	byte	127
	byte	run,3,255
	byte	253
	byte	run,5,85
	byte	40
	byte	184
	byte	248
	byte	248
	byte	232
	byte	232
	byte	254
	byte	255
	byte	250
	byte	239
	byte	239
	byte	255
	byte	255
	byte	run,3,95
	byte	run,3,85
	byte	run,0x80+7
	byte	128
	byte	170
	byte	255
	byte	255
	byte	run,4,251
	byte	255
	byte	run,3,85
	byte	run,0x80+8
	byte	168
	byte	248
	byte	224
	byte	128
	byte	224
	byte	248
	byte	253
	byte	253
	byte	run,3,85




bizzaro0_data_b:
	byte	0x07, 0x13, 0xfd, 0xfd, 0x00, 0x00
	byte	run,0x80+9
	byte	2
	byte	run,3,11
	byte	1
	byte	run,5,5
	byte	run,0x80+8
	byte	168
	byte	254
	byte	251
	byte	239
	byte	127
	byte	run,3,95
	byte	run,3,85
	byte	run,0x80+1
	byte	run,5,2
	byte	11
	byte	47
	byte	190
	byte	251
	byte	run,6,255
	byte	run,3,85
	byte	run,3,255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	175
	byte	170
	byte	255
	byte	255
	byte	run,4,190
	byte	255
	byte	run,3,85
	byte	run,0x80+1
	byte	run,5,128
	byte	224
	byte	248
	byte	190
	byte	239
	byte	run,6,255
	byte	run,3,85
	byte	run,0x80+8
	byte	42
	byte	191
	byte	239
	byte	251
	byte	254
	byte	255
	byte	253
	byte	253
	byte	run,3,85
	byte	run,0x80+9
	byte	128
	byte	run,3,224
	byte	64
	byte	run,5,80




bizzaro0_data_c:
	byte	0x05, 0x09, 0xfe, 0xfa, 0x00, 0x00
	byte	run,0x80+3
	byte	1
	byte	5
	byte	run,4,85
	byte	run,0x80+1
	byte	63
	byte	run,7,85
	byte	252
	byte	255
	byte	run,7,85
	byte	run,0x80+1
	byte	240
	byte	run,7,85
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,3,85




