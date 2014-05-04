;---------------------------------------
;
;	animation cel data
;

maus_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	maus_data_a - maus_data


maus_data_a:
	byte	0x06, 0x0d, 0x00, 0x00, 0x00, 0x00
	byte	run,6,5
	byte	run,4,1
	byte	5
	byte	5
	byte	1
	byte	80
	byte	run,4,64
	byte	85
	byte	84
	byte	84
	byte	run,4,85
	byte	80
	byte	run,0x80+4
	byte	21
	byte	85
	byte	21
	byte	21
	byte	run,3,85
	byte	65
	byte	run,0x80+5
	byte	80
	byte	80
	byte	run,3,64
	byte	80
	byte	85
	byte	85
	byte	run,0x80+11
	byte	85
	byte	85
	byte	run,0x80+11
	byte	run,3,64




