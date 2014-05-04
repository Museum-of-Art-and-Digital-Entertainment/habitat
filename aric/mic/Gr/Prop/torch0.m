;---------------------------------------
;
;	animation cel data
;

torch0_data::
	byte	out	+ 9
	byte	0b00000000
	byte	torch0_start_end - torch0_data
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b10000100
	byte	0b11000100
	byte	0b10100100
	byte	0b10010100
	byte	0b10001100
	byte	0b10100100
	byte	0b10001100
	byte	0b11000100
	byte	0b10100100
	byte	0b10001100

	word	torch0_data_a - torch0_data
	word	torch0_data_b - torch0_data
	word	torch0_data_c - torch0_data
	word	torch0_data_d - torch0_data
	word	torch0_data_e - torch0_data
	word	torch0_data_f - torch0_data

torch0_start_end:
	byte	0,0,cycle+1,9


torch0_data_a:
	byte	cel_box + 0x01, 0x12, 0x01, 0x03, 0x00, 0x00
	byte	0x98

torch0_data_b:
	byte	0x02, 0x11, 0x00, 0x21, 0x00, 0x00

	byte	run,3,3
	byte	15
	byte	run,3,12
	byte	15
	byte	run,0x80+2
	byte	15
	byte	12
	byte	12
	byte	3
	byte	run,0x80+2
	byte	3
	byte	run,4,255
	byte	63
	byte	run,4,252
	byte	204
	byte	204
	byte	60
	byte	run,4,192
	byte	run,0x80+1




torch0_data_c:
	byte	0x03, 0x07, 0x00, 0x17, 0x00, 0x00

	byte	run,0x80+1
	byte	3
	byte	run,0x80+5
	byte	15
	byte	207
	byte	15
	byte	63
	byte	63
	byte	252
	byte	243
	byte	240
	byte	run,0x80+6




torch0_data_d:
	byte	0x02, 0x13, 0x01, 0x23, 0x00, 0x00

	byte	15
	byte	207
	byte	255
	byte	63
	byte	63
	byte	12
	byte	3
	byte	run,0x80+2
	byte	3
	byte	run,0x80+1
	byte	12
	byte	12
	byte	run,3,15
	byte	3
	byte	run,0x80+2
	byte	252
	byte	255
	byte	12
	byte	204
	byte	252
	byte	51
	byte	60
	byte	204
	byte	192
	byte	240
	byte	run,0x80+6
	byte	192
	byte	240
	byte	48




torch0_data_e:
	byte	0x02, 0x0d, 0xff, 0x1d, 0x00, 0x00

	byte	run,0x80+7
	byte	3
	byte	15
	byte	3
	byte	15
	byte	run,0x80+2
	byte	15
	byte	15
	byte	51
	byte	run,4,63
	byte	243
	byte	252
	byte	run,0x80+2
	byte	192
	byte	48




torch0_data_f:
	byte	0x03, 0x11, 0x00, 0x14, 0x00, 0x00

	byte	run,0x80+1
	byte	run,3,2
	byte	10
	byte	9
	byte	37
	byte	37
	byte	42
	byte	run,3,47
	byte	170
	byte	160
	byte	98
	byte	128
	byte	run,0x80+1
	byte	152
	byte	run,3,86
	byte	170
	byte	85
	byte	101
	byte	85
	byte	154
	byte	152
	byte	155
	byte	155
	byte	154
	byte	152
	byte	86
	byte	152
	byte	32
	byte	run,0x80+4
	byte	128
	byte	128
	byte	96
	byte	96
	byte	160
	byte	run,3,224
	byte	168
	byte	40
	byte	38
	byte	8
	byte	run,0x80+1




