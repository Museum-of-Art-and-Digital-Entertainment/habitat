;---------------------------------------
;
;	animation cel data
;

treeB_data::
	byte	both	+ 4
	byte	0b00111110
	byte	treeB_start_end - treeB_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11111110
	byte	0b11000000
	byte	0b00111110
	byte	0b00101100
	byte	0b00100110

	word	treeB_data_a - treeB_data
	word	treeB_data_b - treeB_data
	word	treeB_data_c - treeB_data
	word	treeB_data_d - treeB_data
	word	treeB_data_e - treeB_data
	word	treeB_data_f - treeB_data
	word	treeB_data_g - treeB_data

treeB_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


treeB_data_a:
	byte	0x04, 0x03, 0xff, 0xdb, 0x00, 0x00
	byte	170
	byte	2
	byte	run,0x80+1
	byte	170
	byte	170
	byte	10
	byte	162
	byte	run,3,128
	byte	run,0x80+2




treeB_data_b:
	byte	0x01, 0x21, 0x00, 0xfb, 0x00, 0x00
	byte	168
	byte	run,32,170




treeB_data_c:
	byte	cel_box + 0x07, 0x24, 0xfd, 0x26, 0x00, 0x00
	byte	0x55

treeB_data_d:
	byte	0x07, 0x07, 0xfd, 0x02, 0x00, 0x00
	byte	run,0x80+3
	byte	10
	byte	37
	byte	37
	byte	149
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	85
	byte	85
	byte	2
	byte	9
	byte	37
	byte	149
	byte	run,10,85
	byte	128
	byte	104
	byte	86
	byte	run,4,85
	byte	run,0x80+2
	byte	32
	byte	152
	byte	86
	byte	86
	byte	85
	byte	run,0x80+5
	byte	128
	byte	106




treeB_data_e:
	byte	0x01, 0x24, 0xfc, 0x26, 0x00, 0x00
	byte	2
	byte	2
	byte	run,3,9
	byte	run,4,37
	byte	41
	byte	9
	byte	run,6,37
	byte	run,3,9
	byte	run,4,37
	byte	41
	byte	run,3,9
	byte	37
	byte	37
	byte	41
	byte	run,3,9
	byte	2
	byte	2




treeB_data_f:
	byte	0x07, 0x0a, 0xfd, 0x30, 0x00, 0x00
	byte	149
	byte	37
	byte	37
	byte	9
	byte	10
	byte	run,0x80+5
	byte	run,5,85
	byte	149
	byte	37
	byte	10
	byte	run,0x80+2
	byte	run,7,85
	byte	149
	byte	38
	byte	8
	byte	run,7,85
	byte	149
	byte	42
	byte	run,0x80+1
	byte	run,7,85
	byte	105
	byte	130
	byte	run,0x80+1
	byte	run,4,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+2
	byte	86
	byte	88
	byte	88
	byte	96
	byte	128
	byte	run,0x80+5




treeB_data_g:
	byte	0x01, 0x24, 0x04, 0x26, 0x00, 0x00
	byte	128
	byte	128
	byte	run,3,96
	byte	run,3,128
	byte	96
	byte	run,3,88
	byte	90
	byte	run,5,86
	byte	90
	byte	run,5,88
	byte	104
	byte	run,3,96
	byte	88
	byte	88
	byte	104
	byte	run,3,96
	byte	128
	byte	128




