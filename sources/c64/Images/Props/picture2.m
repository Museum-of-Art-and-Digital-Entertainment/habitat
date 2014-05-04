;---------------------------------------
;
;	animation cel data
;

picture2_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	244+right,56+left,255

	byte	0b11100000

	word	picture2_data_a - picture2_data
	word	picture2_data_b - picture2_data
	word	picture2_data_c - picture2_data


picture2_data_a:
	byte	cel_box + both_bord + 0x08, 0x1f, 0xfa, 0x0a, 0x00, 0x00
	byte	0q3333

picture2_data_b:
	byte	0x08, 0x13, 0xfa, 0x04, 0x00, 0x00
	byte	10
	byte	run,3,8
	byte	10
	byte	run,0x80+2
	byte	2
	byte	run,4,8
	byte	run,0x80+7
	byte	34
	byte	34
	byte	42
	byte	46
	byte	42
	byte	run,0x80+2
	byte	8
	byte	136
	byte	138
	byte	139
	byte	138
	byte	run,0x80+2
	byte	run,5,8
	byte	40
	byte	run,4,32
	byte	run,0x80+2
	byte	138
	byte	run,3,136
	byte	138
	byte	run,0x80+2
	byte	162
	byte	34
	byte	162
	byte	130
	byte	162
	byte	160
	byte	128
	byte	130
	byte	128
	byte	128
	byte	run,0x80+2
	byte	34
	byte	34
	byte	42
	byte	46
	byte	42
	byte	run,0x80+2
	byte	136
	byte	8
	byte	10
	byte	11
	byte	10
	byte	40
	byte	32
	byte	40
	byte	8
	byte	40
	byte	run,0x80+2
	byte	run,4,8
	byte	42
	byte	run,0x80+2
	byte	136
	byte	run,3,138
	byte	136
	byte	162
	byte	130
	byte	162
	byte	32
	byte	162
	byte	run,0x80+2
	byte	run,5,34
	byte	run,0x80+2
	byte	138
	byte	run,3,139
	byte	138
	byte	138
	byte	8
	byte	138
	byte	130
	byte	138
	byte	run,0x80+2
	byte	162
	byte	run,3,226
	byte	162
	byte	run,0x80+3
	byte	run,3,128
	byte	run,0x80+8
	byte	32
	byte	run,3,160
	byte	32
	byte	run,0x80+7




picture2_data_c:
	byte	0x04, 0x1f, 0x02, 0x0a, 0x00, 0x00
	byte	170
	byte	run,10,85
	byte	127
	byte	run,18,255
	byte	170
	byte	170
	byte	run,9,85
	byte	170
	byte	234
	byte	250
	byte	run,4,254
	byte	run,3,255
	byte	254
	byte	255
	byte	254
	byte	run,7,255
	byte	170
	byte	170
	byte	run,9,85
	byte	170
	byte	171
	byte	175
	byte	run,4,255
	byte	191
	byte	191
	byte	190
	byte	238
	byte	171
	byte	235
	byte	190
	byte	run,6,255
	byte	170
	byte	170
	byte	run,10,86
	byte	run,11,254
	byte	190
	byte	run,7,254
	byte	170




