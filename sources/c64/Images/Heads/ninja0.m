;---------------------------------------
;
;	animation cel data
;

ninja0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	ninja0_start_end - ninja0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	ninja0_data_a - ninja0_data
	word	ninja0_data_b - ninja0_data
	word	ninja0_data_c - ninja0_data

ninja0_start_end:
	byte	0,0,1,1,0,0,2,2


ninja0_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+8
	byte	10
	byte	165
	byte	153
	byte	150
	byte	149
	byte	37
	byte	10
	byte	run,5,2
	byte	run,0x80+5
	byte	run,6,42
	byte	run,3,170
	byte	106
	byte	106
	byte	154
	byte	106
	byte	90
	byte	154
	byte	150
	byte	169
	byte	89
	byte	150
	byte	170
	byte	170
	byte	42
	byte	10
	byte	40
	byte	168
	byte	168
	byte	run,6,170
	byte	191
	byte	255
	byte	255
	byte	190
	byte	170
	byte	171
	byte	171
	byte	170
	byte	170
	byte	149
	byte	85
	byte	run,3,170
	byte	168
	byte	run,0x80+4
	byte	run,5,160
	byte	224
	byte	232
	byte	248
	byte	248
	byte	168
	byte	168
	byte	run,3,160
	byte	96
	byte	96
	byte	128
	byte	128
	byte	run,0x80+2




ninja0_data_b:
	byte	0x04, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	run,5,2
	byte	10
	byte	10
	byte	42
	byte	42
	byte	175
	byte	191
	byte	191
	byte	174
	byte	170
	byte	171
	byte	171
	byte	170
	byte	170
	byte	165
	byte	37
	byte	42
	byte	42
	byte	10
	byte	2
	byte	run,9,170
	byte	239
	byte	255
	byte	255
	byte	186
	byte	170
	byte	239
	byte	239
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,4,170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	160
	byte	160
	byte	232
	byte	248
	byte	248
	byte	234
	byte	169
	byte	169
	byte	170
	byte	169
	byte	170
	byte	104
	byte	96
	byte	160
	byte	160
	byte	128
	byte	run,0x80+11
	byte	32
	byte	152
	byte	90
	byte	101
	byte	166
	byte	86
	byte	104
	byte	128
	byte	run,0x80+6




ninja0_data_c:
	byte	0x03, 0x09, 0xff, 0xfb, 0x00, 0x00
	byte	run,18,170
	byte	run,5,168
	byte	164
	byte	152
	byte	148
	byte	152




