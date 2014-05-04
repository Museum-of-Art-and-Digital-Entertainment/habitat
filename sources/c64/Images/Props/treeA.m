;---------------------------------------
;
;	animation cel data
;

treeA_data::
	byte	both	+ 4
	byte	0b11111000
	byte	treeA_start_end - treeA_data
	byte	no_cont

	byte	244+right,32+left,246

	byte	0b11111000
	byte	0b11100000
	byte	0b10011000
	byte	0b11110000
	byte	0b11011000

	word	treeA_data_a - treeA_data
	word	treeA_data_b - treeA_data
	word	treeA_data_c - treeA_data
	word	treeA_data_d - treeA_data
	word	treeA_data_e - treeA_data

treeA_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


treeA_data_a:
	byte	cel_box + 0x07+2, 0x21, 0xfa, 0x3b, 0x00, 0x00
	byte	0x55

treeA_data_b:
	byte	0x02, 0x21, 0x03, 0x3b, 0x00, 0x00

	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	86
	byte	run,6,85
	byte	86
	byte	86
	byte	88
	byte	run,3,96
	byte	run,3,88
	byte	run,6,86
	byte	88
	byte	88
	byte	96
	byte	128
	byte	128
	byte	run,0x80+7
	byte	run,6,128
	byte	run,0x80+20




treeA_data_c:
	byte	0x0a, 0x09, 0xfa, 0x44, 0x00, 0x00

	byte	165
	byte	9
	byte	2
	byte	run,0x80+6
	byte	85
	byte	85
	byte	149
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+2
	byte	run,5,85
	byte	105
	byte	130
	byte	run,0x80+2
	byte	run,6,85
	byte	165
	byte	9
	byte	2
	byte	run,7,85
	byte	86
	byte	168
	byte	run,7,85
	byte	165
	byte	10
	byte	run,7,85
	byte	149
	byte	42
	byte	run,4,85
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+1
	byte	85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+4
	byte	128
	byte	run,0x80+8




treeA_data_d:
	byte	0x09, 0x09, 0xfa, 0x1a, 0x00, 0x00

	byte	run,0x80+3
	byte	2
	byte	2
	byte	9
	byte	9
	byte	37
	byte	165
	byte	run,0x80+1
	byte	42
	byte	149
	byte	run,6,85
	byte	run,0x80+1
	byte	128
	byte	96
	byte	88
	byte	run,3,86
	byte	85
	byte	85
	byte	run,0x80+7
	byte	160
	byte	90
	byte	run,0x80+2
	byte	2
	byte	9
	byte	9
	byte	run,3,37
	byte	149
	byte	42
	byte	149
	byte	run,7,85
	byte	run,0x80+1
	byte	128
	byte	106
	byte	run,6,85
	byte	run,0x80+3
	byte	168
	byte	86
	byte	run,4,85
	byte	run,0x80+5
	byte	128
	byte	128
	byte	104
	byte	86




treeA_data_e:
	byte	0x02, 0x21, 0xf8, 0x3b, 0x00, 0x00

	byte	run,0x80+3
	byte	2
	byte	9
	byte	9
	byte	run,8,37
	byte	run,3,9
	byte	2
	byte	2
	byte	9
	byte	run,4,37
	byte	run,4,9
	byte	2
	byte	run,0x80+4
	byte	2
	byte	10
	byte	165
	byte	run,26,85
	byte	149
	byte	149
	byte	41
	byte	2




