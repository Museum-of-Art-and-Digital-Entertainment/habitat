;---------------------------------------
;
;	animation cel data
;

george_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	george_start_end - george_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	george_data_a - george_data
	word	george_data_b - george_data
	word	george_data_c - george_data

george_start_end:
	byte	0,0,1,1,0,0,2,2


george_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	run,3,2
	byte	run,3,10
	byte	run,8,42
	byte	run,3,10
	byte	2
	byte	2
	byte	run,0x80+4
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	171
	byte	run,4,170
	byte	171
	byte	run,4,175
	byte	run,12,170
	byte	10
	byte	40
	byte	184
	byte	250
	byte	234
	byte	233
	byte	169
	byte	170
	byte	170
	byte	174
	byte	175
	byte	175
	byte	run,4,191
	byte	170
	byte	175
	byte	175
	byte	run,3,171
	byte	run,8,170
	byte	run,0x80+2
	byte	128
	byte	96
	byte	run,3,160
	byte	224
	byte	160
	byte	160
	byte	232
	byte	248
	byte	184
	byte	run,4,160
	byte	run,4,224
	byte	run,5,168
	byte	160
	byte	160
	byte	128




george_data_b:
	byte	0x04, 0x1e, 0xfe, 0x07, 0x00, 0x00
	byte	run,0x80+13
	byte	run,10,2
	byte	run,0x80+7
	byte	3
	byte	run,3,2
	byte	10
	byte	9
	byte	41
	byte	42
	byte	42
	byte	174
	byte	175
	byte	191
	byte	191
	byte	250
	byte	239
	byte	239
	byte	174
	byte	170
	byte	190
	byte	175
	byte	175
	byte	174
	byte	run,4,170
	byte	42
	byte	42
	byte	10
	byte	run,0x80+1
	byte	255
	byte	254
	byte	254
	byte	170
	byte	102
	byte	169
	byte	169
	byte	170
	byte	254
	byte	170
	byte	171
	byte	239
	byte	255
	byte	186
	byte	239
	byte	239
	byte	238
	byte	170
	byte	186
	byte	255
	byte	255
	byte	239
	byte	171
	byte	run,6,170
	byte	168
	byte	run,0x80+4
	byte	128
	byte	128
	byte	run,3,160
	byte	232
	byte	232
	byte	248
	byte	248
	byte	190
	byte	238
	byte	238
	byte	234
	byte	170
	byte	250
	byte	250
	byte	run,3,234
	byte	run,4,168
	byte	160
	byte	160
	byte	run,0x80+1




george_data_c:
	byte	0x03, 0x13, 0xff, 0x00, 0x00, 0x00
	byte	10
	byte	10
	byte	run,3,42
	byte	run,33,170
	byte	run,0x80+4
	byte	160
	byte	run,14,168




