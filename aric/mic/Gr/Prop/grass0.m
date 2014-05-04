;---------------------------------------
;
;	animation cel data
;

grass0_data::
	byte	swing	+ 2
	byte	0b11000000
	byte	grass0_start_end - grass0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b11000000
	byte	0b10000000
	byte	0b01000000

	word	grass0_data_a - grass0_data
	word	grass0_data_b - grass0_data

grass0_start_end:
	byte	0,0,1,1,2,2


grass0_data_a:
	byte	0x03, 0x2c, 0xfd, 0x2e, 0x00, 0x00
	byte	run,0x80+7
	byte	run,6,1
	byte	run,5,4
	byte	run,3,16
	byte	64
	byte	run,0x80+1
	byte	1
	byte	1
	byte	4
	byte	4
	byte	16
	byte	run,0x80+1
	byte	1
	byte	1
	byte	4
	byte	16
	byte	run,0x80+11
	byte	68
	byte	68
	byte	run,5,69
	byte	5
	byte	5
	byte	run,3,17
	byte	run,4,20
	byte	run,6,68
	byte	80
	byte	16
	byte	17
	byte	17
	byte	65
	byte	65
	byte	68
	byte	run,3,4
	byte	16
	byte	16
	byte	17
	byte	65
	byte	4
	byte	4
	byte	16
	byte	run,0x80+2
	byte	1
	byte	1
	byte	4
	byte	run,0x80+4
	byte	68
	byte	68
	byte	run,18,69
	byte	5
	byte	run,6,17
	byte	65
	byte	68
	byte	68
	byte	4
	byte	run,3,16
	byte	run,3,64
	byte	run,0x80+3




grass0_data_b:
	byte	0x07, 0x0f, 0x00, 0x18, 0x00, 0x00
	byte	run,0x80+2
	byte	run,7,20
	byte	17
	byte	17
	byte	run,3,4
	byte	1
	byte	4
	byte	run,6,69
	byte	68
	byte	65
	byte	17
	byte	run,0x80+1
	byte	64
	byte	64
	byte	16
	byte	run,0x80+1
	byte	1
	byte	run,5,17
	byte	4
	byte	68
	byte	17
	byte	run,0x80+1
	byte	64
	byte	run,0x80+5
	byte	run,5,20
	byte	68
	byte	68
	byte	17
	byte	run,0x80+6
	byte	16
	byte	run,5,84
	byte	68
	byte	64
	byte	16
	byte	run,0x80+6
	byte	64
	byte	81
	byte	81
	byte	65
	byte	65
	byte	17
	byte	1
	byte	run,0x80+9
	byte	run,4,16
	byte	run,0x80+2
	byte	64
	byte	run,0x80+7




