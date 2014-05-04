;---------------------------------------
;
;	animation cel data
;

cafechair_data::
	byte	both	+ 1
	byte	0b11100000
	byte	cafechair_start_end - cafechair_data
	byte	cafechair_contents_xy - cafechair_data

	byte	24+left,24+left,255

	byte	0b11000000
	byte	0b10100000

	word	cafechair_data_a - cafechair_data
	word	cafechair_data_b - cafechair_data
	word	cafechair_data_c - cafechair_data

cafechair_start_end:
	byte	0,0,1,1

cafechair_contents_xy:
	byte	254,4


cafechair_data_a:
	byte	0x05, 0x1b, 0xfd, 0xfd, 0x00, 0x00
	byte	128
	byte	32
	byte	34
	byte	run,6,32
	byte	run,7,8
	byte	10
	byte	run,5,8
	byte	42
	byte	run,3,37
	byte	10
	byte	run,0x80+3
	byte	run,7,128
	byte	run,7,32
	byte	160
	byte	160
	byte	32
	byte	32
	byte	40
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+21
	byte	2
	byte	170
	byte	run,3,85
	byte	170
	byte	run,0x80+2
	byte	8
	byte	run,6,32
	byte	34
	byte	run,6,130
	byte	138
	byte	162
	byte	162
	byte	run,3,130
	byte	170
	byte	run,3,85
	byte	170
	byte	32
	byte	run,8,128
	byte	run,0x80+13
	byte	run,4,128
	byte	run,0x80+1




cafechair_data_b:
	byte	0x01, 0x1f, 0xfd, 0x1c, 0x00, 0x00
	byte	10
	byte	run,3,8
	byte	run,6,32
	byte	40
	byte	run,19,38
	byte	40




cafechair_data_c:
	byte	0x04, 0x1f, 0xfd, 0x1c, 0x00, 0x00
	byte	run,0x80+8
	byte	run,4,2
	byte	run,3,8
	byte	run,3,10
	byte	run,5,9
	byte	run,3,2
	byte	run,0x80+5
	byte	run,4,32
	byte	run,3,128
	byte	130
	byte	2
	byte	2
	byte	10
	byte	10
	byte	37
	byte	149
	byte	149
	byte	run,11,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	run,0x80+1
	byte	run,7,160
	byte	run,3,8
	byte	170
	byte	90
	byte	run,17,85
	byte	90
	byte	160
	byte	run,4,128
	byte	run,4,32
	byte	run,4,8
	byte	130
	byte	98
	byte	98
	byte	run,3,90
	byte	run,5,86
	byte	run,3,88
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




