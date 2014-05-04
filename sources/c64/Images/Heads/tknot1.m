;---------------------------------------
;
;	animation cel data
;

tknot1_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	tknot1_start_end - tknot1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	tknot1_data_a - tknot1_data
	word	tknot1_data_b - tknot1_data
	word	tknot1_data_c - tknot1_data

tknot1_start_end:
	byte	0,0,1,1,0,0,2,2


tknot1_data_a:
	byte	0x05, 0x18, 0xff, 0x02, 0x00, 0x00
	byte	run,0x80+2
	byte	10
	byte	37
	byte	149
	byte	165
	byte	9
	byte	41
	byte	149
	byte	37
	byte	37
	byte	run,5,149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	run,0x80+7
	byte	128
	byte	run,3,96
	byte	run,4,98
	byte	run,4,130
	byte	run,4,106
	byte	130
	byte	run,0x80+5
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	191
	byte	255
	byte	255
	byte	254
	byte	run,4,251
	byte	250
	byte	run,5,255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	run,7,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+2




tknot1_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	run,3,47
	byte	run,4,191
	byte	175
	byte	run,5,47
	byte	11
	byte	11
	byte	2
	byte	run,0x80+1
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,17,255
	byte	254
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,3,224
	byte	run,4,248
	byte	232
	byte	run,5,224
	byte	128
	byte	128
	byte	run,0x80+2




tknot1_data_c:
	byte	0x03, 0x10, 0xff, 0xfc, 0x00, 0x00
	byte	168
	byte	166
	byte	41
	byte	9
	byte	run,6,2
	byte	run,0x80+6
	byte	32
	byte	154
	byte	85
	byte	85
	byte	run,6,86
	byte	152
	byte	168
	byte	run,3,152
	byte	32
	byte	168
	byte	96
	byte	128
	byte	128
	byte	run,0x80+12




