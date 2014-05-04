;---------------------------------------
;
;	animation cel data
;

patgun0_data::
	byte	out	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,28+left,255

	byte	0b11000000

	word	patgun0_data_a - patgun0_data
	word	patgun0_data_b - patgun0_data


patgun0_data_a:
	byte	0x04, 0x09, 0x00, 0xf1, 0x00, 0x00

	byte	10
	byte	run,5,37
	byte	9
	byte	2
	byte	run,0x80+1
	byte	170
	byte	run,7,85
	byte	149
	byte	170
	byte	run,4,85
	byte	run,4,149
	byte	168
	byte	run,5,86
	byte	88
	byte	96
	byte	128




patgun0_data_b:
	byte	0x03, 0x19, 0x00, 0x0a, 0x00, 0x00

	byte	run,0x80+2
	byte	42
	byte	run,6,47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+1
	byte	128
	byte	160
	byte	184
	byte	190
	byte	run,4,191
	byte	190
	byte	184
	byte	160
	byte	128
	byte	37
	byte	9
	byte	2
	byte	130
	byte	138
	byte	130
	byte	162
	byte	162
	byte	171
	byte	235
	byte	254
	byte	254
	byte	170
	byte	11
	byte	10
	byte	2
	byte	2
	byte	171
	byte	187
	byte	187
	byte	170
	byte	run,0x80+4
	byte	150
	byte	152
	byte	160
	byte	160
	byte	168
	byte	224
	byte	224
	byte	160
	byte	run,6,248
	byte	168
	byte	run,4,224
	byte	128
	byte	run,0x80+5




