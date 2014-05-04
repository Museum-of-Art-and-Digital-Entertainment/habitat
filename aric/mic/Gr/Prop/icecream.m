;---------------------------------------
;
;	animation cel data
;

icecream_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	icecream_start_end - icecream_data
	byte	no_cont

	byte	240+right,36+left,1

	byte	0b11000000
	byte	0b11100000

	word	icecream_data_a - icecream_data
	word	icecream_data_b - icecream_data
	word	icecream_data_c - icecream_data

icecream_start_end:
	byte	0,0,1,1


icecream_data_a:
	byte	0x02, 0x0b, 0x00, 0xfe, 0x00, 0x00
	byte	run,0x80+1
	byte	run,6,2
	byte	10
	byte	11
	byte	11
	byte	10
	byte	160
	byte	run,5,248
	byte	168
	byte	250
	byte	254
	byte	254
	byte	170




icecream_data_b:
	byte	0x02, 0x08, 0x00, 0x05, 0x00, 0x00
	byte	2
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+1
	byte	168
	byte	88
	byte	run,4,86
	byte	88
	byte	160




icecream_data_c:
	byte	0x02, 0x08, 0x00, 0x0a, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	run,4,9
	byte	2
	byte	run,0x80+1
	byte	160
	byte	88
	byte	run,4,86
	byte	88
	byte	160




