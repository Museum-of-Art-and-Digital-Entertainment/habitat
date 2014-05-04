;---------------------------------------
;
;	animation cel data
;

vampire0_data::
	byte	swing	+ 2
	byte	0b10000000
	byte	vampire0_start_end - vampire0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	vampire0_data_a - vampire0_data
	word	vampire0_data_b - vampire0_data
	word	vampire0_data_c - vampire0_data

vampire0_start_end:
	byte	0,0,1,1,0,0,2,2


vampire0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	2
	byte	10
	byte	8
	byte	32
	byte	run,0x80+2
	byte	1
	byte	run,9,5
	byte	1
	byte	1
	byte	run,0x80+4
	byte	175
	byte	170
	byte	175
	byte	47
	byte	47
	byte	23
	byte	run,3,85
	byte	run,4,87
	byte	run,8,85
	byte	21
	byte	5
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	190
	byte	185
	byte	186
	byte	251
	byte	255
	byte	255
	byte	223
	byte	223
	byte	95
	byte	94
	byte	127
	byte	127
	byte	95
	byte	95
	byte	run,3,85
	byte	84
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	160
	byte	224
	byte	232
	byte	254
	byte	254
	byte	248
	byte	184
	byte	160
	byte	run,3,224
	byte	80
	byte	64
	byte	64
	byte	run,0x80+2




vampire0_data_b:
	byte	0x05, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	10
	byte	8
	byte	8
	byte	run,0x80+15
	byte	3
	byte	2
	byte	10
	byte	170
	byte	170
	byte	171
	byte	175
	byte	46
	byte	45
	byte	126
	byte	123
	byte	run,3,127
	byte	95
	byte	95
	byte	94
	byte	127
	byte	127
	byte	95
	byte	29
	byte	21
	byte	5
	byte	1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	254
	byte	253
	byte	170
	byte	255
	byte	239
	byte	run,3,255
	byte	187
	byte	186
	byte	255
	byte	223
	byte	87
	byte	run,4,85
	byte	run,0x80+2
	byte	128
	byte	168
	byte	168
	byte	170
	byte	234
	byte	224
	byte	224
	byte	244
	byte	180
	byte	run,3,244
	byte	run,3,212
	byte	244
	byte	244
	byte	212
	byte	208
	byte	80
	byte	64
	byte	run,0x80+7
	byte	run,3,128
	byte	run,0x80+15




vampire0_data_c:
	byte	0x02, 0x02, 0xff, 0xeb, 0x00, 0x00
	byte	2
	byte	2
	byte	170
	byte	170




