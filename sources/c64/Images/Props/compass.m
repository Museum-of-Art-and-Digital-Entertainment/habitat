;---------------------------------------
;
;	animation cel data
;

compass_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	compass_start_end - compass_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000
	byte	0b10100000
	byte	0b10010000
	byte	0b10001000

	word	compass_data_a - compass_data
	word	compass_data_b - compass_data
	word	compass_data_c - compass_data
	word	compass_data_d - compass_data
	word	compass_data_e - compass_data

compass_start_end:
	byte	0,0,1,1,2,2,3,3,cycle+0,3


compass_data_a:
	byte	0x03, 0x09, 0x00, 0x02, 0x00, 0x00

	byte	2
	byte	run,7,9
	byte	2
	byte	170
	byte	run,3,85
	byte	101
	byte	run,3,85
	byte	170
	byte	run,0x80+1
	byte	run,7,128
	byte	run,0x80+1




compass_data_b:
	byte	cel_box + 0x01, 0x02, 0x01, 0x00, 0x00, 0x00
	byte	0x20

compass_data_c:
	byte	cel_box + 0x01, 0x01, 0x01, 0xfe, 0x00, 0x00
	byte	0x08

compass_data_d:
	byte	cel_box + 0x01, 0x02, 0x01, 0xfd, 0x00, 0x00
	byte	0x20

compass_data_e:
	byte	cel_box + 0x01, 0x01, 0x01, 0xfe, 0x00, 0x00
	byte	0x80

