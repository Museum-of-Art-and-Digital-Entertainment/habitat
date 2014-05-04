;---------------------------------------
;
;	animation cel data
;

couchs_data::
	byte	both	+ 0
	byte	0b11000000
	byte	no_animation
	byte	couchs_contents_xy - couchs_data + 0x80

	byte	32+right,32+right,255

	byte	0b11000000

	word	couchs_data_a - couchs_data
	word	couchs_data_b - couchs_data

couchs_contents_xy:
	byte	3,238


couchs_data_a:
	byte	0x07, 0x1b, 0xfe, 0xf5, 0x00, 0x00

	byte	170
	byte	run,25,149
	byte	170
	byte	128
	byte	128
	byte	160
	byte	170
	byte	run,22,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,22,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,22,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,22,85
	byte	170
	byte	42
	byte	37
	byte	165
	byte	165
	byte	run,22,85
	byte	170
	byte	160
	byte	run,14,96
	byte	run,10,88
	byte	96
	byte	128




couchs_data_b:
	byte	0x03, 0x0f, 0xfe, 0x04, 0x00, 0x00

	byte	run,14,37
	byte	10
	byte	run,13,85
	byte	86
	byte	168
	byte	88
	byte	88
	byte	run,5,96
	byte	run,6,128
	byte	run,0x80+2




