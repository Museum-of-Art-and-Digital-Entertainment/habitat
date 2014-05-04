;---------------------------------------
;
;	animation cel data
;

vase_data::
	byte	out	+ 2
	byte	0b00000000
	byte	vase_start_end - vase_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b11000000

	word	vase_data_a - vase_data
	word	vase_data_b - vase_data

vase_start_end:
	byte	0,0,2,2,1,1,2,2


vase_data_a:
	byte	0x02, 0x18, 0x00, 0x04, 0x00, 0x00
	byte	10
	byte	run,13,37
	byte	9
	byte	run,7,2
	byte	9
	byte	10
	byte	168
	byte	run,13,86
	byte	88
	byte	run,7,96
	byte	88
	byte	168




vase_data_b:
	byte	0x04, 0x12, 0xff, 0x15, 0x00, 0x00
	byte	run,0x80+4
	byte	2
	byte	11
	byte	11
	byte	2
	byte	11
	byte	11
	byte	2
	byte	11
	byte	11
	byte	2
	byte	run,0x80+4
	byte	10
	byte	34
	byte	187
	byte	187
	byte	186
	byte	239
	byte	239
	byte	186
	byte	186
	byte	187
	byte	170
	byte	238
	byte	235
	byte	187
	byte	186
	byte	187
	byte	43
	byte	2
	byte	162
	byte	171
	byte	187
	byte	171
	byte	190
	byte	190
	byte	171
	byte	187
	byte	171
	byte	186
	byte	187
	byte	186
	byte	239
	byte	239
	byte	186
	byte	187
	byte	186
	byte	32
	byte	run,0x80+1
	byte	128
	byte	128
	byte	160
	byte	248
	byte	248
	byte	160
	byte	184
	byte	184
	byte	160
	byte	248
	byte	248
	byte	160
	byte	160
	byte	128
	byte	128
	byte	run,0x80+2




