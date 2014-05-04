;---------------------------------------
;
;	animation cel data
;

cyclops0_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	cyclops0_start_end - cyclops0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000
	byte	0b01010000

	word	cyclops0_data_a - cyclops0_data
	word	cyclops0_data_b - cyclops0_data
	word	cyclops0_data_c - cyclops0_data
	word	cyclops0_data_d - cyclops0_data

cyclops0_start_end:
	byte	0,0,cycle+1,2,0,0,3,3


cyclops0_data_a:
	byte	0x04, 0x15, 0x00, 0xff, 0x00, 0x00
	byte	run,0x80+7
	byte	run,12,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	191
	byte	run,12,255
	byte	191
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	255
	byte	254
	byte	255
	byte	255
	byte	254
	byte	254
	byte	249
	byte	254
	byte	254
	byte	run,5,255
	byte	170
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	160
	byte	160
	byte	224
	byte	152
	byte	88
	byte	run,3,104
	byte	88
	byte	152
	byte	run,3,224
	byte	128
	byte	run,0x80+1




cyclops0_data_b:
	byte	0x03, 0x16, 0xff, 0xff, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	191
	byte	190
	byte	190
	byte	185
	byte	190
	byte	190
	byte	run,3,191
	byte	47
	byte	47
	byte	42
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	171
	byte	171
	byte	255
	byte	171
	byte	86
	byte	102
	byte	101
	byte	102
	byte	86
	byte	171
	byte	run,4,255
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,3,248
	byte	184
	byte	run,5,248
	byte	224
	byte	224
	byte	160




cyclops0_data_c:
	byte	0x02, 0x07, 0xff, 0xfa, 0x00, 0x00
	byte	run,0x80+3
	byte	3
	byte	run,0x80+3
	byte	168
	byte	170
	byte	254
	byte	255
	byte	254
	byte	254
	byte	168




cyclops0_data_d:
	byte	0x03, 0x0b, 0xff, 0xfa, 0x00, 0x00
	byte	3
	byte	run,10,15
	byte	run,11,255
	byte	run,0x80+7
	byte	192
	byte	run,0x80+3




