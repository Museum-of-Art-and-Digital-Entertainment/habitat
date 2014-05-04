;---------------------------------------
;
;	animation cel data
;

fortun_data::
	byte	both	+ 5
	byte	0b00000000
	byte	fortun_start_end - fortun_data
	byte	no_cont

	byte	244+right,24+left,255

	byte	0b11110000
	byte	0b11010000
	byte	0b11001000
	byte	0b00010000
	byte	0b01010000
	byte	0b00110000

	word	fortun_data_a - fortun_data
	word	fortun_data_b - fortun_data
	word	fortun_data_c - fortun_data
	word	fortun_data_d - fortun_data
	word	fortun_data_e - fortun_data

fortun_start_end:
	byte	0,0,1,1,2,2,3,3,4,4,5,5


fortun_data_a:
	byte	0x03, 0x03, 0x00, 0xe8, 0x00, 0x00

	byte	42
	byte	10
	byte	run,0x80+1
	byte	run,3,170
	byte	168
	byte	160
	byte	run,0x80+1




fortun_data_b:
	byte	cel_box + 0x01, 0x24, 0x01, 0x0c, 0x00, 0x00
	byte	0x28

fortun_data_c:
	byte	0x05, 0x10, 0xff, 0x0a, 0x00, 0x00

	byte	10
	byte	9
	byte	2
	byte	run,0x80+1
	byte	2
	byte	run,5,9
	byte	run,3,2
	byte	9
	byte	9
	byte	10
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,6,150
	byte	149
	byte	149
	byte	170
	byte	149
	byte	170
	byte	2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	235
	byte	255
	byte	239
	byte	239
	byte	255
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,6,150
	byte	86
	byte	86
	byte	170
	byte	86
	byte	170
	byte	128
	byte	160
	byte	96
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,5,96
	byte	run,3,128
	byte	96
	byte	96
	byte	160




fortun_data_d:
	byte	0x03, 0x0d, 0x00, 0x17, 0x00, 0x00

	byte	10
	byte	10
	byte	run,0x80+1
	byte	2
	byte	2
	byte	run,4,11
	byte	2
	byte	2
	byte	run,0x80+2
	byte	170
	byte	170
	byte	190
	byte	run,8,255
	byte	190
	byte	40
	byte	160
	byte	160
	byte	run,0x80+1
	byte	128
	byte	128
	byte	run,4,224
	byte	128
	byte	128
	byte	run,0x80+2




fortun_data_e:
	byte	0x03, 0x10, 0x00, 0x1c, 0x00, 0x00

	byte	run,0x80+5
	byte	run,9,2
	byte	run,0x80+2
	byte	170
	byte	170
	byte	190
	byte	170
	byte	run,5,190
	byte	170
	byte	255
	byte	255
	byte	190
	byte	170
	byte	170
	byte	40
	byte	run,0x80+5
	byte	run,9,128
	byte	run,0x80+2




