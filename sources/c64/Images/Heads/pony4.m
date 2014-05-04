;---------------------------------------
;
;	animation cel data
;

pony4_data::
	byte	swing	+ 3
	byte	0b00100000
	byte	pony4_start_end - pony4_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10010000
	byte	0b01000000
	byte	0b01100000
	byte	0b10000000

	word	pony4_data_a - pony4_data
	word	pony4_data_b - pony4_data
	word	pony4_data_c - pony4_data
	word	pony4_data_d - pony4_data

pony4_start_end:
	byte	0,0,1,1,3,3,2,2


pony4_data_a:
	byte	0x05, 0x17, 0x00, 0x03, 0x00, 0x00
	byte	5
	byte	5
	byte	run,3,21
	byte	85
	byte	85
	byte	run,7,87
	byte	91
	byte	91
	byte	27
	byte	27
	byte	11
	byte	2
	byte	2
	byte	run,0x80+2
	byte	run,15,255
	byte	254
	byte	127
	byte	213
	byte	run,3,229
	byte	160
	byte	32
	byte	run,3,248
	byte	224
	byte	224
	byte	168
	byte	254
	byte	run,6,255
	byte	219
	byte	219
	byte	171
	byte	255
	byte	90
	byte	84
	byte	84
	byte	80
	byte	run,0x80+8
	byte	170
	byte	250
	byte	239
	byte	run,3,255
	byte	254
	byte	248
	byte	224
	byte	128
	byte	128
	byte	run,0x80+12
	byte	128
	byte	160
	byte	run,3,224
	byte	160
	byte	128
	byte	run,0x80+10




pony4_data_b:
	byte	0x03, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,5,11
	byte	10
	byte	11
	byte	47
	byte	47
	byte	run,4,191
	byte	185
	byte	153
	byte	170
	byte	47
	byte	189
	byte	190
	byte	190
	byte	46
	byte	46
	byte	10
	byte	2
	byte	run,5,255
	byte	235
	byte	255
	byte	170
	byte	255
	byte	255
	byte	190
	byte	run,4,255
	byte	215
	byte	215
	byte	run,4,85
	byte	run,0x80+3
	byte	run,5,224
	byte	160
	byte	224
	byte	248
	byte	184
	byte	run,4,254
	byte	110
	byte	102
	byte	170
	byte	248
	byte	126
	byte	190
	byte	190
	byte	184
	byte	184
	byte	160
	byte	128




pony4_data_c:
	byte	0x03, 0x11, 0xff, 0xfb, 0x00, 0x00
	byte	1
	byte	run,0x80+1
	byte	1
	byte	run,0x80+4
	byte	1
	byte	3
	byte	1
	byte	3
	byte	1
	byte	3
	byte	run,3,61
	byte	run,0x80+1
	byte	20
	byte	85
	byte	215
	byte	85
	byte	85
	byte	215
	byte	run,11,85
	byte	64
	byte	run,0x80+1
	byte	64
	byte	run,0x80+4
	byte	64
	byte	192
	byte	64
	byte	192
	byte	64
	byte	192
	byte	run,3,124
	byte	run,0x80+1




pony4_data_d:
	byte	0x02, 0x15, 0xff, 0xdb, 0x00, 0x00
	byte	run,0x80+1
	byte	1
	byte	1
	byte	5
	byte	4
	byte	run,0x80+3
	byte	1
	byte	1
	byte	run,7,5
	byte	1
	byte	1
	byte	run,0x80+2
	byte	80
	byte	84
	byte	84
	byte	run,5,85
	byte	run,3,84
	byte	run,6,80
	byte	run,3,84
	byte	20




