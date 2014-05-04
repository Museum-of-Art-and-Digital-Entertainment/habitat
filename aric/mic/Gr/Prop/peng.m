;---------------------------------------
;
;	animation cel data
;

peng_data::
	byte	swing	+ 1
	byte	0b00000000
	byte	peng_start_end - peng_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10110000
	byte	0b01101000

	word	peng_data_a - peng_data
	word	peng_data_b - peng_data
	word	peng_data_c - peng_data
	word	peng_data_d - peng_data
	word	peng_data_e - peng_data

peng_start_end:
	byte	0,0,cycle+0,1


peng_data_a:
	byte	0x03, 0x06, 0x00, 0xed, 0x00, 0x00
	byte	10
	byte	11
	byte	2
	byte	10
	byte	10
	byte	42
	byte	170
	byte	255
	byte	170
	byte	run,3,191
	byte	170
	byte	254
	byte	168
	byte	128
	byte	234
	byte	232




peng_data_b:
	byte	0x04, 0x07, 0x00, 0xee, 0x00, 0x00
	byte	run,0x80+1
	byte	10
	byte	11
	byte	10
	byte	10
	byte	run,3,42
	byte	170
	byte	255
	byte	170
	byte	191
	byte	191
	byte	187
	byte	170
	byte	170
	byte	254
	byte	168
	byte	128
	byte	224
	byte	224
	byte	128
	byte	128
	byte	run,0x80+5




peng_data_c:
	byte	0x03, 0x1b, 0x00, 0x08, 0x00, 0x00
	byte	run,3,42
	byte	run,7,43
	byte	run,6,42
	byte	10
	byte	10
	byte	2
	byte	2
	byte	run,5,10
	byte	2
	byte	2
	byte	187
	byte	187
	byte	235
	byte	run,14,171
	byte	run,3,174
	byte	175
	byte	191
	byte	191
	byte	171
	byte	191
	byte	174
	byte	168
	byte	run,11,224
	byte	run,6,128
	byte	run,0x80+3
	byte	128
	byte	128
	byte	168
	byte	184
	byte	160
	byte	run,0x80+2




peng_data_d:
	byte	0x03, 0x03, 0xfe, 0xf8, 0x00, 0x00
	byte	run,0x80+1
	byte	2
	byte	run,0x80+1
	byte	170
	byte	254
	byte	170
	byte	128
	byte	192
	byte	128




peng_data_e:
	byte	0x03, 0x0f, 0xfe, 0xfe, 0x00, 0x00
	byte	run,0x80+1
	byte	run,6,2
	byte	run,0x80+2
	byte	run,5,2
	byte	run,0x80+1
	byte	168
	byte	run,4,254
	byte	248
	byte	250
	byte	191
	byte	186
	byte	248
	byte	run,4,254
	byte	168
	byte	run,0x80+6
	byte	128
	byte	192
	byte	128
	byte	run,0x80+6




