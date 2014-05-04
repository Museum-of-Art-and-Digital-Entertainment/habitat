;---------------------------------------
;
;	animation cel data
;

resident_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	resident_start_end - resident_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10011000
	byte	0b01010000
	byte	0b01110000
	byte	0b00010000

	word	resident_data_a - resident_data
	word	resident_data_b - resident_data
	word	resident_data_c - resident_data
	word	resident_data_d - resident_data
	word	resident_data_e - resident_data

resident_start_end:
	byte	0,0,1,1,3,3,2,2


resident_data_a:
	byte	0x05, 0x19, 0x00, 0x03, 0x00, 0x0d
	byte	run,0x80+4
	byte	2
	byte	11
	byte	11
	byte	run,3,47
	byte	run,8,191
	byte	run,3,47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+2
	byte	47
	byte	42
	byte	191
	byte	run,5,255
	byte	253
	byte	247
	byte	223
	byte	255
	byte	253
	byte	run,3,255
	byte	253
	byte	223
	byte	247
	byte	253
	byte	run,3,255
	byte	191
	byte	40
	byte	184
	byte	250
	byte	255
	byte	255
	byte	247
	byte	253
	byte	247
	byte	255
	byte	125
	byte	223
	byte	127
	byte	87
	byte	253
	byte	255
	byte	255
	byte	127
	byte	255
	byte	127
	byte	221
	byte	119
	byte	223
	byte	247
	byte	253
	byte	255
	byte	run,0x80+3
	byte	128
	byte	224
	byte	248
	byte	248
	byte	126
	byte	126
	byte	254
	byte	117
	byte	213
	byte	214
	byte	214
	byte	86
	byte	214
	byte	214
	byte	213
	byte	118
	byte	254
	byte	94
	byte	120
	byte	248
	byte	224
	byte	128
	byte	run,0x80+10
	byte	run,8,128
	byte	run,0x80+7




resident_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0xfe, 0x0d
	byte	run,0x80+6
	byte	2
	byte	2
	byte	11
	byte	9
	byte	11
	byte	47
	byte	47
	byte	45
	byte	47
	byte	45
	byte	39
	byte	47
	byte	47
	byte	9
	byte	11
	byte	11
	byte	2
	byte	2
	byte	run,0x80+2
	byte	3
	byte	2
	byte	2
	byte	10
	byte	47
	byte	189
	byte	215
	byte	247
	byte	223
	byte	119
	byte	255
	byte	253
	byte	245
	byte	245
	byte	117
	byte	213
	byte	245
	byte	245
	byte	253
	byte	223
	byte	119
	byte	119
	byte	253
	byte	247
	byte	189
	byte	47
	byte	255
	byte	254
	byte	170
	byte	254
	byte	223
	byte	221
	byte	247
	byte	253
	byte	247
	byte	255
	byte	87
	byte	85
	byte	101
	byte	run,3,169
	byte	233
	byte	101
	byte	85
	byte	87
	byte	255
	byte	247
	byte	223
	byte	221
	byte	247
	byte	253
	byte	run,0x80+3
	byte	128
	byte	224
	byte	248
	byte	254
	byte	254
	byte	247
	byte	247
	byte	223
	byte	255
	byte	127
	byte	127
	byte	119
	byte	93
	byte	127
	byte	127
	byte	255
	byte	223
	byte	247
	byte	253
	byte	222
	byte	126
	byte	248
	byte	224
	byte	run,0x80+8
	byte	run,3,128
	byte	run,3,224
	byte	96
	byte	224
	byte	96
	byte	224
	byte	224
	byte	run,3,128
	byte	run,0x80+4




resident_data_c:
	byte	0x04, 0x16, 0x00, 0xf6, 0x00, 0x00
	byte	run,0x80+4
	byte	run,14,3
	byte	run,0x80+4
	byte	run,4,15
	byte	run,14,255
	byte	run,4,15
	byte	run,22,255
	byte	run,0x80+4
	byte	run,14,255
	byte	240
	byte	run,3,192




resident_data_d:
	byte	0x04, 0x10, 0x00, 0x06, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+14
	byte	170
	byte	170
	byte	5
	byte	5
	byte	run,12,10
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,14,170
	byte	64
	byte	64
	byte	run,12,128




resident_data_e:
	byte	0x02, 0x10, 0x00, 0x06, 0x00, 0x01
	byte	8
	byte	8
	byte	run,0x80+16
	byte	16
	byte	16
	byte	run,12,32




