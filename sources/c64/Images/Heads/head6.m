;---------------------------------------
;
;	animation cel data
;

head6_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	head6_start_end - head6_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	head6_data_a - head6_data
	word	head6_data_b - head6_data

head6_start_end:
	byte	0,0,1,1,0,0,1,1


head6_data_a:
	byte	0x04, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	run,17,9
	byte	2
	byte	run,0x80+1
	byte	47
	byte	42
	byte	run,3,47
	byte	37
	byte	170
	byte	85
	byte	run,7,86
	byte	run,9,85
	byte	170
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	127
	byte	191
	byte	191
	byte	run,4,255
	byte	235
	byte	235
	byte	171
	byte	run,3,91
	byte	90
	byte	run,5,85
	byte	170
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	248
	byte	248
	byte	run,6,224
	byte	run,6,128
	byte	run,0x80+1




head6_data_b:
	byte	0x04, 0x19, 0xfe, 0x02, 0x00, 0x00
	byte	run,0x80+10
	byte	run,11,2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,4,111
	byte	107
	byte	90
	byte	85
	byte	run,3,149
	byte	42
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	170
	byte	run,4,85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,250
	byte	run,3,230
	byte	166
	byte	150
	byte	150
	byte	90
	byte	run,3,88
	byte	160




