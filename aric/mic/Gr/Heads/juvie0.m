;---------------------------------------
;
;	animation cel data
;

juvie0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	juvie0_start_end - juvie0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	juvie0_data_a - juvie0_data
	word	juvie0_data_b - juvie0_data
	word	juvie0_data_c - juvie0_data

juvie0_start_end:
	byte	0,0,1,1,0,0,2,2


juvie0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+10
	byte	run,10,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	run,5,47
	byte	46
	byte	186
	byte	run,4,251
	byte	234
	byte	run,7,170
	byte	42
	byte	2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	174
	byte	run,7,170
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	160
	byte	run,3,224
	byte	232
	byte	248
	byte	248
	byte	160
	byte	224
	byte	224
	byte	162
	byte	168
	byte	168
	byte	170
	byte	160
	byte	136
	byte	32
	byte	run,0x80+1




juvie0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,3,191
	byte	190
	byte	run,4,47
	byte	43
	byte	run,3,42
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	175
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	186
	byte	255
	byte	254
	byte	234
	byte	187
	byte	174
	byte	run,5,170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	232
	byte	160
	byte	160
	byte	168
	byte	160
	byte	160
	byte	168
	byte	160
	byte	136
	byte	run,0x80+1




juvie0_data_c:
	byte	0x02, 0x11, 0xff, 0xfc, 0x00, 0x00
	byte	run,5,2
	byte	run,7,3
	byte	15
	byte	run,4,10
	byte	run,5,254
	byte	run,8,255
	byte	run,4,170




