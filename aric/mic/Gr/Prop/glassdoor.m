;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

glassdoor_data::
	byte	both	+ 1
	byte	0b00111100
	byte	glassdoor_start_end - glassdoor_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b11101000
	byte	0b11010100

	word	glassdoor_data_a - glassdoor_data
	word	glassdoor_data_b - glassdoor_data
	word	glassdoor_data_c - glassdoor_data
	word	glassdoor_data_d - glassdoor_data
	word	glassdoor_data_e - glassdoor_data
	word	glassdoor_data_f - glassdoor_data

glassdoor_start_end:
	byte	0,0,1,1


glassdoor_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xe0, 0x00, 0x00
	byte	0x55

glassdoor_data_b:
	byte	cel_box + 0x03+2, 0x43, 0x00, 0x22, 0x00, 0x00
	byte	0xaa

glassdoor_data_c:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	42
	byte	run,35,46
	byte	run,0x80+1
	byte	170
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
	byte	run,0x80+5
	byte	170
	byte	run,0x80+6
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
	byte	run,0x80+1
	byte	170
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
	byte	170
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
	byte	run,0x80+1
	byte	170
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
	byte	168
	byte	run,35,184




glassdoor_data_d:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	42
	byte	run,35,46
	byte	run,0x80+1
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
	byte	run,0x80+5
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
	byte	run,0x80+108
	byte	168
	byte	run,35,184




glassdoor_data_e:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0x00
	byte	run,33,46
	byte	47
	byte	47
	byte	42
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
	byte	run,0x80+8
	byte	170
	byte	255
	byte	255
	byte	170
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
	byte	run,0x80+4
	byte	170
	byte	255
	byte	255
	byte	170
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
	byte	170
	byte	255
	byte	255
	byte	170
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
	byte	170
	byte	255
	byte	255
	byte	170
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
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,33,184
	byte	248
	byte	248
	byte	168




glassdoor_data_f:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0x00
	byte	run,33,46
	byte	47
	byte	47
	byte	42
	byte	66
	byte	18
	byte	18
	byte	6
	byte	6
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
	byte	run,3,85
	byte	21
	byte	21
	byte	5
	byte	5
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,4,236
	byte	172
	byte	12
	byte	12
	byte	76
	byte	76
	byte	28
	byte	28
	byte	run,11,12
	byte	76
	byte	76
	byte	28
	byte	28
	byte	12
	byte	76
	byte	76
	byte	run,3,92
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,33,184
	byte	248
	byte	248
	byte	168




