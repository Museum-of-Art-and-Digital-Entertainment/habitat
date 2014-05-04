;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

newhab1_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	newhab1_start_end - newhab1_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	newhab1_data_a - newhab1_data
	word	newhab1_data_b - newhab1_data
	word	newhab1_data_c - newhab1_data

newhab1_start_end:
	byte	0,0,1,1,0,0,2,2


newhab1_data_a:
	byte	0x04, 0x19, 0x00, 0x03, 0x00, 0x00
	byte	run,0x80+7
	byte	run,4,1
	byte	run,9,5
	byte	1
	byte	1
	byte	run,0x80+3
	byte	32
	byte	47
	byte	37
	byte	47
	byte	47
	byte	95
	byte	run,4,85
	byte	run,4,87
	byte	run,9,85
	byte	21
	byte	5
	byte	232
	byte	184
	byte	248
	byte	250
	byte	239
	byte	238
	byte	run,3,126
	byte	run,4,255
	byte	223
	byte	run,6,95
	byte	run,4,85
	byte	84
	byte	run,0x80+3
	byte	128
	byte	run,4,224
	byte	160
	byte	160
	byte	232
	byte	run,4,248
	byte	run,4,208
	byte	80
	byte	80
	byte	64
	byte	64
	byte	run,0x80+2




newhab1_data_b:
	byte	0x03, 0x19, 0xff, 0x02, 0x00, 0x00
	byte	3
	byte	run,4,2
	byte	11
	byte	10
	byte	run,3,46
	byte	run,4,127
	byte	run,6,95
	byte	21
	byte	21
	byte	5
	byte	5
	byte	1
	byte	255
	byte	254
	byte	254
	byte	170
	byte	254
	byte	255
	byte	run,3,254
	byte	170
	byte	171
	byte	239
	byte	run,7,255
	byte	223
	byte	run,5,85
	byte	run,0x80+5
	byte	128
	byte	128
	byte	run,3,224
	byte	run,4,244
	byte	run,6,212
	byte	80
	byte	80
	byte	64
	byte	64
	byte	run,0x80+1




newhab1_data_c:
	byte	0x03, 0x10, 0xff, 0xfd, 0x00, 0x00
	byte	run,0x80+1
	byte	5
	byte	5
	byte	run,13,21
	byte	84
	byte	run,15,85
	byte	run,0x80+1
	byte	64
	byte	64
	byte	run,13,80




