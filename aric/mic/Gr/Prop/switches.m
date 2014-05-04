;---------------------------------------
;
;	animation cel data
;

switches_data::
	byte	out	+ 5
	byte	0b00000000
	byte	switches_start_end - switches_data
	byte	no_cont

	byte	240+right,20+left,222

	byte	0b10000000
	byte	0b11000000
	byte	0b00100000
	byte	0b00110000
	byte	0b00001100
	byte	0b00001010

	word	switches_data_a - switches_data
	word	switches_data_b - switches_data
	word	switches_data_c - switches_data
	word	switches_data_d - switches_data
	word	switches_data_e - switches_data
	word	switches_data_f - switches_data
	word	switches_data_g - switches_data

switches_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


switches_data_a:
	byte	0x05, 0x10, 0xff, 0x1c, 0x00, 0x00

	byte	170
	byte	149
	byte	165
	byte	181
	byte	150
	byte	151
	byte	149
	byte	150
	byte	150
	byte	149
	byte	150
	byte	151
	byte	165
	byte	181
	byte	149
	byte	170
	byte	170
	byte	run,3,85
	byte	154
	byte	218
	byte	85
	byte	154
	byte	159
	byte	85
	byte	154
	byte	218
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	105
	byte	125
	byte	85
	byte	105
	byte	105
	byte	85
	byte	105
	byte	125
	byte	run,3,85
	byte	170
	byte	170
	byte	run,3,85
	byte	166
	byte	167
	byte	85
	byte	166
	byte	246
	byte	85
	byte	166
	byte	167
	byte	run,3,85
	byte	170
	byte	170
	byte	86
	byte	90
	byte	94
	byte	150
	byte	214
	byte	86
	byte	150
	byte	150
	byte	86
	byte	150
	byte	214
	byte	90
	byte	94
	byte	86
	byte	170




switches_data_b:
	byte	0x05, 0x08, 0xff, 0x18, 0x00, 0x00

	byte	2
	byte	2
	byte	run,0x80+1
	byte	3
	byte	2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	143
	byte	138
	byte	run,0x80+1
	byte	202
	byte	138
	byte	run,0x80+1
	byte	143
	byte	138
	byte	40
	byte	40
	byte	run,0x80+1
	byte	60
	byte	40
	byte	run,0x80+1
	byte	40
	byte	40
	byte	242
	byte	162
	byte	run,0x80+1
	byte	163
	byte	162
	byte	run,0x80+1
	byte	242
	byte	162
	byte	128
	byte	128
	byte	run,0x80+1
	byte	192
	byte	128
	byte	run,0x80+1
	byte	128
	byte	128




switches_data_c:
	byte	0x02, 0x0d, 0xfc, 0x32, 0x00, 0x00

	byte	170
	byte	run,3,149
	byte	150
	byte	run,3,155
	byte	150
	byte	run,3,149
	byte	170
	byte	168
	byte	run,4,88
	byte	run,3,152
	byte	run,4,88
	byte	168




switches_data_d:
	byte	cel_box + 0x01, 0x03, 0xfc, 0x2d, 0x00, 0x00
	byte	0x02

switches_data_e:
	byte	cel_box + 0x01, 0x01, 0x01, 0x28, 0x00, 0x00
	byte	0xaa

switches_data_f:
	byte	0x03, 0x15, 0x01, 0x3a, 0x00, 0x00

	byte	8
	byte	38
	byte	run,3,166
	byte	run,5,38
	byte	37
	byte	42
	byte	2
	byte	2
	byte	run,0x80+7
	byte	2
	byte	run,7,9
	byte	169
	byte	169
	byte	85
	byte	170
	byte	88
	byte	168
	byte	run,7,160
	byte	run,0x80+1
	byte	128
	byte	run,3,160
	byte	run,7,128
	byte	run,0x80+9




switches_data_g:
	byte	0x03, 0x15, 0x01, 0x2c, 0x00, 0x00

	byte	run,0x80+7
	byte	2
	byte	2
	byte	42
	byte	37
	byte	run,5,38
	byte	run,3,166
	byte	38
	byte	8
	byte	run,7,160
	byte	168
	byte	88
	byte	170
	byte	85
	byte	169
	byte	run,8,9
	byte	2
	byte	run,0x80+9
	byte	run,7,128
	byte	run,3,160
	byte	128
	byte	run,0x80+1




