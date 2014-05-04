;---------------------------------------
;
;	animation cel data
;

mag_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	mag_start_end - mag_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	mag_data_a - mag_data

mag_start_end:
	byte	0,0,0,0


mag_data_a:
	byte	0x03, 0x13, 0x00, 0xff, 0x00, 0x00

	byte	10
	byte	run,17,9
	byte	10
	byte	170
	byte	85
	byte	170
	byte	run,10,191
	byte	170
	byte	run,4,85
	byte	170
	byte	170
	byte	86
	byte	166
	byte	run,10,230
	byte	166
	byte	run,4,86
	byte	170




