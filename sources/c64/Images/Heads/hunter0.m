;---------------------------------------
;
;	animation cel data
;

hunter0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	hunter0_start_end - hunter0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	hunter0_data_a - hunter0_data
	word	hunter0_data_b - hunter0_data

hunter0_start_end:
	byte	0,0,1,1,0,0,1,1


hunter0_data_a:
	byte	0x06, 0x1b, 0xff, 0x05, 0x00, 0x00
	byte	run,0x80+7
	byte	8
	byte	38
	byte	37
	byte	9
	byte	2
	byte	run,0x80+22
	byte	2
	byte	130
	byte	105
	byte	89
	byte	86
	byte	166
	byte	42
	byte	170
	byte	154
	byte	run,6,149
	byte	37
	byte	10
	byte	run,0x80+4
	byte	47
	byte	42
	byte	run,3,47
	byte	191
	byte	255
	byte	255
	byte	190
	byte	107
	byte	91
	byte	90
	byte	85
	byte	149
	byte	run,8,85
	byte	149
	byte	41
	byte	2
	byte	run,0x80+1
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	255
	byte	255
	byte	254
	byte	254
	byte	250
	byte	234
	byte	255
	byte	255
	byte	175
	byte	110
	byte	111
	byte	111
	byte	107
	byte	91
	byte	86
	byte	run,5,85
	byte	105
	byte	130
	byte	run,0x80+3
	byte	128
	byte	224
	byte	224
	byte	248
	byte	184
	byte	160
	byte	184
	byte	248
	byte	254
	byte	255
	byte	238
	byte	248
	byte	184
	byte	232
	byte	248
	byte	224
	byte	160
	byte	88
	byte	run,3,86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+12
	byte	128
	byte	run,0x80+14




hunter0_data_b:
	byte	0x07, 0x1b, 0xfd, 0x04, 0x00, 0x00
	byte	run,0x80+8
	byte	2
	byte	9
	byte	2
	byte	2
	byte	run,0x80+23
	byte	128
	byte	96
	byte	88
	byte	90
	byte	150
	byte	38
	byte	10
	byte	2
	byte	9
	byte	9
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+5
	byte	3
	byte	run,4,2
	byte	11
	byte	47
	byte	191
	byte	190
	byte	186
	byte	187
	byte	run,3,191
	byte	187
	byte	190
	byte	175
	byte	111
	byte	91
	byte	86
	byte	85
	byte	run,3,149
	byte	37
	byte	9
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	239
	byte	255
	byte	187
	byte	170
	byte	186
	byte	255
	byte	239
	byte	255
	byte	187
	byte	255
	byte	186
	byte	run,3,255
	byte	170
	byte	run,4,85
	byte	89
	byte	162
	byte	run,0x80+6
	byte	128
	byte	224
	byte	248
	byte	248
	byte	184
	byte	184
	byte	248
	byte	248
	byte	250
	byte	186
	byte	250
	byte	229
	byte	149
	byte	149
	byte	run,5,85
	byte	86
	byte	152
	byte	32
	byte	run,0x80+7
	byte	2
	byte	9
	byte	41
	byte	37
	byte	149
	byte	150
	byte	88
	byte	160
	byte	run,3,128
	byte	run,3,96
	byte	run,3,128
	byte	run,0x80+10
	byte	128
	byte	96
	byte	run,3,128
	byte	run,0x80+15




