;---------------------------------------
;
;	animation cel data
;

ascot0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	ascot0_start_end - ascot0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	ascot0_data_a - ascot0_data
	word	ascot0_data_b - ascot0_data
	word	ascot0_data_c - ascot0_data

ascot0_start_end:
	byte	0,0,1,1,0,0,2,2


ascot0_data_a:
	byte	0x05, 0x19, 0xff, 0x03, 0x00, 0x00
	byte	run,0x80+1
	byte	10
	byte	9
	byte	10
	byte	37
	byte	41
	byte	149
	byte	170
	byte	run,0x80+18
	byte	170
	byte	run,5,85
	byte	170
	byte	2
	byte	run,11,10
	byte	2
	byte	run,0x80+5
	byte	165
	byte	105
	byte	86
	byte	85
	byte	85
	byte	86
	byte	run,3,170
	byte	run,4,171
	byte	run,8,170
	byte	42
	byte	10
	byte	run,0x80+1
	byte	40
	byte	152
	byte	152
	byte	88
	byte	106
	byte	107
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	run,5,175
	byte	run,5,170
	byte	2
	byte	run,0x80+4
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	run,3,248
	byte	160
	byte	run,4,224
	byte	128
	byte	160
	byte	run,3,168
	byte	160




ascot0_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0x00, 0x00
	byte	2
	byte	41
	byte	149
	byte	101
	byte	102
	byte	90
	byte	91
	byte	run,3,175
	byte	run,4,191
	byte	174
	byte	run,3,175
	byte	171
	byte	43
	byte	42
	byte	42
	byte	10
	byte	2
	byte	run,0x80+1
	byte	170
	byte	run,3,85
	byte	170
	byte	255
	byte	255
	byte	235
	byte	255
	byte	255
	byte	239
	byte	run,3,255
	byte	186
	byte	run,3,255
	byte	254
	byte	234
	byte	run,4,170
	byte	58
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	152
	byte	160
	byte	128
	byte	run,3,232
	byte	run,4,248
	byte	run,3,232
	byte	168
	byte	168
	byte	run,3,170
	byte	168
	byte	168
	byte	160




ascot0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfd, 0x00, 0x00
	byte	run,5,10
	byte	run,10,42
	byte	run,15,170
	byte	run,5,128
	byte	run,10,160




