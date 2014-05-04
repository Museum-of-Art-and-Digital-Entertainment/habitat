;---------------------------------------
;
;	animation cel data
;

region0_data::
	byte	swing	+ 0
	byte	0b11110000
	byte	no_animation
	byte	no_cont

	byte	0+right,0+left,0

	byte	0b11111111

	word	region0_data_a - region0_data
	word	region0_data_b - region0_data
	word	region0_data_c - region0_data
	word	region0_data_d - region0_data
	word	region0_data_e - region0_data
	word	region0_data_f - region0_data
	word	region0_data_g - region0_data
	word	region0_data_h - region0_data


region0_data_a:
	byte	0x02, 0x05, 0xfe, 0x14, 0x00, 0x00

	byte	42
	byte	42
	byte	32
	byte	32
	byte	42
	byte	160
	byte	160
	byte	32
	byte	32
	byte	160




region0_data_b:
	byte	0x02, 0x05, 0xfe, 0x14, 0x00, 0x00

	byte	42
	byte	run,3,32
	byte	42
	byte	run,5,160




region0_data_c:
	byte	0x02, 0x05, 0xfe, 0x14, 0x00, 0x00

	byte	42
	byte	32
	byte	32
	byte	42
	byte	42
	byte	160
	byte	32
	byte	32
	byte	160
	byte	160




region0_data_d:
	byte	0x02, 0x05, 0xfe, 0x14, 0x00, 0x00

	byte	42
	byte	run,3,40
	byte	42
	byte	160
	byte	run,3,32
	byte	160




region0_data_e:
	byte	cel_box + 0x01, 0x02, 0xfe, 0x0f, 0x00, 0x00
	byte	0x02

region0_data_f:
	byte	cel_box + 0x01, 0x01, 0xff, 0x12, 0x00, 0x00
	byte	0x0a

region0_data_g:
	byte	cel_box + 0x01, 0x02, 0xfe, 0x16, 0x00, 0x00
	byte	0x02

region0_data_h:
	byte	0x02, 0x01, 0xfd, 0x12, 0x00, 0x00

	byte	2
	byte	128




