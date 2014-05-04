;---------------------------------------
;
;	animation cel data
;

coolcat0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	coolcat0_start_end - coolcat0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	coolcat0_data_a - coolcat0_data
	word	coolcat0_data_b - coolcat0_data
	word	coolcat0_data_c - coolcat0_data

coolcat0_start_end:
	byte	0,0,1,1,0,0,2,2


coolcat0_data_a:
	byte	0x04, 0x1b, 0x00, 0x05, 0x00, 0x00
	byte	run,0x80+6
	byte	11
	byte	63
	byte	47
	byte	63
	byte	47
	byte	63
	byte	43
	byte	2
	byte	run,0x80+14
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,7,255
	byte	175
	byte	run,9,191
	byte	47
	byte	47
	byte	11
	byte	2
	byte	40
	byte	184
	byte	250
	byte	251
	byte	255
	byte	255
	byte	250
	byte	229
	byte	229
	byte	149
	byte	154
	byte	175
	byte	171
	byte	run,5,255
	byte	170
	byte	run,3,191
	byte	170
	byte	run,4,128
	byte	run,0x80+2
	byte	168
	byte	248
	byte	254
	byte	170
	byte	run,3,88
	byte	170
	byte	252
	byte	254
	byte	248
	byte	248
	byte	run,4,232
	byte	168
	byte	224
	byte	224
	byte	128
	byte	run,0x80+5




coolcat0_data_b:
	byte	0x06, 0x1c, 0xfd, 0x05, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,0x80+21
	byte	2
	byte	11
	byte	191
	byte	run,3,254
	byte	255
	byte	191
	byte	42
	byte	run,0x80+4
	byte	2
	byte	3
	byte	2
	byte	3
	byte	run,5,2
	byte	3
	byte	run,3,2
	byte	42
	byte	191
	byte	250
	byte	229
	byte	149
	byte	85
	byte	106
	byte	111
	byte	191
	byte	run,5,170
	byte	169
	byte	170
	byte	run,3,255
	byte	250
	byte	248
	byte	248
	byte	224
	byte	128
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	170
	byte	run,3,85
	byte	170
	byte	255
	byte	239
	byte	run,6,186
	byte	170
	byte	run,3,255
	byte	170
	byte	run,0x80+8
	byte	160
	byte	248
	byte	190
	byte	111
	byte	91
	byte	86
	byte	166
	byte	230
	byte	251
	byte	171
	byte	170
	byte	run,3,168
	byte	152
	byte	170
	byte	255
	byte	254
	byte	255
	byte	run,3,190
	byte	46
	byte	10
	byte	run,0x80+7
	byte	128
	byte	248
	byte	240
	byte	254
	byte	252
	byte	254
	byte	248
	byte	160
	byte	run,0x80+13




coolcat0_data_c:
	byte	0x04, 0x0e, 0xfe, 0xfd, 0x00, 0x00
	byte	run,0x80+3
	byte	run,3,3
	byte	run,0x80+8
	byte	run,28,255
	byte	run,3,252
	byte	run,3,255
	byte	run,8,252




