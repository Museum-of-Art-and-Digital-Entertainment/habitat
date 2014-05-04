;---------------------------------------
;
;	animation cel data
;

hiawatha0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	hiawatha0_start_end - hiawatha0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01010000
	byte	0b01110000

	word	hiawatha0_data_a - hiawatha0_data
	word	hiawatha0_data_b - hiawatha0_data
	word	hiawatha0_data_c - hiawatha0_data
	word	hiawatha0_data_d - hiawatha0_data

hiawatha0_start_end:
	byte	0,0,1,1,0,0,2,2


hiawatha0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+1
	byte	42
	byte	run,3,10
	byte	run,16,2
	byte	run,0x80+4
	byte	175
	byte	run,21,170
	byte	42
	byte	40
	byte	184
	byte	248
	byte	248
	byte	170
	byte	171
	byte	175
	byte	175
	byte	174
	byte	run,4,175
	byte	174
	byte	175
	byte	171
	byte	171
	byte	run,6,170
	byte	168
	byte	run,0x80+5
	byte	128
	byte	224
	byte	160
	byte	224
	byte	224
	byte	248
	byte	240
	byte	176
	byte	160
	byte	224
	byte	224
	byte	160
	byte	224
	byte	run,4,128
	byte	run,0x80+2




hiawatha0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0xff, 0x01
	byte	171
	byte	run,5,170
	byte	171
	byte	175
	byte	174
	byte	175
	byte	run,3,191
	byte	186
	byte	171
	byte	174
	byte	175
	byte	171
	byte	170
	byte	run,3,42
	byte	10
	byte	10
	byte	255
	byte	254
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	175
	byte	255
	byte	255
	byte	239
	byte	255
	byte	187
	byte	186
	byte	239
	byte	254
	byte	187
	byte	255
	byte	186
	byte	run,5,170
	byte	run,7,168
	byte	run,3,232
	byte	run,3,248
	byte	184
	byte	168
	byte	232
	byte	232
	byte	168
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+1




hiawatha0_data_c:
	byte	0x03, 0x13, 0x00, 0xfb, 0x00, 0x00
	byte	run,38,170
	byte	run,19,160




hiawatha0_data_d:
	byte	0x03, 0x0b, 0xff, 0x09, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	42
	byte	41
	byte	170
	byte	169
	byte	42
	byte	42
	byte	10
	byte	run,0x80+1
	byte	10
	byte	165
	byte	86
	byte	89
	byte	101
	byte	149
	byte	86
	byte	104
	byte	160
	byte	run,0x80+1
	byte	170
	byte	106
	byte	170
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+4




