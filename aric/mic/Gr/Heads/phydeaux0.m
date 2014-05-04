;---------------------------------------
;
;	animation cel data
;

phydeaux0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	phydeaux0_start_end - phydeaux0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	phydeaux0_data_a - phydeaux0_data
	word	phydeaux0_data_b - phydeaux0_data
	word	phydeaux0_data_c - phydeaux0_data

phydeaux0_start_end:
	byte	0,0,1,1,0,0,2,2


phydeaux0_data_a:
	byte	0x05, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+5
	byte	10
	byte	43
	byte	171
	byte	42
	byte	170
	byte	42
	byte	170
	byte	42
	byte	10
	byte	run,0x80+16
	byte	47
	byte	42
	byte	47
	byte	175
	byte	run,5,255
	byte	175
	byte	run,10,170
	byte	run,6,43
	byte	11
	byte	2
	byte	40
	byte	184
	byte	248
	byte	250
	byte	255
	byte	255
	byte	251
	byte	254
	byte	254
	byte	255
	byte	255
	byte	239
	byte	175
	byte	251
	byte	234
	byte	250
	byte	run,3,251
	byte	254
	byte	191
	byte	174
	byte	170
	byte	168
	byte	run,5,128
	byte	run,0x80+3
	byte	128
	byte	224
	byte	208
	byte	160
	byte	88
	byte	254
	byte	run,3,255
	byte	254
	byte	186
	byte	184
	byte	160
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+16
	byte	run,5,128
	byte	run,0x80+15




phydeaux0_data_b:
	byte	0x05, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	10
	byte	10
	byte	43
	byte	43
	byte	42
	byte	10
	byte	2
	byte	run,0x80+16
	byte	3
	byte	2
	byte	2
	byte	42
	byte	191
	byte	191
	byte	251
	byte	254
	byte	253
	byte	run,3,255
	byte	191
	byte	187
	byte	170
	byte	186
	byte	187
	byte	187
	byte	186
	byte	175
	byte	171
	byte	171
	byte	170
	byte	run,5,174
	byte	46
	byte	8
	byte	255
	byte	254
	byte	170
	byte	170
	byte	255
	byte	87
	byte	171
	byte	86
	byte	253
	byte	255
	byte	239
	byte	239
	byte	171
	byte	171
	byte	170
	byte	170
	byte	239
	byte	239
	byte	238
	byte	171
	byte	239
	byte	171
	byte	170
	byte	170
	byte	run,5,2
	byte	run,0x80+4
	byte	160
	byte	248
	byte	248
	byte	190
	byte	254
	byte	254
	byte	255
	byte	255
	byte	254
	byte	250
	byte	186
	byte	168
	byte	run,4,184
	byte	232
	byte	run,3,168
	byte	run,5,232
	byte	224
	byte	128
	byte	run,0x80+7
	byte	128
	byte	run,0x80+1
	byte	run,3,160
	byte	128
	byte	run,0x80+17




phydeaux0_data_c:
	byte	0x03, 0x12, 0xff, 0xff, 0x00, 0x00
	byte	run,36,170
	byte	run,18,168




