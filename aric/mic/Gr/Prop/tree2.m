;---------------------------------------
;
;	animation cel data
;

tree2_data::
	byte	both	+ 4
	byte	0b00001111
	byte	tree2_start_end - tree2_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11111111
	byte	0b11100000
	byte	0b00011111
	byte	0b00001010
	byte	0b00001001

	word	tree2_data_a - tree2_data
	word	tree2_data_b - tree2_data
	word	tree2_data_c - tree2_data
	word	tree2_data_d - tree2_data
	word	tree2_data_e - tree2_data
	word	tree2_data_f - tree2_data
	word	tree2_data_g - tree2_data
	word	tree2_data_h - tree2_data

tree2_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


tree2_data_a:
	byte	0x04, 0x03, 0xff, 0xdb, 0x00, 0x00

	byte	170
	byte	run,0x80+2
	byte	170
	byte	42
	byte	10
	byte	162
	byte	170
	byte	168
	byte	136
	byte	run,0x80+2




tree2_data_b:
	byte	cel_box + 0x01, 0x1f, 0x00, 0xfa, 0x00, 0x00
	byte	0x0a

tree2_data_c:
	byte	cel_box + 0x01, 0x1f, 0x01, 0xfa, 0x00, 0x00
	byte	0xa8

tree2_data_d:
	byte	cel_box + 0x04, 0x01, 0xff, 0xfb, 0x00, 0x00
	byte	0xaa

tree2_data_e:
	byte	cel_box + 0x04, 0x34, 0xff, 0x2f, 0x00, 0x00
	byte	0x55

tree2_data_f:
	byte	0x04, 0x0f, 0xff, 0x3d, 0x00, 0x00

	byte	149
	byte	37
	byte	149
	byte	149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+5
	byte	run,10,85
	byte	149
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,10,85
	byte	86
	byte	86
	byte	88
	byte	96
	byte	128
	byte	86
	byte	88
	byte	96
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+5




tree2_data_g:
	byte	0x02, 0x33, 0xfd, 0x2e, 0x00, 0x00

	byte	run,0x80+3
	byte	2
	byte	2
	byte	9
	byte	9
	byte	run,5,37
	byte	9
	byte	9
	byte	2
	byte	9
	byte	run,3,37
	byte	run,4,149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	2
	byte	run,4,9
	byte	run,3,2
	byte	run,0x80+16
	byte	10
	byte	37
	byte	149
	byte	run,32,85
	byte	149
	byte	37
	byte	run,3,149
	byte	37
	byte	37
	byte	9
	byte	run,3,37
	byte	run,3,9
	byte	2
	byte	2




tree2_data_h:
	byte	0x02, 0x33, 0x03, 0x2e, 0x00, 0x00

	byte	128
	byte	106
	byte	run,21,85
	byte	86
	byte	run,7,85
	byte	86
	byte	run,3,85
	byte	86
	byte	86
	byte	88
	byte	86
	byte	86
	byte	run,3,88
	byte	96
	byte	128
	byte	96
	byte	96
	byte	run,4,128
	byte	run,0x80+2
	byte	128
	byte	96
	byte	run,5,88
	byte	96
	byte	96
	byte	88
	byte	88
	byte	run,5,86
	byte	run,3,88
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,4,96
	byte	128
	byte	128
	byte	run,0x80+1
	byte	run,3,128
	byte	run,0x80+16




