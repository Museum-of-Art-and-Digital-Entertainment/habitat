;---------------------------------------
;
;	animation cel data
;

oldman0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	oldman0_start_end - oldman0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	oldman0_data_a - oldman0_data
	word	oldman0_data_b - oldman0_data

oldman0_start_end:
	byte	0,0,1,1,0,0,1,1


oldman0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+10
	byte	run,12,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	run,4,47
	byte	43
	byte	150
	byte	150
	byte	run,4,91
	byte	90
	byte	run,7,85
	byte	149
	byte	42
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	174
	byte	126
	byte	126
	byte	run,3,127
	byte	95
	byte	95
	byte	86
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	run,3,224
	byte	232
	byte	248
	byte	184
	byte	184
	byte	224
	byte	224
	byte	160
	byte	224
	byte	136
	byte	128
	byte	128
	byte	run,0x80+2




oldman0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+10
	byte	run,7,2
	byte	run,0x80+7
	byte	3
	byte	run,4,2
	byte	11
	byte	run,3,47
	byte	175
	byte	127
	byte	191
	byte	255
	byte	254
	byte	254
	byte	123
	byte	123
	byte	126
	byte	111
	byte	94
	byte	95
	byte	23
	byte	41
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	255
	byte	255
	byte	175
	byte	run,3,255
	byte	239
	byte	255
	byte	254
	byte	186
	byte	187
	byte	187
	byte	254
	byte	255
	byte	254
	byte	255
	byte	255
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	run,3,224
	byte	248
	byte	246
	byte	250
	byte	run,3,254
	byte	182
	byte	182
	byte	244
	byte	228
	byte	212
	byte	212
	byte	80
	byte	160
	byte	run,0x80+1




