;---------------------------------------
;
;	animation cel data
;

knife2_data::
	byte	at_side	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,253

	byte	0b10000000

	word	knife2_data_a - knife2_data


knife2_data_a:
	byte	0x06, 0x09, 0x00, 0xfb, 0x00, 0x00
	byte	run,0x80+2
	byte	run,5,2
	byte	run,0x80+4
	byte	128
	byte	run,3,170
	byte	run,0x80+3
	byte	128
	byte	128
	byte	170
	byte	149
	byte	170
	byte	149
	byte	170
	byte	128
	byte	128
	byte	run,0x80+2
	byte	170
	byte	85
	byte	165
	byte	85
	byte	170
	byte	run,0x80+4
	byte	168
	byte	86
	byte	85
	byte	86
	byte	168
	byte	run,0x80+6
	byte	128
	byte	run,0x80+4




