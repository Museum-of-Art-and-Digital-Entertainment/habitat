;---------------------------------------
;
;	animation cel data
;

newsstand1_data::
	byte	both	+ 5
	byte	0b11000000
	byte	newsstand1_start_end - newsstand1_data
	byte	no_cont+0x01

	byte	0,0,0

	byte	0b11110000
	byte	0b11111000
	byte	0b11111100
	byte	0b11111110
	byte	0b11100000
	byte	0b11100110

	word	newsstand1_data_a - newsstand1_data
	word	newsstand1_data_b - newsstand1_data
	word	newsstand1_data_c - newsstand1_data
	word	newsstand1_data_d - newsstand1_data
	word	newsstand1_data_e - newsstand1_data
	word	newsstand1_data_f - newsstand1_data
	word	newsstand1_data_g - newsstand1_data

newsstand1_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


newsstand1_data_a:
	byte	cel_box + both_bord + 0x02, 0x28, 0x01, 0x2d, 0x00, 0x00
	byte	0q1111

newsstand1_data_b:
	byte	0x06, 0x28, 0xfc, 0x2d, 0x00, 0x00
	byte	170
	byte	149
	byte	149
	byte	154
	byte	run,31,152
	byte	154
	byte	run,3,149
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+31
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+31
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+31
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,0x80+31
	byte	170
	byte	run,3,85
	byte	170
	byte	128
	byte	64
	byte	64
	byte	128
	byte	run,0x80+32
	byte	run,3,64
	byte	run,0x80+1




newsstand1_data_c:
	byte	0x03, 0x0b, 0x00, 0x1d, 0x00, 0x00
	byte	run,8,2
	byte	run,0x80+3
	byte	run,8,15
	byte	run,0x80+2
	byte	10
	byte	run,8,240
	byte	run,0x80+2
	byte	160




newsstand1_data_d:
	byte	0x06, 0x0d, 0xfd, 0x05, 0x00, 0x00
	byte	168
	byte	run,10,184
	byte	168
	byte	168
	byte	run,0x80+15
	byte	42
	byte	run,8,46
	byte	42
	byte	42
	byte	run,0x80+13
	byte	10
	byte	run,10,11
	byte	10
	byte	10
	byte	run,13,128




newsstand1_data_e:
	byte	cel_box + lr_bord + 0x03, 0x01, 0xfe, 0x2e, 0x00, 0x00
	byte	0q0000

newsstand1_data_f:
	byte	cel_box + both_bord + 0x05, 0x0f, 0xfd, 0x3d, 0x00, 0x00
	byte	0q3333

newsstand1_data_g:
	byte	0x05, 0x07, 0xfd, 0x39, 0x00, 0x00
	byte	run,7,2
	byte	34
	byte	run,5,162
	byte	34
	byte	162
	byte	2
	byte	2
	byte	130
	byte	2
	byte	2
	byte	162
	byte	34
	byte	160
	byte	160
	byte	162
	byte	run,3,34
	byte	160
	byte	32
	byte	32
	byte	160
	byte	run,0x80+2
	byte	160




