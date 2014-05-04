;---------------------------------------
;
;	animation cel data
;

nailhead0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	nailhead0_start_end - nailhead0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	nailhead0_data_a - nailhead0_data
	word	nailhead0_data_b - nailhead0_data
	word	nailhead0_data_c - nailhead0_data

nailhead0_start_end:
	byte	0,0,1,1,0,0,2,2


nailhead0_data_a:
	byte	0x06, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+9
	byte	run,3,2
	byte	42
	byte	run,8,170
	byte	40
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	171
	byte	run,13,170
	byte	run,3,42
	byte	10
	byte	2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	174
	byte	174
	byte	run,3,175
	byte	171
	byte	run,11,170
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	160
	byte	96
	byte	160
	byte	224
	byte	248
	byte	254
	byte	174
	byte	168
	byte	run,4,170
	byte	162
	byte	160
	byte	160
	byte	128
	byte	run,0x80+14
	byte	2
	byte	2
	byte	42
	byte	run,5,170
	byte	42
	byte	2
	byte	2
	byte	run,0x80+14
	byte	run,11,128
	byte	run,0x80+3




nailhead0_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	46
	byte	46
	byte	run,3,175
	byte	174
	byte	169
	byte	169
	byte	run,3,165
	byte	169
	byte	41
	byte	42
	byte	42
	byte	10
	byte	run,0x80+2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	171
	byte	86
	byte	170
	byte	255
	byte	255
	byte	171
	byte	86
	byte	run,7,85
	byte	86
	byte	170
	byte	170
	byte	168
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,4,232
	byte	168
	byte	168
	byte	run,3,104
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+2




nailhead0_data_c:
	byte	0x03, 0x11, 0xff, 0xfe, 0x00, 0x00
	byte	run,3,2
	byte	run,14,42
	byte	run,17,170
	byte	run,0x80+3
	byte	run,14,160




