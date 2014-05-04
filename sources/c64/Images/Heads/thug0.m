;---------------------------------------
;
;	animation cel data
;

thug0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	thug0_start_end - thug0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	thug0_data_a - thug0_data
	word	thug0_data_b - thug0_data
	word	thug0_data_c - thug0_data

thug0_start_end:
	byte	0,0,1,1,0,0,2,2


thug0_data_a:
	byte	0x04, 0x15, 0x00, 0xff, 0x00, 0x00
	byte	run,0x80+12
	byte	run,7,1
	byte	run,0x80+3
	byte	47
	byte	42
	byte	run,3,47
	byte	45
	byte	29
	byte	21
	byte	85
	byte	85
	byte	run,3,87
	byte	run,6,85
	byte	21
	byte	40
	byte	184
	byte	248
	byte	250
	byte	235
	byte	191
	byte	run,7,255
	byte	223
	byte	95
	byte	127
	byte	126
	byte	86
	byte	run,3,85
	byte	run,0x80+3
	byte	160
	byte	232
	byte	248
	byte	160
	byte	248
	byte	224
	byte	run,3,248
	byte	232
	byte	254
	byte	184
	byte	160
	byte	160
	byte	184
	byte	224
	byte	64
	byte	run,0x80+1




thug0_data_b:
	byte	0x03, 0x16, 0xff, 0xff, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	47
	byte	run,5,191
	byte	255
	byte	255
	byte	95
	byte	95
	byte	94
	byte	90
	byte	90
	byte	23
	byte	21
	byte	5
	byte	255
	byte	254
	byte	run,3,170
	byte	239
	byte	255
	byte	235
	byte	255
	byte	239
	byte	run,3,255
	byte	239
	byte	255
	byte	187
	byte	186
	byte	186
	byte	254
	byte	255
	byte	85
	byte	85
	byte	run,0x80+5
	byte	128
	byte	224
	byte	run,5,248
	byte	252
	byte	252
	byte	run,3,212
	byte	84
	byte	84
	byte	80
	byte	80
	byte	64




thug0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfd, 0x00, 0x00
	byte	10
	byte	43
	byte	191
	byte	191
	byte	189
	byte	181
	byte	149
	byte	213
	byte	213
	byte	run,6,85
	byte	254
	byte	255
	byte	255
	byte	87
	byte	run,11,85
	byte	128
	byte	160
	byte	248
	byte	248
	byte	120
	byte	120
	byte	88
	byte	92
	byte	92
	byte	run,6,84




