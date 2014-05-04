;---------------------------------------
;
;	animation cel data
;

bbox0_data::
	byte	swing	+ 0
	byte	0b10000000
	byte	no_animation
	byte	bbox0_contents_xy - bbox0_data + 0x80

	byte	20+up,20+up,251

	byte	0b11000000

	word	bbox0_data_a - bbox0_data
	word	bbox0_data_b - bbox0_data

bbox0_contents_xy:
	byte	0,217


bbox0_data_a:
	byte	0x06, 0x29, 0xfe, 0x2a, 0x00, 0x00
	byte	42
	byte	run,6,38
	byte	37
	byte	37
	byte	run,12,38
	byte	42
	byte	42
	byte	run,3,149
	byte	run,3,170
	byte	run,6,191
	byte	170
	byte	149
	byte	170
	byte	run,0x80+5
	byte	run,4,40
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,11,85
	byte	170
	byte	170
	byte	run,3,85
	byte	run,3,170
	byte	run,6,255
	byte	170
	byte	85
	byte	170
	byte	run,0x80+9
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,11,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	166
	byte	187
	byte	250
	byte	239
	byte	238
	byte	235
	byte	186
	byte	191
	byte	170
	byte	101
	byte	170
	byte	128
	byte	170
	byte	128
	byte	run,0x80+2
	byte	run,4,2
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,11,85
	byte	170
	byte	170
	byte	run,3,85
	byte	170
	byte	166
	byte	250
	byte	175
	byte	255
	byte	175
	byte	251
	byte	175
	byte	255
	byte	170
	byte	101
	byte	170
	byte	run,0x80+1
	byte	128
	byte	run,0x80+1
	byte	10
	byte	9
	byte	run,4,137
	byte	169
	byte	85
	byte	85
	byte	169
	byte	run,11,89
	byte	170
	byte	170
	byte	run,3,85
	byte	run,3,170
	byte	run,6,255
	byte	170
	byte	85
	byte	170
	byte	run,0x80+3
	byte	run,23,128
	byte	run,3,96
	byte	run,3,160
	byte	run,6,224
	byte	160
	byte	96
	byte	160
	byte	run,0x80+3




bbox0_data_b:
	byte	cel_box + 0x05, 0x20, 0xfe, 0x4a, 0x00, 0x00
	byte	pat_glass

