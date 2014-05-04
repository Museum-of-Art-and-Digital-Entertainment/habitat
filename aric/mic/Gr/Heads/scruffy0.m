;---------------------------------------
;
;	animation cel data
;

scruffy0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	scruffy0_start_end - scruffy0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	scruffy0_data_a - scruffy0_data
	word	scruffy0_data_b - scruffy0_data

scruffy0_start_end:
	byte	0,0,1,1,0,0,1,1


scruffy0_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	run,5,1
	byte	5
	byte	1
	byte	5
	byte	17
	byte	run,3,5
	byte	17
	byte	5
	byte	20
	byte	1
	byte	run,0x80+4
	byte	47
	byte	42
	byte	31
	byte	31
	byte	93
	byte	run,4,85
	byte	run,3,87
	byte	run,9,85
	byte	21
	byte	85
	byte	20
	byte	65
	byte	20
	byte	180
	byte	245
	byte	245
	byte	221
	byte	213
	byte	119
	byte	94
	byte	87
	byte	223
	byte	94
	byte	255
	byte	255
	byte	221
	byte	87
	byte	93
	byte	93
	byte	87
	byte	87
	byte	run,4,85
	byte	84
	byte	1
	byte	run,0x80+3
	byte	16
	byte	68
	byte	208
	byte	84
	byte	81
	byte	212
	byte	208
	byte	80
	byte	212
	byte	244
	byte	116
	byte	84
	byte	208
	byte	208
	byte	80
	byte	208
	byte	208
	byte	64
	byte	80
	byte	84
	byte	20
	byte	65
	byte	16
	byte	run,0x80+1




scruffy0_data_b:
	byte	0x04, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+5
	byte	1
	byte	run,0x80+1
	byte	1
	byte	run,0x80+1
	byte	run,9,1
	byte	4
	byte	run,0x80+7
	byte	3
	byte	2
	byte	17
	byte	69
	byte	85
	byte	21
	byte	95
	byte	87
	byte	95
	byte	95
	byte	126
	byte	127
	byte	127
	byte	122
	byte	91
	byte	90
	byte	94
	byte	87
	byte	run,3,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+1
	byte	1
	byte	255
	byte	254
	byte	85
	byte	85
	byte	221
	byte	247
	byte	95
	byte	125
	byte	255
	byte	171
	byte	254
	byte	239
	byte	187
	byte	186
	byte	255
	byte	254
	byte	186
	byte	255
	byte	245
	byte	run,5,85
	byte	64
	byte	16
	byte	run,0x80+2
	byte	16
	byte	68
	byte	80
	byte	84
	byte	81
	byte	212
	byte	208
	byte	212
	byte	run,3,245
	byte	181
	byte	148
	byte	149
	byte	213
	byte	85
	byte	84
	byte	85
	byte	80
	byte	84
	byte	64
	byte	16
	byte	run,0x80+2




