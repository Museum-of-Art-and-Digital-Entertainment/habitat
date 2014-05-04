;---------------------------------------
;
;	animation cel data
;

couchfb_data::
	byte	both	+ 0
	byte	0b01110000
	byte	couchfb_start_end - couchfb_data
	byte	couchfb_contents_xy - couchfb_data

	byte	8+right,40+left,255

	byte	0b11111110

	word	couchfb_data_a - couchfb_data
	word	couchfb_data_b - couchfb_data
	word	couchfb_data_c - couchfb_data
	word	couchfb_data_d - couchfb_data
	word	couchfb_data_e - couchfb_data
	word	couchfb_data_f - couchfb_data
	word	couchfb_data_g - couchfb_data

couchfb_start_end:
	byte	0,0,0,0

couchfb_contents_xy:
	byte	251,31,0,31


couchfb_data_a:
	byte	cel_box + 0x0e, 0x01, 0xf8, 0xd0, 0x00, 0x00
	byte	pat_glass

couchfb_data_b:
	byte	0x02, 0x29, 0xf8, 0xf8, 0x00, 0x00

	byte	run,10,2
	byte	run,4,9
	byte	run,3,37
	byte	run,8,149
	byte	37
	byte	10
	byte	run,0x80+14
	byte	170
	byte	run,3,86
	byte	run,22,85
	byte	165
	byte	run,11,37
	byte	9
	byte	9
	byte	2




couchfb_data_c:
	byte	cel_box + tb_bord + 0x06+4, 0x27, 0xfa, 0xf9, 0x00, 0x00
	byte	0q1111

couchfb_data_d:
	byte	0x02, 0x29, 0x04, 0xf8, 0x00, 0x00

	byte	170
	byte	run,3,149
	byte	run,22,85
	byte	90
	byte	run,11,88
	byte	96
	byte	96
	byte	run,11,128
	byte	run,4,96
	byte	run,3,88
	byte	run,8,86
	byte	88
	byte	160
	byte	run,0x80+14




couchfb_data_e:
	byte	0x02, 0x0c, 0xf9, 0xea, 0x00, 0x00

	byte	run,0x80+1
	byte	run,10,2
	byte	8
	byte	170
	byte	run,0x80+6
	byte	170
	byte	run,0x80+4




couchfb_data_f:
	byte	cel_box + tb_bord + 0x09, 0x08, 0xfb, 0xe6, 0x00, 0x00
	byte	0q0000

couchfb_data_g:
	byte	0x01, 0x0b, 0x04, 0xea, 0x00, 0x00

	byte	run,10,128
	byte	32




