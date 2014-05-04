;---------------------------------------
;
;	animation cel data
;

bozo0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	bozo0_start_end - bozo0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	bozo0_data_a - bozo0_data
	word	bozo0_data_b - bozo0_data
	word	bozo0_data_c - bozo0_data

bozo0_start_end:
	byte	0,0,1,1,0,0,2,2


bozo0_data_a:
	byte	0x06, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+12
	byte	2
	byte	2
	byte	run,3,9
	byte	10
	byte	run,0x80+12
	byte	2
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,5,85
	byte	170
	byte	2
	byte	2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	90
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	90
	byte	85
	byte	85
	byte	170
	byte	255
	byte	255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	111
	byte	111
	byte	175
	byte	run,4,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,5,224
	byte	226
	byte	233
	byte	run,3,229
	byte	233
	byte	226
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+12
	byte	128
	byte	run,3,96
	byte	128
	byte	run,0x80+9




bozo0_data_b:
	byte	0x06, 0x18, 0xfd, 0x01, 0x00, 0x00
	byte	run,0x80+15
	byte	run,3,2
	byte	run,0x80+15
	byte	2
	byte	9
	byte	37
	byte	37
	byte	149
	byte	149
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	175
	byte	111
	byte	191
	byte	run,3,190
	byte	run,4,111
	byte	175
	byte	run,3,47
	byte	11
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,4,255
	byte	239
	byte	155
	byte	run,3,86
	byte	155
	byte	239
	byte	run,7,255
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	232
	byte	230
	byte	run,4,249
	byte	run,4,229
	byte	234
	byte	run,3,224
	byte	128
	byte	run,0x80+11
	byte	128
	byte	96
	byte	96
	byte	88
	byte	88
	byte	run,3,86
	byte	168
	byte	run,0x80+5




bozo0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+1
	byte	1
	byte	1
	byte	5
	byte	21
	byte	run,9,85
	byte	170
	byte	84
	byte	run,13,85
	byte	170
	byte	run,0x80+3
	byte	64
	byte	80
	byte	80
	byte	run,8,84
	byte	170




