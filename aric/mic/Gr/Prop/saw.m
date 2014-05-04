;---------------------------------------
;
;	animation cel data
;

saw_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	saw_start_end - saw_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000
	byte	0b10100000

	word	saw_data_a - saw_data
	word	saw_data_b - saw_data
	word	saw_data_c - saw_data

saw_start_end:
	byte	0,0,cycle+0,1


saw_data_a:
	byte	0x04, 0x0e, 0x00, 0xfe, 0x00, 0x00
	byte	run,0x80+2
	byte	2
	byte	run,10,9
	byte	run,3,2
	byte	160
	byte	88
	byte	150
	byte	166
	byte	138
	byte	130
	byte	130
	byte	162
	byte	162
	byte	106
	byte	86
	byte	168
	byte	160
	byte	160
	byte	128
	byte	170
	byte	90
	byte	101
	byte	run,5,149
	byte	101
	byte	90
	byte	170
	byte	run,0x80+3
	byte	160
	byte	88
	byte	150
	byte	run,5,102
	byte	150
	byte	86
	byte	168




saw_data_b:
	byte	0x03, 0x08, 0x04, 0xfe, 0x00, 0x00
	byte	34
	byte	170
	byte	255
	byte	239
	byte	239
	byte	255
	byte	170
	byte	34
	byte	34
	byte	170
	byte	run,4,255
	byte	170
	byte	34
	byte	32
	byte	160
	byte	250
	byte	248
	byte	250
	byte	248
	byte	162
	byte	32




saw_data_c:
	byte	0x03, 0x08, 0x04, 0xfe, 0x00, 0x00
	byte	136
	byte	170
	byte	255
	byte	239
	byte	239
	byte	255
	byte	170
	byte	136
	byte	136
	byte	170
	byte	run,4,255
	byte	170
	byte	136
	byte	136
	byte	160
	byte	248
	byte	250
	byte	248
	byte	250
	byte	160
	byte	136




