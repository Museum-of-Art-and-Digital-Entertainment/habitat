;---------------------------------------
;
;	animation cel data
;

bboard_data::
	byte	swing	+ 2
	byte	0b00001100
	byte	bboard_start_end - bboard_data
	byte	bboard_contents_xy - bboard_data

	byte	244+right,44+left,255

	byte	0b11111100
	byte	0b00111100
	byte	0b00001100

	word	bboard_data_a - bboard_data
	word	bboard_data_b - bboard_data
	word	bboard_data_c - bboard_data
	word	bboard_data_d - bboard_data
	word	bboard_data_e - bboard_data
	word	bboard_data_f - bboard_data

bboard_start_end:
	byte	0,0,1,1,2,2

bboard_contents_xy:
	byte	248,236,251,236,254,236,1,236,4,236


bboard_data_a:
	byte	cel_box + 0x01, 0x14, 0xf8, 0xfd, 0x00, 0x00
	byte	0x2a

bboard_data_b:
	byte	cel_box + 0x01, 0x14, 0x05, 0xfd, 0x00, 0x00
	byte	0xa8

bboard_data_c:
	byte	cel_box + 0x01, 0x14, 0xf8, 0x11, 0x00, 0x00
	byte	0x2a

bboard_data_d:
	byte	cel_box + 0x01, 0x14, 0x05, 0x11, 0x00, 0x00
	byte	0xa8

bboard_data_e:
	byte	cel_box + both_bord + 0x05+10, 0x15, 0xf7, 0x26, 0x00, 0x00
	byte	0q1111

bboard_data_f:
	byte	0x02, 0x15, 0x05, 0x26, 0x00, 0x00
	byte	run,0x80+1
	byte	run,19,1
	byte	run,0x80+1
	byte	170
	byte	run,19,86
	byte	170




