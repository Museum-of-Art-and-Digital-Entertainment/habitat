;---------------------------------------
;
;	animation cel data
;

kk1_data::
	byte	out	+ 1
	byte	0b00000000
	byte	kk1_start_end - kk1_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000
	byte	0b11000000

	word	kk1_data_a - kk1_data
	word	kk1_data_b - kk1_data

kk1_start_end:
	byte	0,0,1,1


kk1_data_a:
	byte	0x05, 0x30, 0xff, 0x16, 0x00, 0x00
	byte	run,0x80+25
	byte	run,4,2
	byte	10
	byte	2
	byte	11
	byte	11
	byte	10
	byte	run,6,3
	byte	2
	byte	2
	byte	run,0x80+6
	byte	run,6,10
	byte	2
	byte	run,0x80+17
	byte	162
	byte	8
	byte	34
	byte	2
	byte	run,0x80+1
	byte	128
	byte	run,0x80+1
	byte	run,3,128
	byte	run,0x80+14
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	170
	byte	85
	byte	8
	byte	46
	byte	run,4,8
	byte	run,7,38
	byte	42
	byte	12
	byte	8
	byte	12
	byte	12
	byte	42
	byte	46
	byte	136
	byte	8
	byte	run,3,46
	byte	8
	byte	8
	byte	46
	byte	46
	byte	170
	byte	run,8,12
	byte	8
	byte	8
	byte	168
	byte	168
	byte	run,3,104
	byte	168
	byte	160
	byte	64
	byte	run,0x80+16
	byte	34
	byte	8
	byte	34
	byte	32
	byte	128
	byte	run,0x80+8
	byte	128
	byte	run,0x80+34
	byte	128
	byte	run,4,32
	byte	168
	byte	32
	byte	184
	byte	184
	byte	168
	byte	run,6,48
	byte	32
	byte	32
	byte	run,0x80+6




kk1_data_b:
	byte	0x05, 0x09, 0xff, 0x17, 0x00, 0x00
	byte	1
	byte	1
	byte	run,0x80+22
	byte	run,3,4
	byte	run,0x80+9
	byte	16
	byte	16
	byte	run,0x80+7




