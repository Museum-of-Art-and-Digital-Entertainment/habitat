;---------------------------------------
;
;	animation cel data
;

chef0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	chef0_start_end - chef0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	chef0_data_a - chef0_data
	word	chef0_data_b - chef0_data
	word	chef0_data_c - chef0_data

chef0_start_end:
	byte	0,0,1,1,0,0,2,2


chef0_data_a:
	byte	0x05, 0x22, 0xff, 0x0c, 0x00, 0x00
	byte	run,0x80+22
	byte	2
	byte	9
	byte	9
	byte	run,3,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+10
	byte	run,12,2
	byte	9
	byte	9
	byte	37
	byte	169
	byte	86
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,3,170
	byte	86
	byte	run,6,85
	byte	149
	byte	102
	byte	89
	byte	85
	byte	85
	byte	149
	byte	37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	254
	byte	250
	byte	250
	byte	254
	byte	239
	byte	run,3,175
	byte	171
	byte	107
	byte	90
	byte	85
	byte	85
	byte	86
	byte	86
	byte	104
	byte	150
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,4,224
	byte	run,3,168
	byte	254
	byte	190
	byte	254
	byte	248
	byte	160
	byte	run,3,224
	byte	run,3,128
	byte	run,0x80+4
	byte	128
	byte	96
	byte	run,3,88
	byte	160
	byte	run,0x80+2




chef0_data_b:
	byte	0x05, 0x22, 0xfe, 0x0b, 0x00, 0x00
	byte	run,0x80+11
	byte	run,6,2
	byte	run,0x80+6
	byte	10
	byte	run,4,37
	byte	run,3,9
	byte	2
	byte	run,0x80+2
	byte	3
	byte	run,3,2
	byte	10
	byte	47
	byte	191
	byte	191
	byte	190
	byte	190
	byte	186
	byte	251
	byte	254
	byte	239
	byte	run,4,175
	byte	171
	byte	42
	byte	run,4,37
	byte	170
	byte	101
	byte	run,5,85
	byte	86
	byte	168
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	239
	byte	171
	byte	255
	byte	170
	byte	170
	byte	254
	byte	255
	byte	254
	byte	255
	byte	255
	byte	187
	byte	run,3,255
	byte	170
	byte	run,4,85
	byte	169
	byte	86
	byte	run,4,85
	byte	165
	byte	9
	byte	2
	byte	run,0x80+5
	byte	128
	byte	224
	byte	run,4,248
	byte	184
	byte	190
	byte	254
	byte	238
	byte	run,3,234
	byte	168
	byte	168
	byte	160
	byte	run,4,96
	byte	106
	byte	149
	byte	run,6,85
	byte	86
	byte	168
	byte	run,0x80+25
	byte	128
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+2




chef0_data_c:
	byte	0x03, 0x10, 0xff, 0xfd, 0x00, 0x00
	byte	10
	byte	10
	byte	run,12,170
	byte	169
	byte	5
	byte	run,13,170
	byte	86
	byte	85
	byte	85
	byte	128
	byte	128
	byte	run,13,168
	byte	64




