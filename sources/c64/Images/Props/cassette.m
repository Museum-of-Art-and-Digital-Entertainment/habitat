;---------------------------------------
;
;	animation cel data
;

cassette_data::
	byte	swing	+ 0
	byte	0b00000000
	byte	no_animation
	byte	no_cont

	byte	240+right,24+left,255

	byte	0b10000000

	word	cassette_data_a - cassette_data


cassette_data_a:
	byte	0x03, 0x07, 0x00, 0xfe, 0x00, 0x00

	byte	2
	byte	run,5,9
	byte	2
	byte	170
	byte	169
	byte	85
	byte	153
	byte	85
	byte	85
	byte	170
	byte	run,0x80+1
	byte	run,5,128
	byte	run,0x80+1




