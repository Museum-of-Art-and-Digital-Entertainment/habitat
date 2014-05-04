;---------------------------------------
;
;	animation cel data
;

atm_data::
	byte	both	+ 1
	byte	0b00000000
	byte	atm_start_end - atm_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11100000
	byte	0b00100000

	word	atm_data_a - atm_data
	word	atm_data_b - atm_data
	word	atm_data_c - atm_data

atm_start_end:
	byte	0,0,1,1


atm_data_a:
	byte	0x04, 0x07, 0xff, 0xdf, 0x00, 0x00
	byte	2
	byte	2
	byte	run,0x80+5
	byte	170
	byte	170
	byte	63
	byte	10
	byte	2
	byte	2
	byte	run,0x80+1
	byte	170
	byte	170
	byte	255
	byte	run,3,170
	byte	252
	byte	170
	byte	170
	byte	240
	byte	128
	byte	run,0x80+3




atm_data_b:
	byte	cel_box + 0x01, 0x1b, 0x01, 0xfa, 0x00, 0x00
	byte	0xa8

atm_data_c:
	byte	0x05, 0x20, 0xff, 0x1a, 0x00, 0x00
	byte	42
	byte	run,5,170
	byte	191
	byte	186
	byte	186
	byte	run,6,187
	byte	186
	byte	186
	byte	run,3,187
	byte	186
	byte	186
	byte	run,6,185
	byte	186
	byte	186
	byte	191
	byte	42
	byte	run,6,170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	run,4,170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	171
	byte	255
	byte	170
	byte	170
	byte	run,6,85
	byte	170
	byte	170
	byte	255
	byte	run,7,170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	run,4,170
	byte	255
	byte	170
	byte	170
	byte	191
	byte	186
	byte	191
	byte	187
	byte	191
	byte	187
	byte	191
	byte	187
	byte	191
	byte	187
	byte	191
	byte	170
	byte	170
	byte	255
	byte	run,7,170
	byte	255
	byte	170
	byte	170
	byte	255
	byte	run,4,171
	byte	255
	byte	170
	byte	170
	byte	255
	byte	171
	byte	255
	byte	187
	byte	255
	byte	187
	byte	255
	byte	187
	byte	255
	byte	187
	byte	255
	byte	170
	byte	170
	byte	255
	byte	170
	byte	160
	byte	run,5,168
	byte	248
	byte	run,23,184
	byte	248
	byte	160




