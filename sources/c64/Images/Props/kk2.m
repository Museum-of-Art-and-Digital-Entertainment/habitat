;---------------------------------------
;
;	animation cel data
;

kk2_data::
	byte	out	+ 0
	byte	0b00000000
	byte	kk2_start_end - kk2_data
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b11000000

	word	kk2_data_a - kk2_data
	word	kk2_data_b - kk2_data

kk2_start_end:
	byte	0,0,0,0


kk2_data_a:
	byte	0x03, 0x14, 0x00, 0x02, 0x00, 0x00
	byte	170
	byte	170
	byte	47
	byte	run,3,42
	byte	run,4,43
	byte	run,3,42
	byte	10
	byte	11
	byte	2
	byte	run,0x80+2
	byte	2
	byte	run,0x80+1
	byte	170
	byte	170
	byte	254
	byte	run,3,170
	byte	run,4,250
	byte	run,3,170
	byte	168
	byte	248
	byte	160
	byte	128
	byte	128
	byte	224
	byte	run,3,128
	byte	run,0x80+18




kk2_data_b:
	byte	0x04, 0x0e, 0xff, 0x10, 0x00, 0x00
	byte	2
	byte	8
	byte	8
	byte	2
	byte	2
	byte	run,0x80+9
	byte	128
	byte	162
	byte	41
	byte	42
	byte	166
	byte	run,5,149
	byte	37
	byte	37
	byte	9
	byte	2
	byte	128
	byte	160
	byte	88
	byte	86
	byte	150
	byte	165
	byte	105
	byte	90
	byte	86
	byte	85
	byte	86
	byte	86
	byte	90
	byte	160
	byte	run,0x80+5
	byte	run,4,128
	byte	160
	byte	40
	byte	8
	byte	136
	byte	160




