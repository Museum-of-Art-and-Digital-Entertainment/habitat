;---------------------------------------
;
;	animation cel data
;

mbeany0_data::
	byte	swing	+ 11
	byte	0b00000000
	byte	mbeany0_start_end - mbeany0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b10001000
	byte	0b10000100
	byte	0b10001000
	byte	0b01010000
	byte	0b01001000
	byte	0b01000100
	byte	0b01001000
	byte	0b01110000
	byte	0b01101000
	byte	0b01100100
	byte	0b01101000

	word	mbeany0_data_a - mbeany0_data
	word	mbeany0_data_b - mbeany0_data
	word	mbeany0_data_c - mbeany0_data
	word	mbeany0_data_d - mbeany0_data
	word	mbeany0_data_e - mbeany0_data
	word	mbeany0_data_f - mbeany0_data

mbeany0_start_end:
	byte	cycle+0,3,cycle+4,7,0,0,cycle+8,11


mbeany0_data_a:
	byte	0x05, 0x19, 0x00, 0x03, 0x02, 0x00
	byte	run,0x80+7
	byte	2
	byte	34
	byte	10
	byte	10
	byte	138
	byte	42
	byte	138
	byte	42
	byte	10
	byte	2
	byte	run,3,9
	byte	2
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	191
	byte	190
	byte	254
	byte	186
	byte	170
	byte	171
	byte	175
	byte	175
	byte	run,4,170
	byte	run,3,105
	byte	90
	byte	90
	byte	150
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	191
	byte	255
	byte	254
	byte	run,6,255
	byte	190
	byte	191
	byte	170
	byte	run,3,86
	byte	90
	byte	89
	byte	101
	byte	166
	byte	168
	byte	run,0x80+3
	byte	128
	byte	224
	byte	248
	byte	168
	byte	248
	byte	248
	byte	254
	byte	run,3,255
	byte	238
	byte	248
	byte	184
	byte	160
	byte	152
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+12
	byte	run,3,128
	byte	run,0x80+12




mbeany0_data_b:
	byte	0x04, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+9
	byte	run,7,2
	byte	run,0x80+1
	byte	run,4,2
	byte	run,0x80+5
	byte	3
	byte	run,3,2
	byte	10
	byte	47
	byte	191
	byte	190
	byte	191
	byte	191
	byte	run,3,255
	byte	191
	byte	187
	byte	190
	byte	170
	byte	run,3,90
	byte	86
	byte	150
	byte	149
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	171
	byte	254
	byte	255
	byte	239
	byte	run,3,255
	byte	187
	byte	255
	byte	238
	byte	170
	byte	run,3,85
	byte	run,3,150
	byte	153
	byte	105
	byte	170
	byte	run,0x80+4
	byte	128
	byte	224
	byte	run,3,248
	byte	250
	byte	run,3,254
	byte	250
	byte	186
	byte	250
	byte	168
	byte	run,3,166
	byte	150
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1




mbeany0_data_c:
	byte	0x03, 0x0c, 0xff, 0xf9, 0x00, 0x00
	byte	10
	byte	46
	byte	190
	byte	186
	byte	run,8,170
	byte	254
	byte	254
	byte	run,10,170
	byte	128
	byte	224
	byte	200
	byte	184
	byte	run,8,168




mbeany0_data_d:
	byte	0x04, 0x04, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	run,0x80+2
	byte	170
	byte	255
	byte	170
	byte	32
	byte	34
	byte	139
	byte	2
	byte	run,0x80+1
	byte	168
	byte	254
	byte	168




mbeany0_data_e:
	byte	0x03, 0x04, 0xff, 0x07, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	11
	byte	2
	byte	32
	byte	34
	byte	139
	byte	2
	byte	run,0x80+2
	byte	128
	byte	run,0x80+1




mbeany0_data_f:
	byte	cel_box + 0x01, 0x04, 0x00, 0x07, 0x00, 0x00
	byte	0x20

