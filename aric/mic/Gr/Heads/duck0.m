;---------------------------------------
;
;	animation cel data
;

duck0_data::
	byte	swing	+ 1
	byte	0b10000000
	byte	duck0_start_end - duck0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	duck0_data_a - duck0_data
	word	duck0_data_b - duck0_data

duck0_start_end:
	byte	0,0,1,1,0,0,1,1


duck0_data_a:
	byte	0x05, 0x1a, 0x00, 0x04, 0x00, 0x00
	byte	run,0x80+7
	byte	run,12,1
	byte	69
	byte	21
	byte	run,0x80+2
	byte	1
	byte	run,0x80+3
	byte	31
	byte	run,3,21
	byte	run,17,85
	byte	21
	byte	21
	byte	81
	byte	4
	byte	20
	byte	84
	byte	84
	byte	run,7,85
	byte	93
	byte	run,4,123
	byte	93
	byte	run,7,85
	byte	84
	byte	run,0x80+5
	byte	64
	byte	96
	byte	106
	byte	191
	byte	170
	byte	191
	byte	191
	byte	110
	byte	104
	byte	run,3,84
	byte	run,4,80
	byte	run,3,64
	byte	run,0x80+9
	byte	160
	byte	224
	byte	168
	byte	248
	byte	168
	byte	run,0x80+16




duck0_data_b:
	byte	0x03, 0x1c, 0xff, 0x05, 0x00, 0x00
	byte	3
	byte	run,3,1
	byte	run,3,5
	byte	23
	byte	21
	byte	95
	byte	87
	byte	85
	byte	87
	byte	run,4,94
	byte	87
	byte	85
	byte	run,3,21
	byte	5
	byte	17
	byte	4
	byte	run,0x80+2
	byte	1
	byte	87
	byte	run,6,85
	byte	255
	byte	85
	byte	255
	byte	187
	byte	253
	byte	187
	byte	run,4,222
	byte	87
	byte	run,7,85
	byte	80
	byte	64
	byte	run,0x80+5
	byte	run,3,64
	byte	80
	byte	80
	byte	212
	byte	run,3,84
	byte	run,4,212
	byte	84
	byte	84
	byte	run,3,80
	byte	64
	byte	run,0x80+2
	byte	64
	byte	run,0x80+2




