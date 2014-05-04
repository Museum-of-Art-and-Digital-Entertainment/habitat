;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

sailor0_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	sailor0_start_end - sailor0_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	sailor0_data_a - sailor0_data
	word	sailor0_data_b - sailor0_data
	word	sailor0_data_c - sailor0_data

sailor0_start_end:
	byte	0,0,1,1,0,0,2,2


sailor0_data_a:
	byte	0x04, 0x1d, 0x00, 0x07, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+2
	byte	2
	byte	11
	byte	2
	byte	run,0x80+4
	byte	15
	byte	run,4,47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,8,170
	byte	234
	byte	250
	byte	255
	byte	191
	byte	42
	byte	47
	byte	10
	byte	240
	byte	248
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	run,3,175
	byte	171
	byte	171
	byte	run,4,170
	byte	168
	byte	254
	byte	254
	byte	255
	byte	170
	byte	160
	byte	run,0x80+3
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	run,4,224
	byte	run,3,128
	byte	run,0x80+4
	byte	128
	byte	run,0x80+2




sailor0_data_b:
	byte	0x04, 0x1c, 0xfe, 0x05, 0x00, 0x00
	byte	run,0x80+21
	byte	2
	byte	11
	byte	2
	byte	run,0x80+4
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	171
	byte	171
	byte	42
	byte	170
	byte	250
	byte	254
	byte	255
	byte	191
	byte	47
	byte	11
	byte	2
	byte	255
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,14,255
	byte	run,5,170
	byte	248
	byte	248
	byte	254
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	run,3,232
	byte	168
	byte	168
	byte	run,3,160
	byte	128
	byte	run,0x80+5




sailor0_data_c:
	byte	0x03, 0x0f, 0xff, 0xfc, 0x00, 0x00
	byte	run,3,2
	byte	run,12,42
	byte	run,15,170
	byte	run,0x80+3
	byte	run,12,160




