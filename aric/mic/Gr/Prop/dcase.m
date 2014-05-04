;---------------------------------------
;
;	animation cel data
;

dcase_data::
	byte	both	+ 3
	byte	0b00100000
	byte	dcase_start_end - dcase_data
	byte	dcase_contents_xy - dcase_data

	byte	244+right,52+left,255

	byte	0b11111111
	byte	0b00111111
	byte	0b11101111
	byte	0b11111110

	word	dcase_data_a - dcase_data
	word	dcase_data_b - dcase_data
	word	dcase_data_c - dcase_data
	word	dcase_data_d - dcase_data
	word	dcase_data_e - dcase_data
	word	dcase_data_f - dcase_data
	word	dcase_data_g - dcase_data
	word	dcase_data_h - dcase_data

dcase_start_end:
	byte	0,0,1,1,2,2,3,3

dcase_contents_xy:
	byte	0,39,4,39,255,4,2,4,5,4


dcase_data_a:
	byte	cel_box + 0x01, 0x03, 0xfe, 0xd3, 0x00, 0x00
	byte	0xa8

dcase_data_b:
	byte	cel_box + 0x01, 0x03, 0x08, 0xd3, 0x00, 0x00
	byte	0x2a

dcase_data_c:
	byte	cel_box + both_bord + 0x06+5, 0x26, 0xfe, 0xf9, 0x00, 0x00
	byte	0q1111

dcase_data_d:
	byte	0x0d, 0x03, 0xfd, 0xfc, 0x00, 0x00

	byte	run,3,2
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,3,128




dcase_data_e:
	byte	0x01, 0x21, 0xff, 0xf8, 0x00, 0x00

	byte	run,3,128
	byte	160
	byte	160
	byte	run,12,168
	byte	128
	byte	128
	byte	run,3,160
	byte	run,10,168
	byte	160




dcase_data_f:
	byte	0x01, 0x21, 0x07, 0xf8, 0x00, 0x00

	byte	run,3,2
	byte	10
	byte	10
	byte	run,12,42
	byte	2
	byte	2
	byte	run,3,10
	byte	run,10,42
	byte	10




dcase_data_g:
	byte	cel_box + tb_bord + 0x09, 0x06, 0xff, 0xdd, 0x00, 0x00
	byte	0q0000

dcase_data_h:
	byte	cel_box + tb_bord + 0x09, 0x07, 0xff, 0xee, 0x00, 0x00
	byte	0q0000

