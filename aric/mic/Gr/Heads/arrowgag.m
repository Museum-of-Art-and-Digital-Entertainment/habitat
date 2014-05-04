;---------------------------------------
;
;	animation cel data
;

arrowgag_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	arrowgag_start_end - arrowgag_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	arrowgag_data_a - arrowgag_data
	word	arrowgag_data_b - arrowgag_data

arrowgag_start_end:
	byte	0,0,1,1,0,0,1,1


arrowgag_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+6
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	32
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	255
	byte	255
	byte	run,3,239
	byte	187
	byte	175
	byte	107
	byte	107
	byte	91
	byte	86
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+3




arrowgag_data_b:
	byte	0x06, 0x1a, 0xfd, 0x03, 0x00, 0x00
	byte	run,0x80+12
	byte	10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	10
	byte	run,0x80+21
	byte	160
	byte	88
	byte	170
	byte	88
	byte	160
	byte	run,0x80+9
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,4,175
	byte	171
	byte	42
	byte	37
	byte	41
	byte	10
	byte	2
	byte	run,0x80+1
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	170
	byte	run,3,85
	byte	170
	byte	128
	byte	32
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	234
	byte	232
	byte	232
	byte	168
	byte	168
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+15
	byte	160
	byte	40
	byte	190
	byte	40
	byte	160
	byte	run,0x80+9




