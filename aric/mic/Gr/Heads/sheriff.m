;---------------------------------------
;
;	animation cel data
;
	include "../equates.m"

sheriff_data::
	byte	swing	+ 2
	byte	0b00000000
	byte	sheriff_start_end - sheriff_data
	byte	no_cont

	byte	244+right,28+left,255

	byte	0b10000000
	byte	0b01000000
	byte	0b01100000

	word	sheriff_data_a - sheriff_data
	word	sheriff_data_b - sheriff_data
	word	sheriff_data_c - sheriff_data

sheriff_start_end:
	byte	0,0,1,1,0,0,2,2


sheriff_data_a:
	byte	0x06, 0x20, 0xff, 0x0a, 0x00, 0x00
	byte	run,0x80+13
	byte	2
	byte	9
	byte	run,4,37
	byte	9
	byte	9
	byte	2
	byte	run,0x80+17
	byte	run,4,2
	byte	10
	byte	170
	byte	run,3,90
	byte	86
	byte	run,5,85
	byte	165
	byte	10
	byte	run,3,9
	byte	run,3,2
	byte	run,0x80+3
	byte	47
	byte	42
	byte	47
	byte	47
	byte	175
	byte	run,4,170
	byte	run,4,171
	byte	run,4,170
	byte	106
	byte	run,4,85
	byte	170
	byte	run,6,85
	byte	149
	byte	170
	byte	232
	byte	184
	byte	248
	byte	250
	byte	239
	byte	239
	byte	191
	byte	190
	byte	186
	byte	run,4,255
	byte	239
	byte	175
	byte	174
	byte	174
	byte	175
	byte	170
	byte	run,3,85
	byte	86
	byte	169
	byte	85
	byte	85
	byte	run,3,86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+3
	byte	128
	byte	run,3,224
	byte	run,3,168
	byte	232
	byte	run,4,248
	byte	224
	byte	160
	byte	232
	byte	150
	byte	85
	byte	85
	byte	106
	byte	run,4,128
	byte	run,0x80+24
	byte	128
	byte	96
	byte	96
	byte	128
	byte	run,0x80+10




sheriff_data_b:
	byte	0x06, 0x21, 0xfd, 0x0a, 0x00, 0x00
	byte	run,0x80+18
	byte	run,8,2
	byte	run,0x80+20
	byte	2
	byte	9
	byte	37
	byte	149
	byte	149
	byte	85
	byte	86
	byte	run,3,85
	byte	86
	byte	88
	byte	96
	byte	128
	byte	run,0x80+6
	byte	3
	byte	run,4,2
	byte	11
	byte	11
	byte	47
	byte	170
	byte	42
	byte	190
	byte	run,4,191
	byte	190
	byte	186
	byte	191
	byte	190
	byte	169
	byte	85
	byte	86
	byte	169
	byte	151
	byte	37
	byte	37
	byte	39
	byte	37
	byte	run,4,9
	byte	2
	byte	255
	byte	254
	byte	254
	byte	170
	byte	254
	byte	run,3,255
	byte	186
	byte	170
	byte	170
	byte	171
	byte	187
	byte	255
	byte	255
	byte	254
	byte	186
	byte	171
	byte	86
	byte	85
	byte	85
	byte	170
	byte	85
	byte	87
	byte	221
	byte	253
	byte	255
	byte	run,3,117
	byte	85
	byte	101
	byte	138
	byte	run,0x80+5
	byte	128
	byte	128
	byte	224
	byte	168
	byte	160
	byte	run,3,248
	byte	250
	byte	249
	byte	249
	byte	185
	byte	249
	byte	250
	byte	170
	byte	85
	byte	85
	byte	169
	byte	90
	byte	run,4,96
	byte	run,4,128
	byte	run,0x80+15
	byte	128
	byte	96
	byte	88
	byte	88
	byte	run,6,86
	byte	150
	byte	38
	byte	8
	byte	run,0x80+6




sheriff_data_c:
	byte	0x03, 0x17, 0xff, 0x07, 0x00, 0x00
	byte	run,6,42
	byte	run,4,85
	byte	90
	byte	101
	byte	run,5,149
	byte	run,6,1
	byte	run,6,170
	byte	run,4,85
	byte	170
	byte	run,12,85
	byte	run,6,160
	byte	run,4,84
	byte	148
	byte	101
	byte	run,4,89
	byte	run,0x80+7




