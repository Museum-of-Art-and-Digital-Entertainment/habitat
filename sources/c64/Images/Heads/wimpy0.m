;---------------------------------------
;
;	animation cel data
;

wimpy0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	wimpy0_start_end - wimpy0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	wimpy0_data_a - wimpy0_data
	word	wimpy0_data_b - wimpy0_data
	word	wimpy0_data_c - wimpy0_data

wimpy0_start_end:
	byte	0,0,1,1,0,0,2,2


wimpy0_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	run,3,11
	byte	run,3,47
	byte	171
	byte	171
	byte	42
	byte	170
	byte	162
	byte	2
	byte	9
	byte	run,3,37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	191
	byte	255
	byte	255
	byte	254
	byte	run,4,251
	byte	250
	byte	255
	byte	255
	byte	run,3,170
	byte	run,5,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	190
	byte	run,4,255
	byte	239
	byte	175
	byte	255
	byte	255
	byte	run,3,170
	byte	run,5,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	224
	byte	248
	byte	234
	byte	186
	byte	250
	byte	250
	byte	run,3,255
	byte	254
	byte	248
	byte	170
	byte	224
	byte	run,3,160
	byte	88
	byte	run,3,86
	byte	88
	byte	160
	byte	run,0x80+9
	byte	run,4,128
	byte	run,0x80+13




wimpy0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	2
	byte	run,5,11
	byte	2
	byte	2
	byte	10
	byte	run,0x80+2
	byte	2
	byte	run,3,9
	byte	2
	byte	run,0x80+1
	byte	3
	byte	run,3,2
	byte	10
	byte	47
	byte	190
	byte	187
	byte	251
	byte	run,6,255
	byte	250
	byte	191
	byte	run,3,170
	byte	run,5,85
	byte	170
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	170
	byte	run,3,171
	byte	run,4,255
	byte	187
	byte	186
	byte	255
	byte	run,3,170
	byte	run,5,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	224
	byte	248
	byte	184
	byte	190
	byte	254
	byte	run,5,255
	byte	190
	byte	248
	byte	run,3,168
	byte	86
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+10
	byte	run,5,128
	byte	run,0x80+6
	byte	run,3,128
	byte	run,0x80+2




wimpy0_data_c:
	byte	0x03, 0x0b, 0xff, 0xfa, 0x00, 0x00
	byte	run,11,63
	byte	run,9,255
	byte	250
	byte	250
	byte	248
	byte	248
	byte	254
	byte	254
	byte	run,3,255
	byte	250
	byte	run,3,170




