;---------------------------------------
;
;	animation cel data
;

sensor_data::
	byte	out	+ 2
	byte	0b00000000
	byte	sensor_start_end - sensor_data
	byte	no_cont

	byte	236+right,24+left,255

	byte	0b10000000
	byte	0b11000000
	byte	0b10100000

	word	sensor_data_a - sensor_data
	word	sensor_data_b - sensor_data
	word	sensor_data_c - sensor_data

sensor_start_end:
	byte	0,0,1,1,cycle+0,2


sensor_data_a:
	byte	0x02, 0x14, 0x01, 0x0a, 0x00, 0x00

	byte	run,5,42
	byte	run,4,10
	byte	3
	byte	2
	byte	2
	byte	11
	byte	11
	byte	47
	byte	170
	byte	2
	byte	2
	byte	11
	byte	2
	byte	run,5,160
	byte	run,4,128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	224
	byte	168
	byte	run,0x80+2
	byte	128
	byte	run,0x80+1




sensor_data_b:
	byte	cel_box + 0x01, 0x02, 0x01, 0xfc, 0x00, 0x00
	byte	0x03

sensor_data_c:
	byte	0x01, 0x07, 0x01, 0xfe, 0x00, 0x00

	byte	3
	byte	3
	byte	2
	byte	3
	byte	3
	byte	2
	byte	3




