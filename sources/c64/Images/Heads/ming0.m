;---------------------------------------
;
;	animation cel data
;

ming0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	ming0_start_end - ming0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10100000
	byte	0b01010000
	byte	0b01011000

	word	ming0_data_a - ming0_data
	word	ming0_data_b - ming0_data
	word	ming0_data_c - ming0_data
	word	ming0_data_d - ming0_data
	word	ming0_data_e - ming0_data

ming0_start_end:
	byte	0,0,1,1,0,0,2,2


ming0_data_a:
	byte	0x06, 0x0a, 0xfe, 0xf4, 0x00, 0x00
	byte	run,0x80+6
	byte	5
	byte	1
	byte	run,0x80+7
	byte	5
	byte	run,3,85
	byte	21
	byte	run,0x80+3
	byte	1
	byte	5
	byte	run,5,85
	byte	run,0x80+1
	byte	31
	byte	run,4,85
	byte	87
	byte	95
	byte	123
	byte	239
	byte	20
	byte	84
	byte	86
	byte	90
	byte	127
	byte	239
	byte	238
	byte	239
	byte	250
	byte	254
	byte	32
	byte	run,4,160
	byte	224
	byte	160
	byte	224
	byte	160
	byte	160




ming0_data_b:
	byte	0x07, 0x0b, 0xfd, 0xf4, 0x00, 0x00
	byte	run,0x80+6
	byte	85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+4
	byte	1
	byte	5
	byte	run,5,85
	byte	21
	byte	11
	byte	27
	byte	91
	byte	122
	byte	123
	byte	123
	byte	run,3,235
	byte	190
	byte	191
	byte	255
	byte	239
	byte	171
	byte	170
	byte	171
	byte	171
	byte	255
	byte	171
	byte	255
	byte	170
	byte	171
	byte	128
	byte	144
	byte	148
	byte	run,3,181
	byte	run,3,173
	byte	186
	byte	250
	byte	run,0x80+4
	byte	64
	byte	84
	byte	run,4,85
	byte	80
	byte	run,0x80+6
	byte	84
	byte	80
	byte	64
	byte	run,0x80+2




ming0_data_c:
	byte	0x04, 0x0e, 0x00, 0x02, 0x00, 0x00
	byte	run,10,2
	byte	run,0x80+4
	byte	run,3,191
	byte	190
	byte	171
	byte	run,5,255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	run,3,255
	byte	254
	byte	254
	byte	239
	byte	234
	byte	234
	byte	235
	byte	239
	byte	239
	byte	255
	byte	254
	byte	168
	byte	168
	byte	run,4,248
	byte	160
	byte	160
	byte	224
	byte	224
	byte	run,3,128
	byte	run,0x80+2




ming0_data_d:
	byte	0x04, 0x0e, 0xfe, 0x02, 0x00, 0x00
	byte	run,4,2
	byte	run,0x80+10
	byte	191
	byte	255
	byte	255
	byte	190
	byte	174
	byte	175
	byte	170
	byte	186
	byte	187
	byte	187
	byte	47
	byte	47
	byte	11
	byte	2
	byte	171
	byte	255
	byte	255
	byte	254
	byte	238
	byte	239
	byte	186
	byte	254
	byte	run,5,255
	byte	170
	byte	250
	byte	254
	byte	254
	byte	250
	byte	232
	byte	232
	byte	168
	byte	run,3,184
	byte	224
	byte	224
	byte	128
	byte	run,0x80+1




ming0_data_e:
	byte	0x03, 0x15, 0xff, 0xfe, 0x00, 0x00
	byte	5
	byte	21
	byte	run,10,85
	byte	run,9,63
	byte	run,12,85
	byte	run,9,255
	byte	80
	byte	84
	byte	run,10,85
	byte	run,9,240




