;---------------------------------------
;
;	animation cel data
;

woman1_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	woman1_start_end - woman1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	woman1_data_a - woman1_data
	word	woman1_data_b - woman1_data
	word	woman1_data_c - woman1_data

woman1_start_end:
	byte	0,0,1,1,0,0,2,2


woman1_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+2
	byte	run,19,2
	byte	run,0x80+5
	byte	175
	byte	90
	byte	run,3,86
	byte	run,14,85
	byte	run,3,149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	234
	byte	171
	byte	run,7,191
	byte	run,4,111
	byte	91
	byte	90
	byte	86
	byte	run,4,85
	byte	170
	byte	run,0x80+4
	byte	160
	byte	248
	byte	248
	byte	224
	byte	248
	byte	248
	byte	254
	byte	248
	byte	232
	byte	160
	byte	168
	byte	176
	byte	224
	byte	248
	byte	224
	byte	168
	byte	88
	byte	88
	byte	96
	byte	96
	byte	128




woman1_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	run,17,1
	byte	run,0x80+5
	byte	3
	byte	21
	byte	run,3,85
	byte	87
	byte	87
	byte	95
	byte	run,5,127
	byte	126
	byte	122
	byte	123
	byte	89
	byte	87
	byte	run,4,85
	byte	21
	byte	5
	byte	1
	byte	255
	byte	185
	byte	185
	byte	169
	byte	253
	byte	255
	byte	239
	byte	239
	byte	255
	byte	239
	byte	run,3,255
	byte	186
	byte	186
	byte	187
	byte	253
	byte	255
	byte	253
	byte	run,6,85
	byte	run,0x80+1
	byte	80
	byte	84
	byte	run,4,85
	byte	213
	byte	run,6,245
	byte	181
	byte	181
	byte	149
	byte	run,3,85
	byte	84
	byte	84
	byte	80
	byte	64
	byte	run,0x80+1




woman1_data_c:
	byte	cel_box + 0x03, 0x11, 0xff, 0xfc, 0x00, 0x00
	byte	0x55

