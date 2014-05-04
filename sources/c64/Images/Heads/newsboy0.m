;---------------------------------------
;
;	animation cel data
;

newsboy0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	newsboy0_start_end - newsboy0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	newsboy0_data_a - newsboy0_data
	word	newsboy0_data_b - newsboy0_data
	word	newsboy0_data_c - newsboy0_data

newsboy0_start_end:
	byte	0,0,1,1,0,0,2,2


newsboy0_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+10
	byte	run,3,2
	byte	10
	byte	9
	byte	run,5,37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	run,4,47
	byte	46
	byte	170
	byte	170
	byte	run,4,171
	byte	170
	byte	90
	byte	run,3,86
	byte	run,3,85
	byte	165
	byte	9
	byte	2
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	238
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	171
	byte	175
	byte	175
	byte	107
	byte	155
	byte	150
	byte	165
	byte	105
	byte	86
	byte	85
	byte	150
	byte	40
	byte	run,0x80+5
	byte	128
	byte	run,4,224
	byte	248
	byte	248
	byte	240
	byte	176
	byte	224
	byte	160
	byte	224
	byte	224
	byte	160
	byte	168
	byte	168
	byte	88
	byte	160
	byte	128
	byte	run,0x80+2




newsboy0_data_b:
	byte	0x05, 0x1a, 0xfe, 0x03, 0x00, 0x00
	byte	run,0x80+12
	byte	2
	byte	10
	byte	run,4,9
	byte	run,3,2
	byte	run,0x80+5
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	174
	byte	175
	byte	175
	byte	111
	byte	107
	byte	90
	byte	101
	byte	154
	byte	149
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	187
	byte	254
	byte	187
	byte	run,3,255
	byte	170
	byte	85
	byte	86
	byte	169
	byte	85
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	250
	byte	250
	byte	run,3,234
	byte	169
	byte	169
	byte	150
	byte	102
	byte	152
	byte	88
	byte	96
	byte	128
	byte	run,0x80+17
	byte	run,3,128
	byte	run,0x80+7




newsboy0_data_c:
	byte	0x03, 0x12, 0xff, 0x00, 0x00, 0x00
	byte	10
	byte	run,3,46
	byte	run,3,170
	byte	165
	byte	149
	byte	run,7,85
	byte	149
	byte	149
	byte	254
	byte	254
	byte	238
	byte	run,3,170
	byte	run,9,85
	byte	101
	byte	85
	byte	85
	byte	128
	byte	run,3,224
	byte	168
	byte	168
	byte	104
	byte	88
	byte	run,8,84
	byte	88
	byte	88




