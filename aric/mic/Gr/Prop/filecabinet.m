;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

filecabinet_data::
	byte	both	+ 1
	byte	0b11100000
	byte	filecabinet_start_end - filecabinet_data
	byte	no_cont

	byte	252+right,32+left,252

	byte	0b10100000
	byte	0b11100000

	word	filecabinet_data_a - filecabinet_data
	word	filecabinet_data_b - filecabinet_data
	word	filecabinet_data_c - filecabinet_data

filecabinet_start_end:
	byte	0,0,1,1


filecabinet_data_a:
	byte	0x06, 0x1e, 0xfc, 0x12, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	9
	byte	37
	byte	run,20,149
	byte	150
	byte	153
	byte	165
	byte	170
	byte	10
	byte	41
	byte	153
	byte	run,20,89
	byte	90
	byte	101
	byte	149
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	run,20,170
	byte	85
	byte	170
	byte	run,5,85
	byte	170
	byte	170
	byte	85
	byte	run,20,170
	byte	85
	byte	170
	byte	run,5,85
	byte	170
	byte	170
	byte	85
	byte	run,20,170
	byte	85
	byte	170
	byte	run,3,85
	byte	86
	byte	88
	byte	160
	byte	170
	byte	86
	byte	run,20,166
	byte	86
	byte	170
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3




filecabinet_data_b:
	byte	0x01, 0x0d, 0xfe, 0x00, 0x01, 0xfc
	byte	2
	byte	9
	byte	37
	byte	22
	byte	25
	byte	37
	byte	run,4,21
	byte	22
	byte	26
	byte	42




filecabinet_data_c:
	byte	0x04, 0x14, 0xfe, 0x0a, 0x00, 0x00
	byte	170
	byte	run,18,149
	byte	170
	byte	170
	byte	run,3,85
	byte	106
	byte	170
	byte	191
	byte	170
	byte	85
	byte	85
	byte	106
	byte	111
	byte	111
	byte	106
	byte	run,5,85
	byte	170
	byte	170
	byte	run,3,85
	byte	149
	byte	165
	byte	229
	byte	165
	byte	85
	byte	85
	byte	run,4,149
	byte	run,5,85
	byte	170
	byte	160
	byte	run,18,96
	byte	160




