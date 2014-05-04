;---------------------------------------
;
;	animation cel data
;

head4_data::
	byte	swing	+ 1
	byte	0b01000000
	byte	head4_start_end - head4_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	head4_data_a - head4_data
	word	head4_data_b - head4_data

head4_start_end:
	byte	0,0,1,1,0,0,1,1


head4_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+4
	byte	5
	byte	run,5,37
	byte	149
	byte	85
	byte	85
	byte	90
	byte	run,4,89
	byte	90
	byte	run,5,85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	80
	byte	88
	byte	88
	byte	90
	byte	101
	byte	101
	byte	run,3,149
	byte	run,4,85
	byte	149
	byte	149
	byte	run,7,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,96
	byte	104
	byte	88
	byte	88
	byte	run,7,96
	byte	128
	byte	128
	byte	run,0x80+2




head4_data_b:
	byte	0x03, 0x16, 0xff, 0x00, 0x00, 0x00
	byte	run,0x80+1
	byte	run,3,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	run,4,149
	byte	165
	byte	run,6,37
	byte	9
	byte	9
	byte	2
	byte	252
	byte	238
	byte	154
	byte	86
	byte	run,17,85
	byte	170
	byte	run,0x80+4
	byte	128
	byte	128
	byte	96
	byte	96
	byte	run,4,88
	byte	104
	byte	run,6,96
	byte	128
	byte	128
	byte	run,0x80+1




