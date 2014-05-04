;---------------------------------------
;
;	animation cel data
;

fgun1_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	fgun1_start_end - fgun1_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000

	word	fgun1_data_a - fgun1_data
	word	fgun1_data_b - fgun1_data

fgun1_start_end:
	byte	0,0,1,1


fgun1_data_a:
	byte	0x04, 0x0b, 0x00, 0xfe, 0x00, 0x00
	byte	run,4,5
	byte	1
	byte	1
	byte	run,0x80+2
	byte	1
	byte	1
	byte	run,0x80+1
	byte	80
	byte	80
	byte	64
	byte	84
	byte	81
	byte	81
	byte	run,3,85
	byte	21
	byte	run,0x80+7
	byte	64
	byte	80
	byte	85
	byte	85
	byte	run,0x80+9
	byte	80
	byte	80
	byte	16




fgun1_data_b:
	byte	0x06, 0x0d, 0x03, 0xfd, 0x00, 0x00
	byte	run,12,2
	byte	10
	byte	170
	byte	run,3,255
	byte	235
	byte	238
	byte	238
	byte	235
	byte	238
	byte	238
	byte	235
	byte	255
	byte	170
	byte	170
	byte	run,3,255
	byte	238
	byte	238
	byte	234
	byte	238
	byte	238
	byte	251
	byte	251
	byte	255
	byte	170
	byte	170
	byte	run,3,255
	byte	238
	byte	238
	byte	run,3,234
	byte	238
	byte	238
	byte	255
	byte	170
	byte	170
	byte	run,3,255
	byte	250
	byte	run,3,238
	byte	239
	byte	238
	byte	250
	byte	255
	byte	170
	byte	168
	byte	run,6,248
	byte	184
	byte	run,4,248
	byte	168




