;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

groom_data::
	byte	swing	+ 2
	byte	0b01000000
	byte	groom_start_end - groom_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	groom_data_a - groom_data
	word	groom_data_b - groom_data
	word	groom_data_c - groom_data

groom_start_end:
	byte	0,0,1,1,0,0,2,2


groom_data_a:
	byte	0x04, 0x22, 0x00, 0x0a, 0x00, 0x00
	byte	run,0x80+9
	byte	run,10,2
	byte	42
	byte	10
	byte	run,13,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,5,170
	byte	85
	byte	85
	byte	run,11,170
	byte	128
	byte	164
	byte	168
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	run,3,175
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,11,170
	byte	run,0x80+5
	byte	128
	byte	run,6,224
	byte	232
	byte	run,4,248
	byte	224
	byte	224
	byte	170
	byte	168
	byte	96
	byte	96
	byte	run,11,160




groom_data_b:
	byte	0x05, 0x23, 0xfe, 0x0a, 0x00, 0x00
	byte	run,0x80+20
	byte	10
	byte	2
	byte	run,0x80+13
	byte	run,3,10
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	175
	byte	run,4,191
	byte	run,3,175
	byte	170
	byte	170
	byte	149
	byte	149
	byte	run,11,170
	byte	154
	byte	170
	byte	154
	byte	254
	byte	170
	byte	170
	byte	254
	byte	run,13,255
	byte	170
	byte	170
	byte	85
	byte	85
	byte	run,11,170
	byte	run,3,128
	byte	run,0x80+4
	byte	128
	byte	128
	byte	224
	byte	224
	byte	run,3,232
	byte	run,3,248
	byte	run,3,232
	byte	170
	byte	170
	byte	88
	byte	88
	byte	run,11,168
	byte	run,0x80+20
	byte	128
	byte	run,0x80+14




groom_data_c:
	byte	0x03, 0x14, 0xff, 0xfb, 0x00, 0x00
	byte	run,9,2
	byte	run,11,42
	byte	run,20,170
	byte	run,0x80+3
	byte	128
	byte	run,0x80+5
	byte	run,11,160




