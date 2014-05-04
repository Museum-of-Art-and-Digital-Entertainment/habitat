;---------------------------------------
;
;	animation cel data
;

flag_data::
	byte	out	+ 11
	byte	0b00001000
	byte	flag_start_end - flag_data
	byte	no_cont

	byte	236+right,20+left,255

	byte	0b11001000
	byte	0b11010000
	byte	0b11001000
	byte	0b11100000
	byte	0b11010000
	byte	0b11001000
	byte	0b11100000
	byte	0b11010000
	byte	0b11100000
	byte	0b11001000
	byte	0b11100000
	byte	0b11010000

	word	flag_data_a - flag_data
	word	flag_data_b - flag_data
	word	flag_data_c - flag_data
	word	flag_data_d - flag_data
	word	flag_data_e - flag_data

flag_start_end:
	byte	cycle+0,8,cycle+5,11,cycle+2,10


flag_data_a:
	byte	cel_box + 0x01, 0x4e, 0x01, 0x2f, 0x00, 0x00
	byte	0xb8

flag_data_b:
	byte	0x02, 0x04, 0x00, 0x33, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+2
	byte	254
	byte	254
	byte	184
	byte	32




flag_data_c:
	byte	0x04, 0x16, 0xfd, 0x2d, 0x00, 0x00
	byte	40
	byte	38
	byte	run,14,37
	byte	10
	byte	run,0x80+6
	byte	128
	byte	104
	byte	86
	byte	run,13,85
	byte	165
	byte	10
	byte	run,0x80+6
	byte	128
	byte	104
	byte	86
	byte	run,13,85
	byte	165
	byte	10
	byte	run,0x80+6
	byte	128
	byte	106
	byte	run,14,85
	byte	170




flag_data_d:
	byte	0x04, 0x10, 0xfd, 0x2d, 0x00, 0x00
	byte	170
	byte	run,14,149
	byte	170
	byte	170
	byte	run,14,85
	byte	170
	byte	170
	byte	run,14,85
	byte	170
	byte	170
	byte	run,14,85
	byte	170




flag_data_e:
	byte	0x04, 0x12, 0xfd, 0x2d, 0x00, 0x00
	byte	run,0x80+1
	byte	40
	byte	38
	byte	run,14,37
	byte	42
	byte	run,0x80+1
	byte	10
	byte	165
	byte	run,13,85
	byte	90
	byte	160
	byte	168
	byte	86
	byte	run,13,85
	byte	169
	byte	2
	byte	run,0x80+2
	byte	128
	byte	106
	byte	run,13,85
	byte	149
	byte	42




