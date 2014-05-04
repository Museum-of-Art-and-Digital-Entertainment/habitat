;---------------------------------------
;
;	animation cel data
;

towel_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	towel_data_a - towel_data


towel_data_a:
	byte	0x03, 0x1f, 0x00, 0x05, 0x00, 0x00

	byte	170
	byte	run,3,149
	byte	170
	byte	149
	byte	170
	byte	170
	byte	run,22,149
	byte	42
	byte	170
	byte	run,3,85
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,22,85
	byte	170
	byte	128
	byte	168
	byte	run,3,152
	byte	168
	byte	152
	byte	168
	byte	168
	byte	run,21,152
	byte	160




