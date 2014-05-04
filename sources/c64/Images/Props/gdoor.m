;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

gdoor_data::
	byte	both	+ 1
	byte	0b01000000
	byte	gdoor_start_end - gdoor_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b10111110
	byte	0b11111001

	word	gdoor_data_a - gdoor_data
	word	gdoor_data_b - gdoor_data
	word	gdoor_data_c - gdoor_data
	word	gdoor_data_d - gdoor_data
	word	gdoor_data_e - gdoor_data
	word	gdoor_data_f - gdoor_data
	word	gdoor_data_g - gdoor_data
	word	gdoor_data_h - gdoor_data

gdoor_start_end:
	byte	0,0,1,1


gdoor_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xdf, 0x00, 0x00
	byte	pat_glass

gdoor_data_b:
	byte	cel_box + 0x03+2, 0x45, 0x00, 0x23, 0x00, 0x00
	byte	0xaa

gdoor_data_c:
	byte	cel_box + 0x01, 0x45, 0xff, 0x23, 0x00, 0x00
	byte	0x2e

gdoor_data_d:
	byte	cel_box + 0x01, 0x45, 0x05, 0x23, 0x00, 0x00
	byte	0xb8

gdoor_data_e:
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




gdoor_data_f:
	byte	0x05, 0x22, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+2
	byte	64
	byte	80
	byte	84
	byte	run,6,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+11
	byte	64
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+10
	byte	64
	byte	80
	byte	84
	byte	run,6,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+11
	byte	64
	byte	80
	byte	20
	byte	5
	byte	1
	byte	5
	byte	1
	byte	run,0x80+8
	byte	64
	byte	80
	byte	84
	byte	run,6,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+11
	byte	64
	byte	run,0x80+1
	byte	64
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+8
	byte	64
	byte	80
	byte	84
	byte	run,4,85
	byte	90
	byte	91
	byte	27
	byte	run,10,11
	byte	run,0x80+5
	byte	64
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+8
	byte	64
	byte	80
	byte	84
	byte	169
	byte	run,8,249
	byte	run,4,248




gdoor_data_g:
	byte	0x05, 0x20, 0x00, 0x22, 0x00, 0x00
	byte	run,0x80+2
	byte	64
	byte	16
	byte	4
	byte	1
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,9,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+14
	byte	64
	byte	16
	byte	4
	byte	1
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,9,85
	byte	21
	byte	5
	byte	1
	byte	run,0x80+4
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+6
	byte	64
	byte	16
	byte	4
	byte	1
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,9,85
	byte	21
	byte	5
	byte	1
	byte	run,3,11
	byte	74
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+6
	byte	64
	byte	16
	byte	4
	byte	1
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,8,85
	byte	run,3,248
	byte	168
	byte	run,0x80+3
	byte	64
	byte	80
	byte	20
	byte	5
	byte	1
	byte	run,0x80+6
	byte	64
	byte	16
	byte	4
	byte	1
	byte	run,0x80+3
	byte	64
	byte	80
	byte	84
	byte	run,4,85




gdoor_data_h:
	byte	0x02, 0x43, 0x00, 0x22, 0x00, 0x00
	byte	192
	byte	48
	byte	76
	byte	67
	byte	16
	byte	16
	byte	4
	byte	4
	byte	1
	byte	1
	byte	run,0x80+7
	byte	64
	byte	64
	byte	80
	byte	80
	byte	84
	byte	84
	byte	run,3,85
	byte	22
	byte	22
	byte	6
	byte	6
	byte	run,4,2
	byte	66
	byte	64
	byte	16
	byte	16
	byte	4
	byte	4
	byte	1
	byte	1
	byte	run,0x80+7
	byte	64
	byte	64
	byte	16
	byte	16
	byte	4
	byte	68
	byte	65
	byte	81
	byte	80
	byte	84
	byte	84
	byte	run,4,85
	byte	21
	byte	21
	byte	1
	byte	run,0x80+4
	byte	192
	byte	48
	byte	run,4,12
	byte	76
	byte	76
	byte	28
	byte	28
	byte	run,11,12
	byte	76
	byte	76
	byte	156
	byte	172
	byte	run,6,236
	byte	run,7,12
	byte	76
	byte	76
	byte	28
	byte	28
	byte	run,11,12
	byte	76
	byte	76
	byte	run,3,12
	byte	76
	byte	76
	byte	run,3,92




