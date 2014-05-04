;---------------------------------------
;
;	animation cel data
;

coke1_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11100000

	word	coke1_data_a - coke1_data
	word	coke1_data_b - coke1_data
	word	coke1_data_c - coke1_data


coke1_data_a:
	byte	cel_box + both_bord + 0x06, 0x2a, 0xfe, 0xff, 0x00, 0x00
	byte	0q1111

coke1_data_b:
	byte	0x06, 0x13, 0xfe, 0x12, 0x00, 0x00

	byte	191
	byte	170
	byte	run,3,191
	byte	190
	byte	run,5,187
	byte	190
	byte	run,3,47
	byte	11
	byte	2
	byte	run,0x80+2
	byte	255
	byte	170
	byte	run,3,255
	byte	187
	byte	251
	byte	251
	byte	250
	byte	251
	byte	251
	byte	187
	byte	run,5,255
	byte	171
	byte	2
	byte	255
	byte	170
	byte	run,3,255
	byte	186
	byte	run,5,187
	byte	186
	byte	run,6,255
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	run,3,187
	byte	186
	byte	run,3,187
	byte	run,6,255
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	186
	byte	187
	byte	187
	byte	250
	byte	187
	byte	187
	byte	186
	byte	run,5,255
	byte	234
	byte	128
	byte	246
	byte	170
	byte	run,3,254
	byte	190
	byte	run,5,254
	byte	190
	byte	run,3,248
	byte	224
	byte	128
	byte	run,0x80+2




coke1_data_c:
	byte	0x06, 0x1e, 0xfe, 0xfc, 0x00, 0x00

	byte	10
	byte	run,22,9
	byte	10
	byte	run,0x80+2
	byte	10
	byte	11
	byte	11
	byte	10
	byte	170
	byte	run,6,85
	byte	255
	byte	234
	byte	234
	byte	255
	byte	170
	byte	170
	byte	187
	byte	191
	byte	170
	byte	170
	byte	154
	byte	155
	byte	154
	byte	170
	byte	170
	byte	85
	byte	170
	byte	run,0x80+2
	byte	138
	byte	139
	byte	139
	byte	138
	byte	170
	byte	run,6,85
	byte	run,4,213
	byte	run,11,149
	byte	85
	byte	170
	byte	run,0x80+2
	byte	138
	byte	139
	byte	139
	byte	138
	byte	170
	byte	run,22,85
	byte	170
	byte	run,0x80+2
	byte	138
	byte	139
	byte	139
	byte	138
	byte	170
	byte	149
	byte	149
	byte	170
	byte	174
	byte	170
	byte	153
	byte	149
	byte	170
	byte	174
	byte	166
	byte	153
	byte	149
	byte	170
	byte	174
	byte	170
	byte	153
	byte	149
	byte	170
	byte	174
	byte	170
	byte	153
	byte	149
	byte	170
	byte	run,0x80+2
	byte	138
	byte	139
	byte	139
	byte	138
	byte	run,24,128
	byte	run,0x80+2
	byte	run,4,128




