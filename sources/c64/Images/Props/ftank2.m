;---------------------------------------
;
;	animation cel data
;

ftank2_data::
	byte	both	+ 10
	byte	0b00000000
	byte	ftank2_start_end - ftank2_data
	byte	no_cont

	byte	240+right,40+left,255

	byte	0b11000000
	byte	0b11100000
	byte	0b11010000
	byte	0b11001000
	byte	0b11000100
	byte	0b11000010
	byte	0b00100000
	byte	0b00010000
	byte	0b00001000
	byte	0b00000100
	byte	0b00000010

	word	ftank2_data_a - ftank2_data
	word	ftank2_data_b - ftank2_data
	word	ftank2_data_c - ftank2_data
	word	ftank2_data_d - ftank2_data
	word	ftank2_data_e - ftank2_data
	word	ftank2_data_f - ftank2_data
	word	ftank2_data_g - ftank2_data

ftank2_start_end:
	byte	0,0,cycle+1,5,cycle+6,10


ftank2_data_a:
	byte	cel_box + both_bord + 0x07, 0x05, 0xff, 0xe1, 0x00, 0x00
	byte	0q3333

ftank2_data_b:
	byte	cel_box + both_bord + 0x07, 0x19, 0xff, 0xf9, 0x00, 0x00
	byte	0q1111

ftank2_data_c:
	byte	0x05, 0x0f, 0x00, 0xf3, 0x00, 0x00
	byte	32
	byte	40
	byte	46
	byte	run,3,11
	byte	46
	byte	40
	byte	32
	byte	run,0x80+6
	byte	42
	byte	191
	byte	255
	byte	255
	byte	254
	byte	255
	byte	254
	byte	191
	byte	42
	byte	run,0x80+7
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	224
	byte	128
	byte	2
	byte	11
	byte	47
	byte	46
	byte	11
	byte	2
	byte	run,0x80+9
	byte	170
	byte	191
	byte	239
	byte	251
	byte	255
	byte	170
	byte	run,0x80+8
	byte	2
	byte	138
	byte	238
	byte	254
	byte	254
	byte	238
	byte	138
	byte	2




ftank2_data_d:
	byte	0x05, 0x0f, 0x00, 0xf3, 0x00, 0x00
	byte	8
	byte	10
	byte	11
	byte	11
	byte	2
	byte	11
	byte	11
	byte	10
	byte	8
	byte	run,0x80+6
	byte	10
	byte	47
	byte	191
	byte	run,3,255
	byte	191
	byte	47
	byte	10
	byte	run,0x80+6
	byte	128
	byte	224
	byte	248
	byte	224
	byte	128
	byte	248
	byte	184
	byte	224
	byte	154
	byte	46
	byte	191
	byte	187
	byte	47
	byte	10
	byte	run,0x80+9
	byte	170
	byte	255
	byte	191
	byte	239
	byte	255
	byte	170
	byte	run,0x80+8
	byte	8
	byte	40
	byte	184
	byte	248
	byte	248
	byte	184
	byte	40
	byte	8




ftank2_data_e:
	byte	0x04, 0x11, 0x01, 0xf3, 0x00, 0x00
	byte	32
	byte	40
	byte	46
	byte	run,3,11
	byte	46
	byte	40
	byte	32
	byte	run,0x80+2
	byte	2
	byte	11
	byte	11
	byte	2
	byte	run,0x80+2
	byte	42
	byte	191
	byte	255
	byte	255
	byte	254
	byte	255
	byte	254
	byte	191
	byte	42
	byte	run,0x80+1
	byte	170
	byte	239
	byte	251
	byte	190
	byte	255
	byte	170
	byte	run,0x80+2
	byte	128
	byte	224
	byte	224
	byte	160
	byte	224
	byte	224
	byte	128
	byte	run,0x80+2
	byte	162
	byte	251
	byte	255
	byte	255
	byte	251
	byte	162
	byte	run,0x80+10
	byte	run,8,128




ftank2_data_f:
	byte	0x06, 0x0e, 0x00, 0xf3, 0x00, 0x00
	byte	run,0x80+7
	byte	10
	byte	46
	byte	191
	byte	187
	byte	47
	byte	10
	byte	run,0x80+8
	byte	170
	byte	255
	byte	191
	byte	239
	byte	255
	byte	170
	byte	run,0x80+7
	byte	8
	byte	40
	byte	184
	byte	248
	byte	248
	byte	184
	byte	40
	byte	8
	byte	32
	byte	40
	byte	46
	byte	47
	byte	11
	byte	47
	byte	46
	byte	40
	byte	32
	byte	run,0x80+5
	byte	42
	byte	191
	byte	255
	byte	255
	byte	254
	byte	255
	byte	254
	byte	191
	byte	42
	byte	run,0x80+6
	byte	128
	byte	224
	byte	128
	byte	run,0x80+1
	byte	224
	byte	224
	byte	128
	byte	run,0x80+6




ftank2_data_g:
	byte	0x06, 0x0f, 0x00, 0xf3, 0x00, 0x00
	byte	128
	byte	162
	byte	187
	byte	191
	byte	47
	byte	191
	byte	187
	byte	162
	byte	128
	byte	run,0x80+6
	byte	168
	byte	254
	byte	255
	byte	254
	byte	248
	byte	255
	byte	251
	byte	254
	byte	168
	byte	run,0x80+8
	byte	128
	byte	run,0x80+2
	byte	128
	byte	128
	byte	run,0x80+2
	byte	2
	byte	11
	byte	11
	byte	2
	byte	run,0x80+10
	byte	170
	byte	239
	byte	251
	byte	190
	byte	255
	byte	170
	byte	run,0x80+9
	byte	162
	byte	251
	byte	255
	byte	255
	byte	251
	byte	162
	byte	run,0x80+8
	byte	run,8,128




