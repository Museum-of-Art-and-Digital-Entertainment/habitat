;---------------------------------------
;
;	animation cel data
;

dandy0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	dandy0_start_end - dandy0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	dandy0_data_a - dandy0_data
	word	dandy0_data_b - dandy0_data

dandy0_start_end:
	byte	0,0,1,1,0,0,1,1


dandy0_data_a:
	byte	0x04, 0x1c, 0x00, 0x06, 0x00, 0x00
	byte	run,0x80+4
	byte	5
	byte	21
	byte	4
	byte	17
	byte	6
	byte	17
	byte	70
	byte	5
	byte	21
	byte	69
	byte	17
	byte	22
	byte	85
	byte	21
	byte	82
	byte	69
	byte	4
	byte	5
	byte	17
	byte	4
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	31
	byte	103
	byte	149
	byte	run,13,85
	byte	149
	byte	run,3,85
	byte	20
	byte	69
	byte	1
	byte	run,0x80+1
	byte	40
	byte	184
	byte	run,3,248
	byte	106
	byte	175
	byte	127
	byte	191
	byte	255
	byte	255
	byte	127
	byte	255
	byte	94
	byte	86
	byte	95
	byte	run,6,85
	byte	86
	byte	100
	byte	69
	byte	21
	byte	20
	byte	4
	byte	run,0x80+5
	byte	128
	byte	224
	byte	240
	byte	224
	byte	240
	byte	248
	byte	252
	byte	224
	byte	160
	byte	248
	byte	176
	byte	225
	byte	116
	byte	84
	byte	81
	byte	148
	byte	81
	byte	20
	byte	81
	byte	80
	byte	4
	byte	64
	byte	run,0x80+1




dandy0_data_b:
	byte	0x05, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+4
	byte	1
	byte	run,0x80+1
	byte	4
	byte	1
	byte	21
	byte	5
	byte	21
	byte	1
	byte	17
	byte	4
	byte	21
	byte	1
	byte	21
	byte	17
	byte	5
	byte	21
	byte	1
	byte	5
	byte	5
	byte	1
	byte	run,0x80+1
	byte	1
	byte	run,0x80+2
	byte	3
	byte	run,3,2
	byte	18
	byte	86
	byte	90
	byte	95
	byte	111
	byte	111
	byte	191
	byte	127
	byte	127
	byte	126
	byte	107
	byte	158
	byte	95
	byte	87
	byte	101
	byte	21
	byte	101
	byte	21
	byte	86
	byte	81
	byte	68
	byte	21
	byte	68
	byte	17
	byte	255
	byte	run,3,254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	239
	byte	255
	byte	239
	byte	255
	byte	187
	byte	186
	byte	255
	byte	254
	byte	187
	byte	255
	byte	117
	byte	run,4,85
	byte	89
	byte	65
	byte	84
	byte	69
	byte	17
	byte	run,0x80+5
	byte	81
	byte	133
	byte	212
	byte	229
	byte	213
	byte	245
	byte	245
	byte	249
	byte	213
	byte	165
	byte	213
	byte	213
	byte	100
	byte	89
	byte	85
	byte	101
	byte	81
	byte	68
	byte	85
	byte	80
	byte	68
	byte	17
	byte	run,0x80+6
	byte	64
	byte	64
	byte	80
	byte	80
	byte	68
	byte	80
	byte	run,0x80+1
	byte	80
	byte	64
	byte	80
	byte	80
	byte	4
	byte	80
	byte	16
	byte	64
	byte	64
	byte	16
	byte	64
	byte	run,0x80+1
	byte	64
	byte	run,0x80+3




