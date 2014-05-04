;---------------------------------------
;
;	animation cel data
;

tree1_data::
	byte	both	+ 4
	byte	0b00011111
	byte	tree1_start_end - tree1_data
	byte	tree1_contents_xy - tree1_data

	byte	244+right,28+left,255

	byte	0b11111111
	byte	0b11100000
	byte	0b00011100
	byte	0b00011110
	byte	0b00001111

	word	tree1_data_a - tree1_data
	word	tree1_data_b - tree1_data
	word	tree1_data_c - tree1_data
	word	tree1_data_d - tree1_data
	word	tree1_data_e - tree1_data
	word	tree1_data_f - tree1_data
	word	tree1_data_g - tree1_data
	word	tree1_data_h - tree1_data

tree1_start_end:
	byte	0,0,1,1,2,2,3,3,4,4

tree1_contents_xy:
	byte	0,4,2,247,1,229,254,231,253,251


tree1_data_a:
	byte	0x04, 0x03, 0xff, 0xd8, 0x00, 0x00
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




tree1_data_b:
	byte	cel_box + 0x01, 0x20, 0x00, 0xf8, 0x00, 0x00
	byte	0x0a

tree1_data_c:
	byte	cel_box + 0x01, 0x20, 0x01, 0xf8, 0x00, 0x00
	byte	0xa8

tree1_data_d:
	byte	0x06, 0x06, 0xfe, 0xfd, 0x00, 0x00
	byte	run,0x80+5
	byte	2
	byte	run,0x80+2
	byte	2
	byte	41
	byte	149
	byte	85
	byte	10
	byte	37
	byte	149
	byte	run,3,85
	byte	170
	byte	run,5,85
	byte	run,0x80+1
	byte	128
	byte	96
	byte	90
	byte	85
	byte	85
	byte	run,0x80+3
	byte	128
	byte	96
	byte	90




tree1_data_e:
	byte	cel_box + 0x05, 0x2d, 0xff, 0x2a, 0x00, 0x00
	byte	0x55

;;	byte	0x05, 0x2d, 0xff, 0x2a, 0x00, 0x00
;;	byte	run,127,0x55
;;	byte	run,98,0x55

tree1_data_f:
	byte	0x02, 0x2d, 0x04, 0x2a, 0x00, 0x00
	byte	128
	byte	run,3,96
	byte	88
	byte	run,5,86
	byte	run,7,85
	byte	86
	byte	run,15,85
	byte	86
	byte	run,4,88
	byte	run,3,96
	byte	run,4,128
	byte	run,0x80+10
	byte	run,7,128
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,5,96
	byte	128
	byte	128
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+12




tree1_data_g:
	byte	0x05, 0x05, 0xff, 0x2f, 0x00, 0x00
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	run,3,85
	byte	150
	byte	40
	byte	85
	byte	85
	byte	149
	byte	37
	byte	10
	byte	85
	byte	85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	86
	byte	88
	byte	160
	byte	run,0x80+2




tree1_data_h:
	byte	0x02, 0x2d, 0xfd, 0x2a, 0x00, 0x00
	byte	run,0x80+6
	byte	run,6,2
	byte	run,5,9
	byte	2
	byte	2
	byte	9
	byte	run,4,37
	byte	9
	byte	9
	byte	run,4,37
	byte	run,3,9
	byte	run,3,2
	byte	run,0x80+9
	byte	9
	byte	9
	byte	37
	byte	run,3,149
	byte	run,30,85
	byte	run,3,149
	byte	37
	byte	37
	byte	9
	byte	9
	byte	2
	byte	2




