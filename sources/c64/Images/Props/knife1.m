;---------------------------------------
;
;	animation cel data
;

knife1_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,253

	byte	0b10000000

	word	knife1_data_a - knife1_data


knife1_data_a:
	byte	0x06, 0x07, 0x00, 0xfa, 0x00, 0x00
	byte	run,0x80+1
	byte	run,4,2
	byte	run,0x80+3
	byte	128
	byte	run,3,170
	byte	run,0x80+2
	byte	128
	byte	170
	byte	149
	byte	170
	byte	149
	byte	170
	byte	128
	byte	run,0x80+1
	byte	170
	byte	85
	byte	170
	byte	85
	byte	170
	byte	run,0x80+2
	byte	160
	byte	88
	byte	86
	byte	85
	byte	170
	byte	run,0x80+5
	byte	128
	byte	run,0x80+2




