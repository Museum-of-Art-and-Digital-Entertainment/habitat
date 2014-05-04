;---------------------------------------
;
;	animation cel data
;

pipe0_data::
	byte	swing	+ 17
	byte	0b11111111
	byte	pipe0_start_end - pipe0_data
	byte	no_cont

	byte	0+right,0+left,0

	byte	0b11111111
	byte	0b10000000
	byte	0b11000000
	byte	0b11111000
	byte	0b11111100
	byte	0b00111100
	byte	0b00001100
	byte	0b01000000
	byte	0b00011000
	byte	0b00111000
	byte	0b00111100
	byte	0b00001000
	byte	0b10000010
	byte	0b00000001
	byte	0b00011100
	byte	0b00000010
	byte	0b00010000
	byte	0b00110000

	word	pipe0_data_a - pipe0_data
	word	pipe0_data_b - pipe0_data
	word	pipe0_data_c - pipe0_data
	word	pipe0_data_d - pipe0_data
	word	pipe0_data_e - pipe0_data
	word	pipe0_data_f - pipe0_data
	word	pipe0_data_g - pipe0_data
	word	pipe0_data_h - pipe0_data

pipe0_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17


pipe0_data_a:
	byte	0x0c, 0x06, 0xfa, 0x02, 0x00, 0x00

	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	170
	byte	run,3,85
	byte	255
	byte	170




pipe0_data_b:
	byte	0x01, 0x08, 0xfb, 0x03, 0x00, 0x00

	byte	170
	byte	run,5,150
	byte	190
	byte	170




pipe0_data_c:
	byte	0x01, 0x07, 0xf9, 0x03, 0x00, 0x00

	byte	2
	byte	10
	byte	41
	byte	165
	byte	149
	byte	149
	byte	150




pipe0_data_d:
	byte	0x01, 0x06, 0xf9, 0x08, 0x00, 0x00

	byte	run,5,150
	byte	170




pipe0_data_e:
	byte	0x03, 0x06, 0xf8, 0x0e, 0x00, 0x00

	byte	run,6,2
	byte	170
	byte	run,3,85
	byte	255
	byte	170
	byte	run,6,128




pipe0_data_f:
	byte	cel_box + 0x01, 0x39, 0xf9, 0x47, 0x00, 0x00
	byte	0x9e

pipe0_data_g:
	byte	0x01, 0x07, 0x06, 0x02, 0x00, 0x00

	byte	150
	byte	86
	byte	86
	byte	88
	byte	232
	byte	160
	byte	128




pipe0_data_h:
	byte	0x03, 0x11, 0xfc, 0x12, 0x00, 0x00

	byte	169
	byte	9
	byte	10
	byte	42
	byte	37
	byte	42
	byte	37
	byte	10
	byte	2
	byte	run,0x80+2
	byte	42
	byte	187
	byte	191
	byte	42
	byte	run,0x80+2
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	105
	byte	150
	byte	105
	byte	85
	byte	150
	byte	170
	byte	170
	byte	187
	byte	255
	byte	170
	byte	150
	byte	40
	byte	106
	byte	96
	byte	160
	byte	168
	byte	88
	byte	168
	byte	88
	byte	160
	byte	128
	byte	run,0x80+2
	byte	168
	byte	190
	byte	254
	byte	168
	byte	run,0x80+2




