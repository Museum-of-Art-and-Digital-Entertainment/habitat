;---------------------------------------
;
;	animation cel data
;

vendo1_data::
	byte	both	+ 5
	byte	0b01111001
	byte	vendo1_start_end - vendo1_data
	byte	no_cont

	byte	0,0,0

	byte	0b11111111
	byte	0b11111011
	byte	0b10000001
	byte	0b10000101
	byte	0b10000011
	byte	0b10000111

	word	vendo1_data_a - vendo1_data
	word	vendo1_data_b - vendo1_data
	word	vendo1_data_c - vendo1_data
	word	vendo1_data_d - vendo1_data
	word	vendo1_data_e - vendo1_data
	word	vendo1_data_f - vendo1_data
	word	vendo1_data_g - vendo1_data
	word	vendo1_data_h - vendo1_data

vendo1_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


vendo1_data_a:
	byte	cel_box + both_bord + 0x06, 0x2a, 0xfe, 0x38, 0x00, 0x00
	byte	0q0000

vendo1_data_b:
	byte	cel_box + both_bord + 0x0a, 0x16, 0xfd, 0x4d, 0x00, 0x00
	byte	0q1111

vendo1_data_c:
	byte	cel_box + lr_bord + 0x0a, 0x11, 0xfd, 0x0e, 0x00, 0x00
	byte	0q1111

vendo1_data_d:
	byte	0x01, 0x43, 0xfd, 0x38, 0x00, 0x00
	byte	170
	byte	run,7,150
	byte	run,59,149




vendo1_data_e:
	byte	0x01, 0x43, 0x06, 0x38, 0x00, 0x00
	byte	170
	byte	run,7,150
	byte	run,59,86




vendo1_data_f:
	byte	cel_box + both_bord + 0x08, 0x0d, 0xfe, 0x48, 0x00, 0x00
	byte	0q3333

vendo1_data_g:
	byte	0x08, 0x09, 0xfe, 0x09, 0x00, 0x00
	byte	170
	byte	170
	byte	149
	byte	run,4,154
	byte	run,4,170
	byte	85
	byte	run,8,170
	byte	85
	byte	run,8,170
	byte	85
	byte	run,8,170
	byte	85
	byte	run,8,170
	byte	85
	byte	run,8,170
	byte	85
	byte	run,8,170
	byte	86
	byte	run,4,166
	byte	170
	byte	170




vendo1_data_h:
	byte	0x03, 0x2a, 0x03, 0x38, 0x00, 0x00
	byte	run,0x80+13
	byte	run,15,8
	byte	run,0x80+14
	byte	106
	byte	run,4,111
	byte	run,4,110
	byte	run,3,111
	byte	110
	byte	111
	byte	110
	byte	111
	byte	110
	byte	111
	byte	110
	byte	111
	byte	110
	byte	run,10,111
	byte	run,4,110
	byte	run,6,111
	byte	106
	byte	170
	byte	run,4,254
	byte	run,4,174
	byte	run,3,254
	byte	238
	byte	254
	byte	238
	byte	254
	byte	238
	byte	254
	byte	238
	byte	254
	byte	238
	byte	run,10,254
	byte	174
	byte	46
	byte	46
	byte	174
	byte	run,6,254
	byte	170




