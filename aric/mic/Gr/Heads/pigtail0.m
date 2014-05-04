;---------------------------------------
;
;	animation cel data
;

pigtail0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	pigtail0_start_end - pigtail0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01000000
	byte	0b01100000

	word	pigtail0_data_a - pigtail0_data
	word	pigtail0_data_b - pigtail0_data
	word	pigtail0_data_c - pigtail0_data
	word	pigtail0_data_d - pigtail0_data

pigtail0_start_end:
	byte	0,0,1,1,0,0,2,2


pigtail0_data_a:
	byte	0x03, 0x18, 0x01, 0x02, 0x00, 0x00
	byte	run,0x80+1
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	154
	byte	85
	byte	85
	byte	86
	byte	run,4,91
	byte	86
	byte	run,6,85
	byte	149
	byte	37
	byte	10
	byte	40
	byte	184
	byte	248
	byte	248
	byte	250
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	238
	byte	171
	byte	110
	byte	111
	byte	107
	byte	91
	byte	86
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	224
	byte	216
	byte	224
	byte	184
	byte	248
	byte	254
	byte	238
	byte	168
	byte	248
	byte	248
	byte	160
	byte	224
	byte	224
	byte	160
	byte	88
	byte	88
	byte	96
	byte	128




pigtail0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+3
	byte	2
	byte	9
	byte	2
	byte	run,0x80+1
	byte	run,13,2
	byte	run,0x80+4
	byte	3
	byte	2
	byte	2
	byte	130
	byte	98
	byte	90
	byte	171
	byte	111
	byte	111
	byte	110
	byte	run,3,191
	byte	190
	byte	107
	byte	110
	byte	111
	byte	91
	byte	86
	byte	85
	byte	149
	byte	149
	byte	37
	byte	10
	byte	255
	byte	254
	byte	238
	byte	170
	byte	170
	byte	254
	byte	239
	byte	223
	byte	103
	byte	254
	byte	239
	byte	255
	byte	187
	byte	186
	byte	255
	byte	254
	byte	187
	byte	255
	byte	254
	byte	169
	byte	run,3,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	168
	byte	run,3,230
	byte	run,3,250
	byte	246
	byte	166
	byte	230
	byte	230
	byte	150
	byte	86
	byte	86
	byte	88
	byte	88
	byte	96
	byte	128




pigtail0_data_c:
	byte	0x03, 0x11, 0xff, 0xfd, 0x00, 0x00
	byte	128
	byte	106
	byte	85
	byte	149
	byte	149
	byte	run,3,105
	byte	run,3,86
	byte	run,6,85
	byte	191
	byte	170
	byte	170
	byte	101
	byte	run,4,89
	byte	run,3,86
	byte	149
	byte	149
	byte	166
	byte	106
	byte	89
	byte	85
	byte	128
	byte	128
	byte	160
	byte	96
	byte	run,7,84
	byte	run,3,148
	byte	84
	byte	80
	byte	80




pigtail0_data_d:
	byte	0x03, 0x12, 0xfe, 0xff, 0x00, 0x00
	byte	2
	byte	9
	byte	run,4,2
	byte	run,0x80+12
	byte	160
	byte	88
	byte	88
	byte	run,3,86
	byte	150
	byte	150
	byte	149
	byte	149
	byte	run,3,37
	byte	9
	byte	2
	byte	run,0x80+7
	byte	run,4,2
	byte	run,4,130
	byte	run,3,105
	byte	169
	byte	9
	byte	2




