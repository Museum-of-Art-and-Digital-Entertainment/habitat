;---------------------------------------
;
;	animation cel data
;

window3_data::
	byte	both	+ 2
	byte	0b11000000
	byte	window3_start_end - window3_data
	byte	no_cont

	byte	240+right,32+left,255

	byte	0b11000000
	byte	0b10000000
	byte	0b01000000

	word	window3_data_a - window3_data
	word	window3_data_b - window3_data

window3_start_end:
	byte	0,0,1,1,2,2


window3_data_a:
	byte	0x06, 0x29, 0xfe, 0x06, 0x00, 0x00
	byte	170
	byte	191
	byte	170
	byte	run,3,191
	byte	170
	byte	run,13,185
	byte	186
	byte	191
	byte	191
	byte	186
	byte	run,13,185
	byte	186
	byte	191
	byte	191
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	run,13,85
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,13,85
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	run,13,110
	byte	174
	byte	255
	byte	255
	byte	174
	byte	run,13,110
	byte	174
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	run,13,85
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,13,85
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	run,13,91
	byte	171
	byte	255
	byte	255
	byte	171
	byte	run,13,91
	byte	171
	byte	255
	byte	255
	byte	170
	byte	run,41,128




window3_data_b:
	byte	0x06, 0x16, 0xfe, 0x1f, 0x00, 0x00
	byte	170
	byte	191
	byte	191
	byte	186
	byte	run,6,185
	byte	190
	byte	190
	byte	46
	byte	47
	byte	47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+4
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,9,85
	byte	149
	byte	149
	byte	229
	byte	250
	byte	255
	byte	191
	byte	43
	byte	2
	byte	run,0x80+1
	byte	170
	byte	255
	byte	255
	byte	174
	byte	run,13,110
	byte	174
	byte	255
	byte	255
	byte	191
	byte	42
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,11,85
	byte	86
	byte	107
	byte	191
	byte	255
	byte	250
	byte	160
	byte	run,0x80+1
	byte	170
	byte	255
	byte	255
	byte	171
	byte	run,6,91
	byte	111
	byte	111
	byte	110
	byte	190
	byte	190
	byte	248
	byte	248
	byte	224
	byte	128
	byte	run,0x80+3
	byte	run,12,128
	byte	run,0x80+10




