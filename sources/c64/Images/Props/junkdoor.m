;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

junkdoor_data::
	byte	both	+ 1
	byte	0b00111100
	byte	junkdoor_start_end - junkdoor_data
	byte	no_cont

	byte	0+right,32+left,255

	byte	0b11101000
	byte	0b11010100

	word	junkdoor_data_a - junkdoor_data
	word	junkdoor_data_b - junkdoor_data
	word	junkdoor_data_c - junkdoor_data
	word	junkdoor_data_d - junkdoor_data
	word	junkdoor_data_e - junkdoor_data
	word	junkdoor_data_f - junkdoor_data

junkdoor_start_end:
	byte	0,0,1,1


junkdoor_data_a:
	byte	cel_box + 0x07, 0x01, 0xff, 0xe0, 0x00, 0x00
	byte	0x55

junkdoor_data_b:
	byte	cel_box + 0x03+2, 0x43, 0x00, 0x22, 0x00, 0x00
	byte	0xaa

junkdoor_data_c:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	42
	byte	run,35,46
	byte	run,0x80+1
	byte	160
	byte	250
	byte	250
	byte	run,7,251
	byte	250
	byte	170
	byte	171
	byte	255
	byte	255
	byte	251
	byte	run,3,255
	byte	239
	byte	255
	byte	250
	byte	171
	byte	run,4,251
	byte	187
	byte	171
	byte	171
	byte	234
	byte	250
	byte	255
	byte	239
	byte	255
	byte	run,0x80+1
	byte	10
	byte	174
	byte	run,8,254
	byte	170
	byte	170
	byte	run,8,255
	byte	254
	byte	171
	byte	run,3,251
	byte	run,6,239
	byte	175
	byte	175
	byte	235
	byte	250
	byte	run,0x80+1
	byte	170
	byte	run,8,239
	byte	238
	byte	170
	byte	171
	byte	255
	byte	239
	byte	run,3,255
	byte	239
	byte	255
	byte	255
	byte	170
	byte	run,13,251
	byte	187
	byte	run,0x80+1
	byte	162
	byte	run,8,251
	byte	170
	byte	170
	byte	run,8,255
	byte	250
	byte	171
	byte	run,14,251
	byte	run,0x80+1
	byte	170
	byte	255
	byte	run,7,254
	byte	170
	byte	170
	byte	255
	byte	239
	byte	run,4,255
	byte	251
	byte	255
	byte	170
	byte	run,12,251
	byte	170
	byte	169
	byte	234
	byte	168
	byte	run,35,184




junkdoor_data_d:
	byte	0x07, 0x24, 0xff, 0x02, 0x00, 0x00
	byte	42
	byte	run,35,46
	byte	run,0x80+1
	byte	128
	byte	224
	byte	224
	byte	234
	byte	run,7,251
	byte	170
	byte	255
	byte	190
	byte	255
	byte	255
	byte	254
	byte	191
	byte	250
	byte	171
	byte	251
	byte	251
	byte	239
	byte	239
	byte	175
	byte	175
	byte	239
	byte	239
	byte	251
	byte	187
	byte	254
	byte	254
	byte	255
	byte	191
	byte	255
	byte	run,0x80+5
	byte	128
	byte	160
	byte	run,4,184
	byte	168
	byte	184
	byte	run,6,248
	byte	168
	byte	run,14,184
	byte	234
	byte	230
	byte	run,0x80+108
	byte	168
	byte	run,35,184




junkdoor_data_e:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0x00
	byte	run,33,46
	byte	47
	byte	47
	byte	42
	byte	255
	byte	239
	byte	255
	byte	191
	byte	235
	byte	251
	byte	250
	byte	run,10,251
	byte	170
	byte	171
	byte	255
	byte	239
	byte	run,3,255
	byte	239
	byte	254
	byte	171
	byte	run,5,251
	byte	170
	byte	255
	byte	255
	byte	170
	byte	254
	byte	run,5,255
	byte	191
	byte	191
	byte	171
	byte	190
	byte	run,6,191
	byte	170
	byte	170
	byte	run,6,255
	byte	250
	byte	175
	byte	run,5,191
	byte	190
	byte	170
	byte	255
	byte	255
	byte	170
	byte	171
	byte	234
	byte	254
	byte	191
	byte	run,3,255
	byte	191
	byte	255
	byte	255
	byte	175
	byte	234
	byte	run,3,239
	byte	234
	byte	170
	byte	255
	byte	239
	byte	255
	byte	255
	byte	251
	byte	255
	byte	254
	byte	171
	byte	run,5,239
	byte	175
	byte	175
	byte	170
	byte	255
	byte	255
	byte	170
	byte	251
	byte	187
	byte	171
	byte	235
	byte	250
	byte	254
	byte	255
	byte	251
	byte	run,3,255
	byte	254
	byte	191
	byte	235
	byte	250
	byte	170
	byte	191
	byte	run,6,255
	byte	170
	byte	run,8,251
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,3,251
	byte	239
	byte	175
	byte	171
	byte	234
	byte	250
	byte	254
	byte	run,4,255
	byte	234
	byte	170
	byte	175
	byte	255
	byte	251
	byte	255
	byte	255
	byte	239
	byte	255
	byte	234
	byte	175
	byte	run,7,239
	byte	235
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,33,184
	byte	248
	byte	248
	byte	168




junkdoor_data_f:
	byte	0x07, 0x24, 0xff, 0x26, 0x00, 0x00
	byte	run,33,46
	byte	47
	byte	47
	byte	42
	byte	191
	byte	239
	byte	238
	byte	235
	byte	235
	byte	238
	byte	238
	byte	run,4,239
	byte	238
	byte	234
	byte	235
	byte	174
	byte	191
	byte	255
	byte	191
	byte	255
	byte	254
	byte	255
	byte	254
	byte	190
	byte	235
	byte	175
	byte	run,7,239
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,7,248
	byte	184
	byte	184
	byte	168
	byte	168
	byte	184
	byte	run,8,248
	byte	168
	byte	run,11,184
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,0x80+32
	byte	170
	byte	255
	byte	255
	byte	170
	byte	run,33,184
	byte	248
	byte	248
	byte	168




