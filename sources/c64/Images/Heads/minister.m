;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

minister_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	minister_start_end - minister_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	minister_data_a - minister_data
	word	minister_data_b - minister_data
	word	minister_data_c - minister_data

minister_start_end:
	byte	0,0,1,1,0,0,2,2


minister_data_a:
	byte	0x04, 0x18, 0x00, 0x02, 0x00, 0x00
	byte	run,0x80+7
	byte	run,13,2
	byte	run,0x80+4
	byte	run,4,42
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,4,170
	byte	255
	byte	255
	byte	191
	byte	191
	byte	47
	byte	10
	byte	run,3,168
	byte	170
	byte	239
	byte	239
	byte	run,3,191
	byte	run,4,255
	byte	239
	byte	175
	byte	170
	byte	175
	byte	191
	byte	run,4,255
	byte	254
	byte	168
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	160
	byte	224
	byte	224
	byte	232
	byte	248
	byte	248
	byte	184
	byte	184
	byte	run,3,160
	byte	224
	byte	run,3,128
	byte	run,0x80+2




minister_data_b:
	byte	0x03, 0x18, 0xff, 0x01, 0x00, 0x00
	byte	run,5,2
	byte	11
	byte	11
	byte	47
	byte	47
	byte	175
	byte	run,4,191
	byte	174
	byte	171
	byte	171
	byte	174
	byte	175
	byte	47
	byte	47
	byte	11
	byte	2
	byte	run,0x80+1
	byte	170
	byte	154
	byte	154
	byte	170
	byte	254
	byte	255
	byte	255
	byte	239
	byte	239
	byte	255
	byte	255
	byte	239
	byte	255
	byte	255
	byte	186
	byte	239
	byte	239
	byte	186
	byte	run,4,255
	byte	254
	byte	168
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	224
	byte	232
	byte	run,4,248
	byte	232
	byte	168
	byte	168
	byte	232
	byte	232
	byte	224
	byte	224
	byte	128
	byte	run,0x80+2




minister_data_c:
	byte	0x03, 0x12, 0xff, 0xfc, 0x00, 0x00
	byte	run,0x80+7
	byte	2
	byte	10
	byte	run,8,42
	byte	40
	byte	32
	byte	32
	byte	run,0x80+4
	byte	48
	byte	run,10,170
	byte	run,0x80+9
	byte	128
	byte	run,5,160
	byte	128
	byte	128
	byte	160
	byte	128




