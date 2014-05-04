;---------------------------------------
;
;	animation cel data
;

chests_data::
	byte	both	+ 1
	byte	0b11111110
	byte	chests_start_end - chests_data
	byte	no_cont

	byte	232+right,232+left,255

	byte	0b11111110
	byte	0b11111111

	word	chests_data_a - chests_data
	word	chests_data_b - chests_data
	word	chests_data_c - chests_data
	word	chests_data_d - chests_data
	word	chests_data_e - chests_data
	word	chests_data_f - chests_data
	word	chests_data_g - chests_data
	word	chests_data_h - chests_data

chests_start_end:
	byte	0,0,1,1


chests_data_a:
	byte	0x06, 0x06, 0xfe, 0xde, 0x00, 0x00

	byte	170
	byte	run,5,150
	byte	run,0x80+2
	byte	run,3,128
	byte	170
	byte	run,0x80+5
	byte	170
	byte	run,0x80+5
	byte	170
	byte	run,0x80+2
	byte	run,3,2
	byte	170
	byte	170
	byte	run,5,150




chests_data_b:
	byte	cel_box + lr_bord + 0x06, 0x2a, 0xfe, 0x08, 0x00, 0x00
	byte	0q1111

chests_data_c:
	byte	cel_box + 0x04, 0x01, 0xff, 0xe2, 0x00, 0x00
	byte	0xaa

chests_data_d:
	byte	cel_box + 0x01, 0x22, 0xfe, 0x04, 0x00, 0x00
	byte	0x02

chests_data_e:
	byte	cel_box + 0x01, 0x22, 0x03, 0x04, 0x00, 0x00
	byte	0x80

chests_data_f:
	byte	cel_box + 0x04, 0x01, 0xff, 0x05, 0x00, 0x00
	byte	0xaa

chests_data_g:
	byte	0x08, 0x04, 0xfd, 0x0c, 0x00, 0x00

	byte	run,0x80+1
	byte	run,3,2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+1
	byte	run,3,128




chests_data_h:
	byte	0x03, 0x0a, 0xfb, 0xf0, 0x00, 0x00

	byte	42
	byte	run,3,47
	byte	175
	byte	175
	byte	run,3,47
	byte	42
	byte	170
	byte	run,8,255
	byte	170
	byte	170
	byte	run,8,255
	byte	170




