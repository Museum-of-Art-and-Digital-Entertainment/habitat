;---------------------------------------
;
;	animation cel data
;

cootie0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	cootie0_start_end - cootie0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10111000
	byte	0b01101000
	byte	0b01101110

	word	cootie0_data_a - cootie0_data
	word	cootie0_data_b - cootie0_data
	word	cootie0_data_c - cootie0_data
	word	cootie0_data_d - cootie0_data
	word	cootie0_data_e - cootie0_data
	word	cootie0_data_f - cootie0_data
	word	cootie0_data_g - cootie0_data

cootie0_start_end:
	byte	0,0,1,1,0,0,2,2


cootie0_data_a:
	byte	0x06, 0x17, 0x00, 0x01, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	11
	byte	47
	byte	47
	byte	run,6,191
	byte	run,3,47
	byte	11
	byte	2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,7,255
	byte	run,4,254
	byte	255
	byte	255
	byte	191
	byte	191
	byte	170
	byte	128
	byte	40
	byte	184
	byte	248
	byte	248
	byte	232
	byte	234
	byte	run,6,255
	byte	175
	byte	run,4,91
	byte	175
	byte	255
	byte	254
	byte	232
	byte	128
	byte	run,0x80+6
	byte	170
	byte	run,8,255
	byte	254
	byte	248
	byte	248
	byte	224
	byte	128
	byte	run,0x80+5
	byte	42
	byte	149
	byte	153
	byte	150
	byte	170
	byte	249
	byte	249
	byte	250
	byte	248
	byte	248
	byte	224
	byte	128
	byte	128
	byte	run,0x80+11
	byte	128
	byte	run,4,96
	byte	128
	byte	run,0x80+15




cootie0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+11
	byte	2
	byte	2
	byte	run,6,11
	byte	run,3,2
	byte	run,0x80+2
	byte	3
	byte	run,5,2
	byte	11
	byte	11
	byte	47
	byte	175
	byte	191
	byte	255
	byte	255
	byte	235
	byte	run,4,150
	byte	235
	byte	255
	byte	255
	byte	191
	byte	171
	byte	2
	byte	255
	byte	254
	byte	170
	byte	run,3,154
	byte	run,3,155
	byte	239
	byte	255
	byte	171
	byte	255
	byte	255
	byte	run,4,254
	byte	run,5,255
	byte	170
	byte	run,0x80+6
	byte	128
	byte	128
	byte	224
	byte	232
	byte	248
	byte	254
	byte	254
	byte	175
	byte	run,4,91
	byte	175
	byte	254
	byte	254
	byte	250
	byte	168
	byte	run,0x80+14
	byte	run,6,128
	byte	run,0x80+5




cootie0_data_c:
	byte	0x02, 0x0f, 0x01, 0x0e, 0x00, 0x00
	byte	168
	byte	8
	byte	10
	byte	run,3,2
	byte	run,0x80+14
	byte	run,3,128
	byte	160
	byte	32
	byte	32
	byte	40
	byte	run,3,8




cootie0_data_d:
	byte	cel_box + 0x01, 0x01, 0x01, 0x01, 0x02, 0x00
	byte	0x80

cootie0_data_e:
	byte	0x02, 0x0f, 0xfe, 0x0e, 0x00, 0x00
	byte	run,0x80+2
	byte	run,3,2
	byte	10
	byte	8
	byte	8
	byte	40
	byte	32
	byte	32
	byte	160
	byte	run,3,128
	byte	160
	byte	128
	byte	128
	byte	run,0x80+12




cootie0_data_f:
	byte	cel_box + 0x03, 0x06, 0xff, 0xfc, 0x00, 0x00
	byte	0xff

cootie0_data_g:
	byte	cel_box + 0x01, 0x06, 0x00, 0xf5, 0x00, 0x00
	byte	0xff

