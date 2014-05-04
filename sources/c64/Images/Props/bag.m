;---------------------------------------
;
;	animation cel data
;

bag_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	bag_start_end - bag_data
	byte	no_cont

	byte	240+right,20+left,255

	byte	0b11010000
	byte	0b10110000

	word	bag_data_a - bag_data
	word	bag_data_b - bag_data
	word	bag_data_c - bag_data
	word	bag_data_d - bag_data

bag_start_end:
	byte	0,0,1,1


bag_data_a:
	byte	0x02, 0x01, 0x00, 0xe5, 0x00, 0x00

	byte	42
	byte	128




bag_data_b:
	byte	0x02, 0x0f, 0x00, 0xf4, 0x00, 0xfc

	byte	37
	byte	run,8,149
	byte	run,6,37
	byte	run,12,96
	byte	run,3,128




bag_data_c:
	byte	0x04, 0x13, 0xff, 0xf8, 0x00, 0x00

	byte	2
	byte	9
	byte	37
	byte	37
	byte	run,5,149
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	2
	byte	run,0x80+3
	byte	149
	byte	run,15,85
	byte	149
	byte	149
	byte	37
	byte	104
	byte	run,3,86
	byte	run,4,85
	byte	run,4,86
	byte	run,5,88
	byte	96
	byte	96
	byte	run,0x80+4
	byte	run,4,128
	byte	run,0x80+11




bag_data_d:
	byte	0x02, 0x09, 0x00, 0x01, 0x00, 0x00

	byte	run,4,9
	byte	37
	byte	37
	byte	38
	byte	42
	byte	42
	byte	96
	byte	96
	byte	88
	byte	88
	byte	86
	byte	106
	byte	170
	byte	160
	byte	128




