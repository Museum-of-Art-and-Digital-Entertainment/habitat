;---------------------------------------
;
;	animation cel data
;

head8_data::
	byte	swing	+ 3
	byte	0b01000000
	byte	head8_start_end - head8_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b00010000

	word	head8_data_a - head8_data
	word	head8_data_b - head8_data
	word	head8_data_c - head8_data
	word	head8_data_d - head8_data

head8_start_end:
	byte	cycle+0,1,cycle+2,3,0,0,1,1


head8_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+4
	byte	15
	byte	run,5,47
	byte	191
	byte	255
	byte	255
	byte	250
	byte	run,4,251
	byte	250
	byte	run,5,255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	240
	byte	248
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	191
	byte	191
	byte	run,7,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	run,7,224
	byte	128
	byte	128
	byte	run,0x80+2




head8_data_b:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	run,18,2
	byte	run,0x80+2
	byte	15
	byte	run,5,47
	byte	191
	byte	255
	byte	255
	byte	250
	byte	run,4,251
	byte	250
	byte	run,10,255
	byte	191
	byte	42
	byte	240
	byte	248
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	191
	byte	191
	byte	run,10,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	run,9,224
	byte	32
	byte	32
	byte	128
	byte	run,0x80+2




head8_data_c:
	byte	0x03, 0x16, 0xff, 0x00, 0x00, 0x00
	byte	run,0x80+1
	byte	run,3,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	run,4,191
	byte	175
	byte	run,6,47
	byte	11
	byte	11
	byte	2
	byte	252
	byte	238
	byte	186
	byte	254
	byte	run,17,255
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,4,248
	byte	232
	byte	run,6,224
	byte	128
	byte	128
	byte	run,0x80+1




head8_data_d:
	byte	0x03, 0x19, 0xff, 0x03, 0x00, 0x00
	byte	run,0x80+1
	byte	run,3,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	run,4,191
	byte	175
	byte	run,9,47
	byte	11
	byte	11
	byte	2
	byte	252
	byte	238
	byte	186
	byte	254
	byte	run,20,255
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,4,248
	byte	232
	byte	run,9,224
	byte	128
	byte	128
	byte	run,0x80+1




