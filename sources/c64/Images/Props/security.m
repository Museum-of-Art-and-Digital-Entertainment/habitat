;---------------------------------------
;
;	animation cel data
;

security_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	security_start_end - security_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000

	word	security_data_a - security_data
	word	security_data_b - security_data

security_start_end:
	byte	0,0,1,1,cycle+0,1


security_data_a:
	byte	0x03, 0x16, 0x00, 0x0d, 0x00, 0x00

	byte	10
	byte	10
	byte	2
	byte	run,0x80+10
	byte	2
	byte	run,5,11
	byte	2
	byte	run,0x80+2
	byte	run,5,170
	byte	40
	byte	170
	byte	255
	byte	40
	byte	170
	byte	255
	byte	40
	byte	190
	byte	run,7,255
	byte	190
	byte	40
	byte	160
	byte	160
	byte	128
	byte	run,0x80+10
	byte	128
	byte	run,5,224
	byte	128
	byte	run,0x80+2




security_data_b:
	byte	0x01, 0x03, 0x01, 0xfd, 0x00, 0x00

	byte	60
	byte	60
	byte	40




