;---------------------------------------
;
;	animation cel data
;

peakhead_data::
	byte	swing	+ 1
	byte	0b11000000
	byte	peakhead_start_end - peakhead_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000

	word	peakhead_data_a - peakhead_data
	word	peakhead_data_b - peakhead_data

peakhead_start_end:
	byte	0,0,1,1,0,0,1,1


peakhead_data_a:
	byte	0x04, 0x1f, 0x00, 0x09, 0x00, 0x00
	byte	run,0x80+7
	byte	run,17,1
	byte	run,0x80+8
	byte	47
	byte	42
	byte	47
	byte	47
	byte	111
	byte	run,4,85
	byte	run,4,87
	byte	run,13,85
	byte	84
	byte	80
	byte	16
	byte	4
	byte	40
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,127
	byte	run,4,255
	byte	223
	byte	run,3,95
	byte	87
	byte	87
	byte	run,4,85
	byte	84
	byte	80
	byte	64
	byte	run,0x80+8
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,64
	byte	run,0x80+9




peakhead_data_b:
	byte	0x03, 0x1e, 0xff, 0x07, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	31
	byte	31
	byte	run,4,95
	byte	run,6,127
	byte	95
	byte	95
	byte	run,4,85
	byte	84
	byte	80
	byte	80
	byte	16
	byte	4
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,13,255
	byte	223
	byte	223
	byte	87
	byte	run,3,85
	byte	69
	byte	run,0x80+10
	byte	128
	byte	128
	byte	208
	byte	208
	byte	run,4,212
	byte	run,6,244
	byte	212
	byte	212
	byte	run,5,84
	byte	20
	byte	20
	byte	16
	byte	64




