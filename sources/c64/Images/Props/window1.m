;---------------------------------------
;
;	animation cel data
;

window1_data::
	byte	both	+ 7
	byte	0b11100000
	byte	window1_start_end - window1_data
	byte	no_cont

	byte	240+right,32+left,255

	byte	0b11111100
	byte	0b11101100
	byte	0b01111100
	byte	0b01101100
	byte	0b01111000
	byte	0b01101000
	byte	0b11011000
	byte	0b11001000

	word	window1_data_a - window1_data
	word	window1_data_b - window1_data
	word	window1_data_c - window1_data
	word	window1_data_d - window1_data
	word	window1_data_e - window1_data
	word	window1_data_f - window1_data

window1_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7


window1_data_a:
	byte	cel_box + 0x01, 0x30, 0x01, 0x1a, 0x00, 0x00
	byte	0xb9

window1_data_b:
	byte	cel_box + 0x03, 0x25, 0x02, 0x16, 0x00, 0x00
	byte	0x55

window1_data_c:
	byte	cel_box + 0x01, 0x25, 0x05, 0x16, 0x00, 0x00
	byte	0x6e

window1_data_d:
	byte	0x05, 0x05, 0x01, 0x05, 0x00, 0x00
	byte	2
	byte	2
	byte	3
	byte	3
	byte	2
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	255
	byte	run,3,170
	byte	255
	byte	255
	byte	170
	byte	128
	byte	128
	byte	192
	byte	192
	byte	128




window1_data_e:
	byte	0x05, 0x04, 0x01, 0x1a, 0x00, 0x00
	byte	10
	byte	63
	byte	63
	byte	42
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	174
	byte	254
	byte	254
	byte	170




window1_data_f:
	byte	0x05, 0x07, 0x01, 0xf1, 0x00, 0x00
	byte	42
	byte	63
	byte	42
	byte	run,3,63
	byte	42
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	run,3,255
	byte	170
	byte	170
	byte	254
	byte	170
	byte	run,3,254
	byte	170




