;---------------------------------------
;
;	animation cel data
;

mbikes_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	mbikes_start_end - mbikes_data
	byte	no_cont

	byte	240+right,28+left,252

	byte	0b10000000
	byte	0b01000000

	word	mbikes_data_a - mbikes_data
	word	mbikes_data_b - mbikes_data
	word	mbikes_data_c - mbikes_data
	word	mbikes_data_d - mbikes_data

mbikes_start_end:
	byte	0,0,1,1


mbikes_data_a:
	byte	0x04, 0x17, 0xfa, 0x14, 0x00, 0x00

	byte	run,0x80+2
	byte	2
	byte	2
	byte	10
	byte	10
	byte	run,11,42
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,0x80+2
	byte	42
	byte	run,6,170
	byte	171
	byte	175
	byte	175
	byte	run,3,190
	byte	175
	byte	175
	byte	171
	byte	run,6,170
	byte	42
	byte	run,7,170
	byte	250
	byte	254
	byte	190
	byte	run,3,239
	byte	190
	byte	254
	byte	250
	byte	run,7,170
	byte	run,0x80+1
	byte	128
	byte	160
	byte	160
	byte	168
	byte	168
	byte	run,11,170
	byte	168
	byte	168
	byte	160
	byte	160
	byte	128
	byte	run,0x80+1




mbikes_data_b:
	byte	0x04, 0x17, 0x03, 0x14, 0x00, 0x00

	byte	run,0x80+1
	byte	2
	byte	10
	byte	10
	byte	42
	byte	42
	byte	run,11,170
	byte	42
	byte	42
	byte	10
	byte	10
	byte	2
	byte	run,0x80+1
	byte	run,7,170
	byte	175
	byte	191
	byte	190
	byte	run,3,251
	byte	190
	byte	191
	byte	175
	byte	run,7,170
	byte	168
	byte	run,6,170
	byte	234
	byte	250
	byte	250
	byte	run,3,190
	byte	250
	byte	250
	byte	234
	byte	run,6,170
	byte	168
	byte	run,0x80+2
	byte	128
	byte	128
	byte	160
	byte	160
	byte	run,11,168
	byte	160
	byte	160
	byte	128
	byte	128
	byte	run,0x80+2




mbikes_data_c:
	byte	0x06, 0x26, 0xff, 0x28, 0x00, 0x00

	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,6,191
	byte	43
	byte	2
	byte	run,0x80+5
	byte	run,5,170
	byte	168
	byte	run,0x80+15
	byte	170
	byte	255
	byte	255
	byte	170
	byte	239
	byte	run,5,191
	byte	239
	byte	170
	byte	2
	byte	run,0x80+2
	byte	10
	byte	37
	byte	run,4,165
	byte	137
	byte	2
	byte	run,0x80+5
	byte	8
	byte	10
	byte	run,0x80+3
	byte	run,3,10
	byte	run,0x80+2
	byte	168
	byte	254
	byte	255
	byte	175
	byte	171
	byte	run,5,234
	byte	170
	byte	171
	byte	175
	byte	190
	byte	168
	byte	170
	byte	run,7,85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	160
	byte	8
	byte	8
	byte	44
	byte	170
	byte	174
	byte	174
	byte	10
	byte	run,0x80+1
	byte	run,0x80+2
	byte	128
	byte	128
	byte	run,5,224
	byte	run,6,184
	byte	174
	byte	run,3,110
	byte	106
	byte	90
	byte	run,5,86
	byte	90
	byte	170
	byte	run,3,11
	byte	42
	byte	46
	byte	46
	byte	174
	byte	254
	byte	248
	byte	160
	byte	run,0x80+11
	byte	run,3,2
	byte	run,3,11
	byte	47
	byte	46
	byte	174
	byte	190
	byte	184
	byte	184
	byte	248
	byte	226
	byte	233
	byte	229
	byte	run,5,149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+3
	byte	run,0x80+8
	byte	178
	byte	184
	byte	184
	byte	248
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+6
	byte	168
	byte	152
	byte	run,8,155
	byte	168
	byte	run,0x80+3




mbikes_data_d:
	byte	0x05, 0x18, 0xfa, 0x1b, 0x00, 0x00

	byte	run,0x80+15
	byte	2
	byte	9
	byte	9
	byte	2
	byte	run,0x80+5
	byte	run,0x80+16
	byte	128
	byte	96
	byte	90
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	run,0x80+2
	byte	42
	byte	3
	byte	run,0x80+3
	byte	3
	byte	42
	byte	run,4,46
	byte	47
	byte	run,3,11
	byte	2
	byte	170
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	run,0x80+2
	byte	10
	byte	175
	byte	255
	byte	250
	byte	226
	byte	128
	byte	run,0x80+5
	byte	run,3,128
	byte	138
	byte	170
	byte	234
	byte	run,4,170
	byte	42
	byte	10
	byte	175
	byte	255
	byte	250
	byte	160
	byte	run,0x80+1
	byte	128
	byte	40
	byte	2
	byte	run,0x80+7
	byte	run,7,170
	byte	128




