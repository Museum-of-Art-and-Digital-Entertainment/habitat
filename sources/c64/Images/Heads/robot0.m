;---------------------------------------
;
;	animation cel data
;

robot0_data::
	byte	swing	+ 3
	byte	0b00000000
	byte	robot0_start_end - robot0_data
	byte	no_cont+1

	byte	244+right,28+left,255

	byte	0b10001000
	byte	0b10011000
	byte	0b01000100
	byte	0b01100100

	word	robot0_data_a - robot0_data
	word	robot0_data_b - robot0_data
	word	robot0_data_c - robot0_data
	word	robot0_data_d - robot0_data
	word	robot0_data_e - robot0_data
	word	robot0_data_f - robot0_data

robot0_start_end:
	byte	cycle+0,1,cycle+2,3,2,2,cycle+2,3


robot0_data_a:
	byte	0x02, 0x0c, 0x01, 0xf6, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	42
	byte	11
	byte	42
	byte	11
	byte	42
	byte	11
	byte	42
	byte	2
	byte	10
	byte	2
	byte	40
	byte	184
	byte	248
	byte	224
	byte	168
	byte	224
	byte	168
	byte	224
	byte	168
	byte	128
	byte	160
	byte	128




robot0_data_b:
	byte	0x03, 0x0c, 0xff, 0xf6, 0x00, 0x00
	byte	run,3,11
	byte	2
	byte	10
	byte	2
	byte	10
	byte	2
	byte	10
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	run,3,255
	byte	254
	byte	170
	byte	254
	byte	170
	byte	254
	byte	170
	byte	168
	byte	170
	byte	168
	byte	run,3,128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+1
	byte	128
	byte	run,0x80+3




robot0_data_c:
	byte	0x05, 0x02, 0xfe, 0xff, 0x00, 0x00
	byte	5
	byte	1
	byte	64
	byte	run,0x80+1
	byte	84
	byte	16
	byte	5
	byte	1
	byte	64
	byte	run,0x80+1




robot0_data_d:
	byte	0x04, 0x02, 0x00, 0xff, 0x00, 0x00
	byte	21
	byte	4
	byte	5
	byte	1
	byte	80
	byte	64
	byte	84
	byte	16




robot0_data_e:
	byte	0x06, 0x0b, 0xff, 0x01, 0x00, 0x00
	byte	10
	byte	32
	byte	run,7,128
	byte	32
	byte	10
	byte	170
	byte	run,0x80+4
	byte	10
	byte	8
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,4,2
	byte	170
	byte	10
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,4,128
	byte	170
	byte	160
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,0x80+4
	byte	160
	byte	32
	byte	run,0x80+3
	byte	170
	byte	160
	byte	8
	byte	run,7,2
	byte	8
	byte	160




robot0_data_f:
	byte	0x07, 0x0b, 0xfd, 0x01, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	run,7,8
	byte	2
	byte	run,0x80+1
	byte	170
	byte	run,0x80+4
	byte	2
	byte	2
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,0x80+4
	byte	170
	byte	run,0x80+4
	byte	170
	byte	170
	byte	run,4,32
	byte	170
	byte	168
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,0x80+4
	byte	170
	byte	2
	byte	run,0x80+3
	byte	170
	byte	170
	byte	run,0x80+9
	byte	170
	byte	run,0x80+1
	byte	128
	byte	run,7,32
	byte	128
	byte	run,0x80+1




