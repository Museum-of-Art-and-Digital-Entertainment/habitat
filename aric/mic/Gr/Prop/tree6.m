;---------------------------------------
;
;	animation cel data
;

tree6_data::
	byte	both	+ 4
	byte	0b11110000
	byte	tree6_start_end - tree6_data
	byte	no_cont

	byte	244+right,32+left,255

	byte	0b11110000
	byte	0b11000000
	byte	0b00100000
	byte	0b00110000
	byte	0b01000000

	word	tree6_data_a - tree6_data
	word	tree6_data_b - tree6_data
	word	tree6_data_c - tree6_data
	word	tree6_data_d - tree6_data

tree6_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


tree6_data_a:
	byte	0x04, 0x02, 0xfd, 0xf7, 0x00, 0x00
	byte	170
	byte	2
	byte	run,3,170
	byte	165
	byte	168
	byte	214




tree6_data_b:
	byte	0x02, 0x3a, 0xff, 0x31, 0x00, 0x00
	byte	run,25,149
	byte	85
	byte	85
	byte	run,28,149
	byte	37
	byte	37
	byte	10
	byte	126
	byte	222
	byte	126
	byte	222
	byte	94
	byte	254
	byte	126
	byte	118
	byte	222
	byte	126
	byte	94
	byte	222
	byte	94
	byte	126
	byte	222
	byte	94
	byte	126
	byte	222
	byte	94
	byte	126
	byte	94
	byte	126
	byte	94
	byte	94
	byte	85
	byte	117
	byte	85
	byte	85
	byte	93
	byte	93
	byte	86
	byte	94
	byte	126
	byte	94
	byte	126
	byte	94
	byte	94
	byte	126
	byte	222
	byte	94
	byte	126
	byte	94
	byte	126
	byte	94
	byte	94
	byte	126
	byte	214
	byte	94
	byte	126
	byte	94
	byte	126
	byte	94
	byte	94
	byte	86
	byte	118
	byte	88
	byte	96
	byte	128




tree6_data_c:
	byte	0x02, 0x1c, 0xfd, 0x26, 0x00, 0x00
	byte	run,0x80+3
	byte	run,3,2
	byte	run,5,9
	byte	run,5,37
	byte	39
	byte	37
	byte	37
	byte	39
	byte	run,5,37
	byte	9
	byte	9
	byte	2
	byte	10
	byte	37
	byte	149
	byte	run,4,85
	byte	95
	byte	85
	byte	92
	byte	116
	byte	90
	byte	88
	byte	120
	byte	88
	byte	216
	byte	120
	byte	120
	byte	248
	byte	120
	byte	120
	byte	248
	byte	120
	byte	248
	byte	120
	byte	120
	byte	224
	byte	128




tree6_data_d:
	byte	0x02, 0x19, 0x01, 0x25, 0x00, 0x00
	byte	128
	byte	224
	byte	224
	byte	120
	byte	120
	byte	94
	byte	94
	byte	87
	byte	87
	byte	run,3,85
	byte	149
	byte	run,6,37
	byte	39
	byte	37
	byte	37
	byte	39
	byte	9
	byte	2
	byte	run,0x80+7
	byte	128
	byte	128
	byte	224
	byte	96
	byte	run,4,224
	byte	96
	byte	run,3,224
	byte	96
	byte	224
	byte	224
	byte	96
	byte	128
	byte	run,0x80+1




