;---------------------------------------
;
;	animation cel data
;

tophat0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	tophat0_start_end - tophat0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tophat0_data_a - tophat0_data
	word	tophat0_data_b - tophat0_data
	word	tophat0_data_c - tophat0_data

tophat0_start_end:
	byte	0,0,1,1,0,0,2,2


tophat0_data_a:
	byte	0x04, 0x22, 0x00, 0x0c, 0x00, 0x00
	byte	run,0x80+7
	byte	run,10,2
	byte	170
	byte	170
	byte	run,15,2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,5,170
	byte	run,4,85
	byte	run,11,170
	byte	40
	byte	184
	byte	248
	byte	248
	byte	234
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	run,3,175
	byte	170
	byte	170
	byte	run,4,85
	byte	run,11,170
	byte	run,0x80+4
	byte	128
	byte	run,5,224
	byte	232
	byte	248
	byte	248
	byte	run,4,224
	byte	170
	byte	170
	byte	run,4,96
	byte	run,11,160




tophat0_data_b:
	byte	0x05, 0x23, 0xfe, 0x0c, 0x00, 0x00
	byte	run,0x80+18
	byte	42
	byte	42
	byte	run,0x80+15
	byte	3
	byte	run,4,2
	byte	run,3,11
	byte	47
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	171
	byte	170
	byte	170
	byte	run,4,149
	byte	run,11,170
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,13,255
	byte	170
	byte	170
	byte	run,4,85
	byte	run,11,170
	byte	run,0x80+5
	byte	run,3,128
	byte	224
	byte	232
	byte	run,4,248
	byte	run,3,232
	byte	168
	byte	170
	byte	170
	byte	run,4,88
	byte	run,11,168
	byte	run,0x80+18
	byte	128
	byte	128
	byte	run,0x80+15




tophat0_data_c:
	byte	0x03, 0x0e, 0xff, 0xfb, 0x00, 0x00
	byte	run,3,2
	byte	run,11,42
	byte	run,14,170
	byte	run,0x80+3
	byte	run,11,160




