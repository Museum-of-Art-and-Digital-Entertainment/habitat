;---------------------------------------
;
;	animation cel data
;

head1_data::
	byte	swing	+ 2
	byte	0b11000000
	byte	head1_start_end - head1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	head1_data_a - head1_data
	word	head1_data_b - head1_data
	word	head1_data_c - head1_data

head1_start_end:
	byte	0,0,1,1,0,0,2,2


head1_data_a:
	byte	0x04, 0x19, 0x00, 0x02, 0x00, 0x00
	byte	10
	byte	run,21,9
	byte	2
	byte	2
	byte	run,0x80+2
	byte	128
	byte	175
	byte	106
	byte	run,6,86
	byte	run,3,91
	byte	86
	byte	86
	byte	run,9,85
	byte	170
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,8,255
	byte	191
	byte	191
	byte	111
	byte	91
	byte	86
	byte	run,3,85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	run,5,224
	byte	160
	byte	96
	byte	96
	byte	128
	byte	run,0x80+2




head1_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+4
	byte	run,14,2
	byte	run,0x80+7
	byte	3
	byte	2
	byte	10
	byte	165
	byte	86
	byte	91
	byte	107
	byte	run,10,111
	byte	107
	byte	154
	byte	149
	byte	149
	byte	37
	byte	41
	byte	10
	byte	2
	byte	255
	byte	254
	byte	254
	byte	170
	byte	254
	byte	run,13,255
	byte	170
	byte	run,5,85
	byte	170
	byte	run,0x80+2
	byte	128
	byte	104
	byte	86
	byte	150
	byte	150
	byte	run,10,230
	byte	166
	byte	152
	byte	88
	byte	104
	byte	96
	byte	160
	byte	128
	byte	run,0x80+1




head1_data_c:
	byte	0x03, 0x04, 0xff, 0xf2, 0x00, 0x00
	byte	run,8,85
	byte	run,4,84




