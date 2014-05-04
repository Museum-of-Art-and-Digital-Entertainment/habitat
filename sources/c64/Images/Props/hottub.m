;---------------------------------------
;
;	animation cel data
;

hottub_data::
	byte	both	+ 1
	byte	0b11111111
	byte	hottub_start_end - hottub_data
	byte	no_cont

	byte	8+right,64+left,255

	byte	0b11111111
	byte	0b11110000

	word	hottub_data_a - hottub_data
	word	hottub_data_b - hottub_data
	word	hottub_data_c - hottub_data
	word	hottub_data_d - hottub_data
	word	hottub_data_e - hottub_data
	word	hottub_data_f - hottub_data
	word	hottub_data_g - hottub_data
	word	hottub_data_h - hottub_data

hottub_start_end:
	byte	0,0,1,1,0,0


hottub_data_a:
	byte	0x04, 0x2d, 0xf8, 0x26, 0x00, 0x00

	byte	run,0x80+7
	byte	2
	byte	2
	byte	11
	byte	11
	byte	run,25,47
	byte	46
	byte	46
	byte	41
	byte	41
	byte	run,3,37
	byte	41
	byte	41
	byte	run,0x80+4
	byte	10
	byte	47
	byte	run,26,191
	byte	190
	byte	185
	byte	165
	byte	149
	byte	run,9,85
	byte	run,0x80+2
	byte	10
	byte	175
	byte	run,26,239
	byte	238
	byte	233
	byte	149
	byte	run,12,85
	byte	10
	byte	175
	byte	run,26,191
	byte	190
	byte	169
	byte	149
	byte	run,14,85




hottub_data_b:
	byte	0x07, 0x1e, 0xfc, 0x16, 0x00, 0x00

	byte	run,0x80+1
	byte	170
	byte	run,27,191
	byte	170
	byte	2
	byte	171
	byte	run,26,187
	byte	186
	byte	169
	byte	170
	byte	run,27,251
	byte	170
	byte	85
	byte	170
	byte	run,27,255
	byte	170
	byte	85
	byte	170
	byte	run,27,187
	byte	170
	byte	85
	byte	160
	byte	186
	byte	run,26,191
	byte	175
	byte	90
	byte	run,0x80+1
	byte	170
	byte	run,27,187
	byte	170




hottub_data_c:
	byte	0x04, 0x2d, 0x03, 0x26, 0x00, 0x00

	byte	168
	byte	run,27,254
	byte	174
	byte	90
	byte	run,15,85
	byte	run,0x80+1
	byte	128
	byte	232
	byte	250
	byte	run,26,251
	byte	171
	byte	90
	byte	run,13,85
	byte	run,0x80+3
	byte	128
	byte	232
	byte	250
	byte	run,26,251
	byte	171
	byte	91
	byte	86
	byte	run,10,85
	byte	run,0x80+6
	byte	128
	byte	160
	byte	160
	byte	184
	byte	184
	byte	run,25,190
	byte	110
	byte	110
	byte	90
	byte	90
	byte	run,4,86
	byte	90




hottub_data_d:
	byte	cel_box + 0x07, 0x10, 0xfc, 0x26, 0x00, 0x00
	byte	0x55

hottub_data_e:
	byte	cel_box + 0x08, 0x0a, 0xfc, 0x30, 0x00, 0x00
	byte	0x55

hottub_data_f:
	byte	0x04, 0x10, 0xf8, 0x36, 0x00, 0x00

	byte	run,4,46
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,0x80+8
	byte	85
	byte	85
	byte	149
	byte	149
	byte	229
	byte	233
	byte	238
	byte	239
	byte	175
	byte	47
	byte	11
	byte	2
	byte	run,0x80+4
	byte	run,7,85
	byte	165
	byte	186
	byte	run,3,187
	byte	43
	byte	2
	byte	run,0x80+2
	byte	run,9,85
	byte	165
	byte	250
	byte	251
	byte	251
	byte	187
	byte	43
	byte	2




hottub_data_g:
	byte	0x08, 0x07, 0xfc, 0x37, 0x00, 0x00

	byte	170
	byte	run,4,251
	byte	170
	byte	run,0x80+1
	byte	169
	byte	190
	byte	run,3,191
	byte	171
	byte	2
	byte	85
	byte	170
	byte	run,4,251
	byte	170
	byte	85
	byte	170
	byte	run,4,187
	byte	170
	byte	85
	byte	170
	byte	run,4,251
	byte	170
	byte	90
	byte	174
	byte	run,3,254
	byte	250
	byte	160
	byte	170
	byte	run,4,238
	byte	170
	byte	run,0x80+1
	byte	170
	byte	run,3,254
	byte	250
	byte	160
	byte	run,0x80+1




hottub_data_h:
	byte	0x03, 0x0e, 0x04, 0x34, 0x00, 0x00

	byte	run,7,85
	byte	86
	byte	107
	byte	187
	byte	251
	byte	251
	byte	250
	byte	160
	byte	run,4,85
	byte	86
	byte	90
	byte	110
	byte	run,3,190
	byte	184
	byte	160
	byte	run,0x80+2
	byte	106
	byte	110
	byte	174
	byte	174
	byte	232
	byte	232
	byte	224
	byte	224
	byte	128
	byte	run,0x80+5




