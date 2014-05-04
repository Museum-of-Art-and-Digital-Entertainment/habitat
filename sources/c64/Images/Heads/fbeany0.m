;---------------------------------------
;
;	animation cel data
;

fbeany0_data::
	byte	swing	+ 11
	byte	0b00000000
	byte	fbeany0_start_end - fbeany0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10001000
	byte	0b10000100
	byte	0b10000010
	byte	0b10000100
	byte	0b01011000
	byte	0b01010100
	byte	0b01010010
	byte	0b01010100
	byte	0b01111000
	byte	0b01110100
	byte	0b01110010
	byte	0b01110100

	word	fbeany0_data_a - fbeany0_data
	word	fbeany0_data_b - fbeany0_data
	word	fbeany0_data_c - fbeany0_data
	word	fbeany0_data_d - fbeany0_data
	word	fbeany0_data_e - fbeany0_data
	word	fbeany0_data_f - fbeany0_data
	word	fbeany0_data_g - fbeany0_data

fbeany0_start_end:
	byte	cycle+0,3,cycle+4,7,0,0,cycle+8,11


fbeany0_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x02, 0x01
	byte	run,0x80+2
	byte	10
	byte	42
	byte	run,3,170
	byte	138
	byte	run,4,10
	byte	run,8,2
	byte	run,0x80+6
	byte	47
	byte	run,15,170
	byte	run,3,90
	byte	150
	byte	150
	byte	37
	byte	9
	byte	2
	byte	40
	byte	184
	byte	248
	byte	248
	byte	174
	byte	255
	byte	191
	byte	191
	byte	run,5,175
	byte	174
	byte	174
	byte	171
	byte	170
	byte	86
	byte	86
	byte	90
	byte	154
	byte	153
	byte	165
	byte	150
	byte	168
	byte	run,0x80+4
	byte	128
	byte	224
	byte	232
	byte	184
	byte	248
	byte	248
	byte	254
	byte	238
	byte	168
	byte	248
	byte	248
	byte	160
	byte	168
	byte	152
	byte	152
	byte	88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




fbeany0_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	10
	byte	10
	byte	34
	byte	run,8,2
	byte	run,0x80+1
	byte	run,3,2
	byte	run,0x80+5
	byte	3
	byte	2
	byte	42
	byte	170
	byte	170
	byte	171
	byte	171
	byte	run,5,175
	byte	174
	byte	171
	byte	174
	byte	175
	byte	170
	byte	run,3,90
	byte	150
	byte	150
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	254
	byte	170
	byte	254
	byte	255
	byte	239
	byte	187
	byte	255
	byte	239
	byte	255
	byte	187
	byte	186
	byte	255
	byte	254
	byte	187
	byte	170
	byte	85
	byte	85
	byte	86
	byte	150
	byte	150
	byte	153
	byte	101
	byte	170
	byte	run,0x80+2
	byte	160
	byte	168
	byte	run,3,170
	byte	run,6,234
	byte	170
	byte	234
	byte	234
	byte	168
	byte	166
	byte	166
	byte	150
	byte	152
	byte	88
	byte	96
	byte	128
	byte	run,0x80+1




fbeany0_data_c:
	byte	cel_box + 0x03, 0x0e, 0xff, 0xf9, 0x00, 0x00
	byte	0xaa

fbeany0_data_d:
	byte	0x01, 0x03, 0x02, 0xf1, 0x00, 0x00
	byte	128
	byte	128
	byte	32




fbeany0_data_e:
	byte	0x04, 0x04, 0xfe, 0x06, 0x00, 0x00
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




fbeany0_data_f:
	byte	0x03, 0x04, 0xff, 0x06, 0x00, 0x00
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




fbeany0_data_g:
	byte	cel_box + 0x01, 0x04, 0x00, 0x06, 0x00, 0x00
	byte	0x20

