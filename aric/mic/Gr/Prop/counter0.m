;---------------------------------------
;
;	animation cel data
;

counter0_data::
	byte	both	+ 0
	byte	0b10000000
	byte	no_animation
	byte	counter0_contents_xy - counter0_data

	byte	244+right,44+left,255

	byte	0b11000000

	word	counter0_data_a - counter0_data
	word	counter0_data_b - counter0_data

counter0_contents_xy:
	byte	251,12,254,12,2,12,252,12,0,12


counter0_data_a:
	byte	cel_box + both_bord + 0x08+3, 0x1e, 0xfb, 0xf2, 0x00, 0x00
	byte	0q1111

counter0_data_b:
	byte	0x0d, 0x03, 0xfa, 0xf5, 0x00, 0x00

	byte	run,3,2
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	85
	byte	85
	byte	170
	byte	run,3,128




