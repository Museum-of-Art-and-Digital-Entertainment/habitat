;---------------------------------------
;
;	animation cel data
;

sexo_data::
	byte	out	+ 1
	byte	0b00000000
	byte	sexo_start_end - sexo_data
	byte	no_cont

	byte	240+right,240+right,1

	byte	0b11101100
	byte	0b11111100

	word	sexo_data_a - sexo_data
	word	sexo_data_b - sexo_data
	word	sexo_data_c - sexo_data
	word	sexo_data_d - sexo_data
	word	sexo_data_e - sexo_data
	word	sexo_data_f - sexo_data

sexo_start_end:
	byte	0,0,cycle+0,1


sexo_data_a:
	byte	cel_box + 0x01, 0x01, 0xfe, 0xf7, 0x00, 0x00
	byte	pat_glass

sexo_data_b:
	byte	0x05, 0x18, 0x00, 0x0d, 0x00, 0x00
	byte	42
	byte	47
	byte	10
	byte	2
	byte	run,0x80+20
	byte	170
	byte	255
	byte	170
	byte	191
	byte	47
	byte	11
	byte	11
	byte	10
	byte	42
	byte	42
	byte	41
	byte	10
	byte	42
	byte	42
	byte	41
	byte	10
	byte	42
	byte	42
	byte	41
	byte	10
	byte	42
	byte	42
	byte	37
	byte	10
	byte	170
	byte	255
	byte	170
	byte	175
	byte	255
	byte	254
	byte	254
	byte	run,3,170
	byte	86
	byte	run,3,170
	byte	86
	byte	run,3,170
	byte	86
	byte	run,3,170
	byte	85
	byte	170
	byte	170
	byte	255
	byte	170
	byte	232
	byte	128
	byte	run,0x80+3
	byte	run,3,128
	byte	run,0x80+1
	byte	run,3,128
	byte	run,0x80+1
	byte	run,3,128
	byte	run,0x80+1
	byte	run,3,128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,0x80+22




sexo_data_c:
	byte	0x04, 0x1b, 0xfb, 0x33, 0x00, 0x00
	byte	run,0x80+14
	byte	run,8,2
	byte	run,0x80+8
	byte	2
	byte	run,0x80+9
	byte	168
	byte	2
	byte	run,0x80+7
	byte	run,3,128
	byte	32
	byte	10
	byte	8
	byte	10
	byte	170
	byte	234
	byte	168
	byte	234
	byte	170
	byte	58
	byte	42
	byte	14
	byte	10
	byte	14
	byte	42
	byte	59
	byte	42
	byte	166
	byte	38
	byte	run,3,150
	byte	40
	byte	run,3,8
	byte	32
	byte	128
	byte	run,0x80+2
	byte	160
	byte	160
	byte	168
	byte	42
	byte	10
	byte	10
	byte	run,7,128
	byte	run,0x80+13




sexo_data_d:
	byte	0x03, 0x03, 0x01, 0x10, 0x00, 0x03
	byte	42
	byte	42
	byte	37
	byte	170
	byte	170
	byte	85
	byte	run,3,128




sexo_data_e:
	byte	0x06, 0x1c, 0xff, 0x29, 0x00, 0x00
	byte	run,0x80+6
	byte	8
	byte	170
	byte	174
	byte	46
	byte	10
	byte	10
	byte	43
	byte	run,4,187
	byte	43
	byte	10
	byte	8
	byte	run,0x80+13
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	149
	byte	229
	byte	229
	byte	165
	byte	229
	byte	229
	byte	165
	byte	229
	byte	229
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+3
	byte	10
	byte	10
	byte	2
	byte	41
	byte	149
	byte	run,15,85
	byte	213
	byte	245
	byte	245
	byte	125
	byte	95
	byte	149
	byte	41
	byte	2
	byte	170
	byte	170
	byte	168
	byte	86
	byte	run,20,85
	byte	93
	byte	213
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	96
	byte	88
	byte	86
	byte	86
	byte	run,14,85
	byte	86
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+9
	byte	128
	byte	128
	byte	run,10,96
	byte	128
	byte	128
	byte	run,0x80+6




sexo_data_f:
	byte	0x03, 0x06, 0xfc, 0x18, 0x00, 0x00
	byte	2
	byte	10
	byte	10
	byte	11
	byte	10
	byte	2
	byte	128
	byte	160
	byte	170
	byte	170
	byte	160
	byte	128
	byte	run,0x80+2
	byte	170
	byte	170
	byte	run,0x80+2




