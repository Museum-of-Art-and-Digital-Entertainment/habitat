;---------------------------------------
;
;	animation cel data
;

door2_data::
	byte	both	+ 1
	byte	0b01000110
	byte	door2_start_end - door2_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b10111110
	byte	0b11111001

	word	door2_data_a - door2_data
	word	door2_data_b - door2_data
	word	door2_data_c - door2_data
	word	door2_data_d - door2_data
	word	door2_data_e - door2_data
	word	door2_data_f - door2_data
	word	door2_data_g - door2_data
	word	door2_data_h - door2_data

door2_start_end:
	byte	0,0,1,1


door2_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xdf, 0x00, 0x00
	byte	pat_glass

door2_data_b:
	byte	cel_box + 0x03+2, 0x45, 0x00, 0x23, 0x00, 0x00
	byte	0xaa

door2_data_c:
	byte	cel_box + 0x01, 0x45, 0xff, 0x23, 0x00, 0x00
	byte	0x2e

door2_data_d:
	byte	cel_box + 0x01, 0x45, 0x05, 0x23, 0x00, 0x00
	byte	0xb8

door2_data_e:
	byte	0x07, 0x04, 0xff, 0x27, 0x00, 0x00
	byte	46
	byte	47
	byte	47
	byte	42
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	170
	byte	255
	byte	255
	byte	170
	byte	184
	byte	248
	byte	248
	byte	168




door2_data_f:
	byte	0x05, 0x23, 0x00, 0x01, 0x00, 0x00
	byte	170
	byte	run,3,85
	byte	101
	byte	90
	byte	run,29,89
	byte	170
	byte	run,4,85
	byte	170
	byte	run,29,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,29,85
	byte	170
	byte	run,4,85
	byte	170
	byte	run,23,85
	byte	86
	byte	90
	byte	171
	byte	191
	byte	171
	byte	86
	byte	170
	byte	run,3,85
	byte	89
	byte	165
	byte	run,23,101
	byte	165
	byte	165
	byte	run,3,229
	byte	165




door2_data_g:
	byte	0x05, 0x22, 0x00, 0x23, 0x00, 0x00
	byte	run,30,89
	byte	90
	byte	101
	byte	run,15,85
	byte	90
	byte	90
	byte	91
	byte	90
	byte	86
	byte	86
	byte	run,11,85
	byte	170
	byte	run,16,85
	byte	170
	byte	235
	byte	run,5,170
	byte	run,10,85
	byte	170
	byte	run,4,85
	byte	run,4,86
	byte	run,8,85
	byte	165
	byte	165
	byte	229
	byte	165
	byte	149
	byte	149
	byte	run,11,85
	byte	170
	byte	run,3,85
	byte	101
	byte	165
	byte	229
	byte	229
	byte	165
	byte	run,25,101
	byte	165
	byte	89
	byte	85
	byte	85




door2_data_h:
	byte	0x02, 0x45, 0x00, 0x23, 0x00, 0x00
	byte	160
	byte	90
	byte	run,4,85
	byte	105
	byte	102
	byte	run,22,101
	byte	run,4,102
	byte	101
	byte	101
	byte	run,3,102
	byte	run,9,101
	byte	106
	byte	107
	byte	110
	byte	run,3,106
	byte	102
	byte	run,8,101
	byte	102
	byte	105
	byte	run,3,85
	byte	90
	byte	run,0x80+2
	byte	160
	byte	run,4,88
	byte	run,22,152
	byte	168
	byte	184
	byte	248
	byte	248
	byte	168
	byte	152
	byte	152
	byte	216
	byte	216
	byte	run,26,152
	byte	run,3,88
	byte	160
	byte	run,0x80+1




