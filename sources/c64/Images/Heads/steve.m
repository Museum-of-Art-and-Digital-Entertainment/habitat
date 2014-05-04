;---------------------------------------
;
;	animation cel data
;

steve_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	steve_start_end - steve_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	steve_data_a - steve_data
	word	steve_data_b - steve_data
	word	steve_data_c - steve_data

steve_start_end:
	byte	0,0,1,1,0,0,2,2


steve_data_a:
	byte	0x04, 0x1c, 0x00, 0x06, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	2
	byte	run,3,10
	byte	run,11,42
	byte	run,3,10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	175
	byte	run,3,171
	byte	run,5,175
	byte	run,12,170
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	234
	byte	234
	byte	run,3,170
	byte	174
	byte	174
	byte	175
	byte	run,4,191
	byte	190
	byte	run,4,175
	byte	171
	byte	171
	byte	run,5,170
	byte	run,0x80+3
	byte	128
	byte	run,4,160
	byte	224
	byte	160
	byte	160
	byte	232
	byte	248
	byte	248
	byte	224
	byte	224
	byte	160
	byte	160
	byte	run,5,224
	byte	168
	byte	160
	byte	160
	byte	128
	byte	run,0x80+1




steve_data_b:
	byte	0x04, 0x1d, 0xfe, 0x06, 0x00, 0x00
	byte	run,0x80+12
	byte	run,7,2
	byte	run,0x80+10
	byte	3
	byte	run,3,2
	byte	10
	byte	run,3,42
	byte	170
	byte	170
	byte	174
	byte	174
	byte	run,5,191
	byte	186
	byte	190
	byte	run,3,175
	byte	170
	byte	170
	byte	42
	byte	42
	byte	10
	byte	10
	byte	run,0x80+1
	byte	255
	byte	254
	byte	254
	byte	run,6,170
	byte	254
	byte	170
	byte	170
	byte	239
	byte	239
	byte	run,3,255
	byte	186
	byte	186
	byte	run,4,255
	byte	175
	byte	171
	byte	run,4,170
	byte	run,0x80+4
	byte	128
	byte	run,3,160
	byte	168
	byte	168
	byte	232
	byte	232
	byte	run,5,250
	byte	186
	byte	250
	byte	250
	byte	run,4,232
	byte	168
	byte	160
	byte	160
	byte	128
	byte	run,0x80+1




steve_data_c:
	byte	0x03, 0x10, 0xff, 0x02, 0x00, 0x00
	byte	run,32,170
	byte	run,16,160




