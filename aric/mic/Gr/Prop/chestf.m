;---------------------------------------
;
;	animation cel data
;

chestf_data::
	byte	both	+ 1
	byte	0b11100000
	byte	chestf_start_end - chestf_data
	byte	no_cont

	byte	248+right,40+left,255

	byte	0b11111011
	byte	0b11111111

	word	chestf_data_a - chestf_data
	word	chestf_data_b - chestf_data
	word	chestf_data_c - chestf_data
	word	chestf_data_d - chestf_data
	word	chestf_data_e - chestf_data
	word	chestf_data_f - chestf_data
	word	chestf_data_g - chestf_data
	word	chestf_data_h - chestf_data

chestf_start_end:
	byte	0,0,1,1


chestf_data_a:
	byte	0x01, 0x08, 0xfe, 0xd9, 0x00, 0x00

	byte	170
	byte	170
	byte	run,6,150




chestf_data_b:
	byte	0x01, 0x08, 0x05, 0xd9, 0x00, 0x00

	byte	170
	byte	170
	byte	run,6,150




chestf_data_c:
	byte	cel_box + both_bord + 0x05+3, 0x2d, 0xfe, 0x06, 0x00, 0x00
	byte	0q1111

chestf_data_d:
	byte	0x0a, 0x03, 0xfd, 0x09, 0x00, 0x00

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
	byte	run,3,128




chestf_data_e:
	byte	0x06, 0x17, 0xff, 0x01, 0x00, 0x00

	byte	170
	byte	run,3,128
	byte	130
	byte	130
	byte	run,3,128
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,3,128
	byte	130
	byte	130
	byte	run,3,128
	byte	170
	byte	170
	byte	run,0x80+3
	byte	170
	byte	254
	byte	run,0x80+3
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,0x80+3
	byte	170
	byte	254
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,0x80+8
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,0x80+8
	byte	170
	byte	170
	byte	run,0x80+8
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,0x80+8
	byte	170
	byte	170
	byte	run,0x80+3
	byte	170
	byte	191
	byte	run,0x80+3
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,0x80+3
	byte	170
	byte	191
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,3,2
	byte	130
	byte	130
	byte	run,3,2
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,3,2
	byte	130
	byte	130
	byte	run,3,2
	byte	170




chestf_data_f:
	byte	cel_box + 0x06, 0x03, 0xff, 0xe7, 0x00, 0xfd
	byte	0xaa

chestf_data_g:
	byte	cel_box + both_bord + 0x06, 0x0a, 0xff, 0xe7, 0x00, 0x00
	byte	0q1111

chestf_data_h:
	byte	0x06, 0x02, 0xff, 0xe3, 0x00, 0x00

	byte	2
	byte	2
	byte	170
	byte	254
	byte	run,0x80+4
	byte	170
	byte	191
	byte	128
	byte	128




