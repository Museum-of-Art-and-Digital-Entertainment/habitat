;---------------------------------------
;
;	animation cel data
;

doctor0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	doctor0_start_end - doctor0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	doctor0_data_a - doctor0_data
	word	doctor0_data_b - doctor0_data
	word	doctor0_data_c - doctor0_data

doctor0_start_end:
	byte	0,0,1,1,0,0,2,2


doctor0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	171
	byte	170
	byte	170
	byte	85
	byte	170
	byte	170
	byte	run,3,171
	byte	run,5,170
	byte	85
	byte	170
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	229
	byte	229
	byte	149
	byte	85
	byte	85
	byte	170
	byte	run,3,255
	byte	239
	byte	run,3,175
	byte	171
	byte	170
	byte	85
	byte	170
	byte	85
	byte	86
	byte	168
	byte	run,0x80+4
	byte	128
	byte	run,4,96
	byte	160
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	224
	byte	160
	byte	232
	byte	168
	byte	168
	byte	136
	byte	136
	byte	8
	byte	run,0x80+1




doctor0_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	170
	byte	run,4,191
	byte	175
	byte	171
	byte	174
	byte	175
	byte	170
	byte	37
	byte	42
	byte	41
	byte	10
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	86
	byte	run,4,85
	byte	170
	byte	255
	byte	239
	byte	255
	byte	255
	byte	187
	byte	255
	byte	186
	byte	255
	byte	170
	byte	89
	byte	169
	byte	86
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	96
	byte	96
	byte	168
	byte	run,4,248
	byte	232
	byte	168
	byte	232
	byte	168
	byte	88
	byte	86
	byte	86
	byte	88
	byte	160
	byte	run,0x80+1




doctor0_data_c:
	byte	0x03, 0x12, 0xff, 0xff, 0x00, 0x00
	byte	2
	byte	10
	byte	10
	byte	42
	byte	37
	byte	run,10,170
	byte	37
	byte	42
	byte	37
	byte	run,4,170
	byte	85
	byte	run,10,170
	byte	85
	byte	170
	byte	85
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	96
	byte	run,10,168
	byte	96
	byte	160
	byte	96




