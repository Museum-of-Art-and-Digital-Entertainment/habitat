;---------------------------------------
;
;	animation cel data
;

pawn_data::
	byte	at_side	+ 1
	byte	0b10010000
	byte	pawn_start_end - pawn_data
	byte	no_cont

	byte	28+left,28+left,1

	byte	0b11010000
	byte	0b10110000

	word	pawn_data_a - pawn_data
	word	pawn_data_b - pawn_data
	word	pawn_data_c - pawn_data
	word	pawn_data_d - pawn_data

pawn_start_end:
	byte	0,0,cycle+0,1


pawn_data_a:
	byte	0x08, 0x0f, 0x00, 0xfa, 0x00, 0x00
	byte	2
	byte	run,11,9
	byte	10
	byte	2
	byte	10
	byte	170
	byte	85
	byte	165
	byte	229
	byte	85
	byte	85
	byte	106
	byte	run,3,170
	byte	106
	byte	85
	byte	170
	byte	2
	byte	130
	byte	170
	byte	85
	byte	86
	byte	87
	byte	85
	byte	85
	byte	run,5,170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	149
	byte	149
	byte	85
	byte	85
	byte	run,5,170
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	90
	byte	94
	byte	85
	byte	86
	byte	150
	byte	166
	byte	165
	byte	165
	byte	149
	byte	85
	byte	170
	byte	128
	byte	130
	byte	128
	byte	106
	byte	106
	byte	110
	byte	190
	byte	254
	byte	251
	byte	175
	byte	111
	byte	106
	byte	96
	byte	96
	byte	160
	byte	128
	byte	160
	byte	run,0x80+1
	byte	170
	byte	run,3,191
	byte	255
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+6
	byte	168
	byte	254
	byte	248
	byte	224
	byte	128
	byte	run,0x80+9




pawn_data_b:
	byte	cel_box + 0x02, 0x01, 0x02, 0xf4, 0x00, 0x00
	byte	0xaa

pawn_data_c:
	byte	0x04, 0x01, 0x01, 0xf4, 0x00, 0xff
	byte	63
	byte	255
	byte	255
	byte	192




pawn_data_d:
	byte	0x06, 0x11, 0x00, 0x0b, 0x00, 0x00
	byte	3
	byte	10
	byte	2
	byte	run,0x80+4
	byte	2
	byte	2
	byte	11
	byte	11
	byte	42
	byte	170
	byte	191
	byte	191
	byte	174
	byte	42
	byte	2
	byte	138
	byte	11
	byte	42
	byte	47
	byte	191
	byte	191
	byte	255
	byte	235
	byte	251
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	85
	byte	170
	byte	255
	byte	170
	byte	run,4,255
	byte	174
	byte	239
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	85
	byte	170
	byte	255
	byte	170
	byte	run,4,255
	byte	186
	byte	190
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	128
	byte	162
	byte	224
	byte	168
	byte	248
	byte	254
	byte	254
	byte	255
	byte	235
	byte	251
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	192
	byte	160
	byte	128
	byte	run,0x80+4
	byte	128
	byte	128
	byte	224
	byte	224
	byte	168
	byte	170
	byte	254
	byte	254
	byte	186
	byte	168




