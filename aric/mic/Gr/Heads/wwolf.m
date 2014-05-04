;---------------------------------------
;
;	animation cel data
;

wwolf_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	wwolf_start_end - wwolf_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	wwolf_data_a - wwolf_data
	word	wwolf_data_b - wwolf_data
	word	wwolf_data_c - wwolf_data

wwolf_start_end:
	byte	0,0,1,1,0,0,2,2


wwolf_data_a:
	byte	0x05, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,0x80+2
	byte	2
	byte	run,0x80+4
	byte	2
	byte	run,0x80+14
	byte	32
	byte	40
	byte	42
	byte	138
	byte	run,3,170
	byte	42
	byte	170
	byte	170
	byte	42
	byte	run,3,170
	byte	42
	byte	170
	byte	42
	byte	10
	byte	2
	byte	10
	byte	run,0x80+4
	byte	47
	byte	42
	byte	46
	byte	run,6,170
	byte	171
	byte	171
	byte	175
	byte	175
	byte	190
	byte	186
	byte	run,8,170
	byte	42
	byte	136
	byte	32
	byte	40
	byte	run,6,170
	byte	run,3,171
	byte	239
	byte	255
	byte	255
	byte	175
	byte	174
	byte	169
	byte	170
	byte	175
	byte	191
	byte	190
	byte	run,3,170
	byte	168
	byte	170
	byte	32
	byte	136
	byte	128
	byte	168
	byte	170
	byte	168
	byte	170
	byte	170
	byte	234
	byte	250
	byte	190
	byte	232
	byte	238
	byte	254
	byte	234
	byte	248
	byte	168
	byte	160
	byte	224
	byte	224
	byte	160
	byte	run,3,128
	byte	run,0x80+5




wwolf_data_b:
	byte	0x05, 0x1b, 0xfe, 0x04, 0x00, 0x00
	byte	run,0x80+6
	byte	2
	byte	run,0x80+1
	byte	2
	byte	2
	byte	10
	byte	2
	byte	10
	byte	run,3,11
	byte	3
	byte	2
	byte	10
	byte	2
	byte	8
	byte	8
	byte	2
	byte	run,0x80+4
	byte	3
	byte	2
	byte	34
	byte	10
	byte	170
	byte	42
	byte	43
	byte	175
	byte	174
	byte	175
	byte	175
	byte	191
	byte	255
	byte	239
	byte	239
	byte	170
	byte	166
	byte	170
	byte	171
	byte	run,4,170
	byte	138
	byte	42
	byte	10
	byte	34
	byte	255
	byte	238
	byte	run,4,170
	byte	171
	byte	239
	byte	254
	byte	171
	byte	187
	byte	255
	byte	239
	byte	171
	byte	171
	byte	254
	byte	254
	byte	238
	byte	171
	byte	run,6,170
	byte	168
	byte	34
	byte	run,0x80+2
	byte	8
	byte	160
	byte	run,3,168
	byte	232
	byte	run,3,234
	byte	250
	byte	254
	byte	239
	byte	239
	byte	171
	byte	106
	byte	170
	byte	170
	byte	162
	byte	168
	byte	168
	byte	136
	byte	32
	byte	128
	byte	128
	byte	run,0x80+8
	byte	128
	byte	run,0x80+2
	byte	128
	byte	run,0x80+1
	byte	run,4,128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+9




wwolf_data_c:
	byte	cel_box + 0x03, 0x0e, 0xff, 0xfc, 0x00, 0x00
	byte	0xaa

