;---------------------------------------
;
;	animation cel data
;

bridgef_data::
	byte	swing	+ 4
	byte	0b10100000
	byte	bridgef_start_end - bridgef_data
	byte	no_cont

	byte	16+right,24+left,255

	byte	0b11100000
	byte	0b10000000
	byte	0b01000000
	byte	0b00100000
	byte	0b11000000

	word	bridgef_data_a - bridgef_data
	word	bridgef_data_b - bridgef_data
	word	bridgef_data_c - bridgef_data

bridgef_start_end:
	byte	0,0,1,1,2,2,3,3,4,4


bridgef_data_a:
	byte	0x02, 0x19, 0xfb, 0x22, 0x00, 0x00

	byte	170
	byte	run,20,150
	byte	170
	byte	150
	byte	150
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	run,9,128
	byte	run,0x80+1




bridgef_data_b:
	byte	0x06, 0x0f, 0xfd, 0x18, 0x00, 0x00

	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170




bridgef_data_c:
	byte	0x02, 0x19, 0x03, 0x22, 0x00, 0x00

	byte	170
	byte	run,4,255
	byte	170
	byte	run,3,255
	byte	170
	byte	255
	byte	255
	byte	170
	byte	255
	byte	170
	byte	run,9,2
	byte	run,0x80+1
	byte	170
	byte	run,20,150
	byte	170
	byte	150
	byte	150
	byte	170




