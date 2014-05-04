;---------------------------------------
;
;	animation cel data
;

penguin0_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	penguin0_start_end - penguin0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	penguin0_data_a - penguin0_data
	word	penguin0_data_b - penguin0_data
	word	penguin0_data_c - penguin0_data

penguin0_start_end:
	byte	0,0,1,1,0,0,2,2


penguin0_data_a:
	byte	0x06, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+5
	byte	run,4,42
	byte	run,5,170
	byte	run,4,171
	byte	run,8,170
	byte	42
	byte	10
	byte	40
	byte	152
	byte	154
	byte	174
	byte	191
	byte	191
	byte	190
	byte	185
	byte	185
	byte	249
	byte	249
	byte	250
	byte	250
	byte	255
	byte	170
	byte	166
	byte	165
	byte	169
	byte	169
	byte	run,4,170
	byte	168
	byte	run,0x80+3
	byte	128
	byte	234
	byte	255
	byte	170
	byte	run,3,85
	byte	170
	byte	191
	byte	255
	byte	255
	byte	250
	byte	run,3,160
	byte	96
	byte	run,3,128
	byte	run,0x80+6
	byte	160
	byte	248
	byte	168
	byte	run,3,96
	byte	170
	byte	255
	byte	254
	byte	248
	byte	160
	byte	run,0x80+19
	byte	128
	byte	128
	byte	run,0x80+12




penguin0_data_b:
	byte	0x04, 0x18, 0xfe, 0x01, 0x00, 0x00
	byte	run,0x80+10
	byte	2
	byte	2
	byte	run,0x80+12
	byte	1
	byte	run,4,2
	byte	11
	byte	47
	byte	190
	byte	185
	byte	165
	byte	230
	byte	251
	byte	191
	byte	191
	byte	170
	byte	166
	byte	166
	byte	165
	byte	169
	byte	run,3,42
	byte	10
	byte	2
	byte	85
	byte	86
	byte	170
	byte	170
	byte	254
	byte	255
	byte	171
	byte	86
	byte	85
	byte	85
	byte	170
	byte	run,3,255
	byte	254
	byte	186
	byte	170
	byte	101
	byte	101
	byte	run,5,170
	byte	run,0x80+5
	byte	128
	byte	224
	byte	248
	byte	184
	byte	104
	byte	110
	byte	190
	byte	248
	byte	248
	byte	168
	byte	104
	byte	104
	byte	168
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+1




penguin0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	2
	byte	10
	byte	42
	byte	run,27,170
	byte	run,0x80+1
	byte	128
	byte	160
	byte	run,12,168




