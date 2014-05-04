;---------------------------------------
;
;	animation cel data
;

banner_data::
	byte	out	+ 6
	byte	0b00111100
	byte	banner_start_end - banner_data
	byte	no_cont

	byte	8+right,8+right,255

	byte	0b11100100
	byte	0b01100100
	byte	0b11110100
	byte	0b11111100
	byte	0b00100100
	byte	0b00110100
	byte	0b00111100

	word	banner_data_a - banner_data
	word	banner_data_b - banner_data
	word	banner_data_c - banner_data
	word	banner_data_d - banner_data
	word	banner_data_e - banner_data
	word	banner_data_f - banner_data

banner_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5,6,6


banner_data_a:
	byte	cel_box + 0x01, 0x0e, 0xf9, 0xf5, 0x00, 0x00
	byte	0x2e

banner_data_b:
	byte	0x02, 0x63, 0xf9, 0x58, 0x00, 0x00
	byte	run,86,46
	byte	42
	byte	42
	byte	170
	byte	191
	byte	191
	byte	42
	byte	46
	byte	run,4,191
	byte	46
	byte	8
	byte	run,0x80+88
	byte	run,3,128
	byte	run,0x80+2
	byte	run,4,128
	byte	run,0x80+2




banner_data_c:
	byte	0x02, 0x0e, 0xfa, 0x48, 0x00, 0x00
	byte	run,0x80+4
	byte	run,5,2
	byte	9
	byte	9
	byte	37
	byte	42
	byte	128
	byte	run,4,149
	byte	run,7,85
	byte	86
	byte	168
	byte	run,0x80+1




banner_data_d:
	byte	cel_box + 0x01, 0x17, 0xfb, 0x3a, 0x00, 0xe9
	byte	0x95

banner_data_e:
	byte	cel_box + 0x01, 0x17, 0xfb, 0x3a, 0x00, 0xe9
	byte	0x95

banner_data_f:
	byte	0x02, 0x0c, 0xfa, 0x3a, 0x00, 0x00
	byte	128
	byte	42
	byte	37
	byte	9
	byte	9
	byte	run,4,2
	byte	run,0x80+3
	byte	42
	byte	169
	byte	run,7,85
	byte	run,3,149




