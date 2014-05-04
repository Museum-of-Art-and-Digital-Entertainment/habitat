;---------------------------------------
;
;	animation cel data
;

bookf_data::
	byte	swing	+ 0
	byte	0b11000000
	byte	bookf_start_end - bookf_data
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b10000000

	word	bookf_data_a - bookf_data

bookf_start_end:
	byte	0,0,0,0


bookf_data_a:
	byte	0x04, 0x19, 0x00, 0x04, 0x00, 0x00

	byte	run,25,2
	byte	170
	byte	run,3,101
	byte	165
	byte	229
	byte	run,13,101
	byte	165
	byte	229
	byte	run,3,101
	byte	170
	byte	170
	byte	run,23,85
	byte	170
	byte	170
	byte	run,23,86
	byte	170




