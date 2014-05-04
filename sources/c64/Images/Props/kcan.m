;---------------------------------------
;
;	animation cel data
;

kcan_data::
	byte	both	+ 1
	byte	0b11111000
	byte	kcan_start_end - kcan_data
	byte	no_cont

	byte	240+right,240+right,255

	byte	0b11010000
	byte	0b10101000

	word	kcan_data_a - kcan_data
	word	kcan_data_b - kcan_data
	word	kcan_data_c - kcan_data
	word	kcan_data_d - kcan_data
	word	kcan_data_e - kcan_data

kcan_start_end:
	byte	0,0,1,1


kcan_data_a:
	byte	0x03, 0x1a, 0x00, 0xfb, 0x00, 0x00
	byte	170
	byte	run,23,149
	byte	170
	byte	42
	byte	170
	byte	run,23,85
	byte	run,3,170
	byte	run,23,86
	byte	170
	byte	168




kcan_data_b:
	byte	0x03, 0x05, 0x00, 0xfe, 0x00, 0x00
	byte	170
	byte	149
	byte	149
	byte	37
	byte	42
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	86
	byte	86
	byte	88
	byte	168




kcan_data_c:
	byte	0x01, 0x14, 0x03, 0x0d, 0x00, 0x00
	byte	160
	byte	168
	byte	152
	byte	run,14,150
	byte	152
	byte	152
	byte	160




kcan_data_d:
	byte	0x01, 0x04, 0xff, 0xe7, 0x00, 0x00
	byte	170
	byte	149
	byte	150
	byte	40




kcan_data_e:
	byte	0x01, 0x04, 0xff, 0xe5, 0x00, 0x00
	byte	170
	byte	149
	byte	150
	byte	40




