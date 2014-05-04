;---------------------------------------
;
;	animation cel data
;

chairfb_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	chairfb_contents_xy - chairfb_data

	byte	0+right,16+left,255

	byte	0b10000000

	word	chairfb_data_a - chairfb_data

chairfb_contents_xy:
	byte	0,23


chairfb_data_a:
	byte	0x06, 0x2a, 0xff, 0x01, 0x00, 0x00
	byte	170
	byte	run,25,149
	byte	170
	byte	run,14,9
	byte	2
	byte	128
	byte	128
	byte	160
	byte	170
	byte	run,11,85
	byte	170
	byte	run,6,149
	byte	170
	byte	run,3,149
	byte	run,15,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,11,85
	byte	170
	byte	run,6,85
	byte	170
	byte	run,18,85
	byte	170
	byte	run,0x80+3
	byte	170
	byte	run,11,85
	byte	170
	byte	run,6,85
	byte	170
	byte	run,18,85
	byte	170
	byte	2
	byte	2
	byte	10
	byte	170
	byte	run,11,85
	byte	170
	byte	run,6,86
	byte	170
	byte	run,3,86
	byte	run,15,85
	byte	170
	byte	170
	byte	run,25,86
	byte	170
	byte	run,14,96
	byte	128




